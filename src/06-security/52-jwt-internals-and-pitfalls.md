# JWT internals and pitfalls

## 1. Why this exists (Real-world problem first)

You're running a microservices architecture with 20 services. Every service needs to verify user identity. Without JWT, you'd need:
- **Centralized session store**: Every service queries Redis/database for session validation. 10,000 requests/sec = 10,000 session lookups/sec. Redis becomes a bottleneck.
- **Shared database**: All services share a sessions table. Database connection pool exhausted, queries slow down.
- **Service-to-service calls**: Service A calls auth service to validate token. Extra network hop (50ms latency), auth service becomes single point of failure.

What breaks without understanding JWT internals:
- **Algorithm confusion attack**: Attacker changes `alg: RS256` to `alg: none`, removes signature. Server accepts unsigned token, grants access to any user.
- **Secret key exposure**: Developer commits JWT secret to GitHub. Attacker generates valid tokens for any user, full system compromise.
- **Token bloat**: Developer stores entire user object in JWT (10KB). Every request sends 10KB token, network bandwidth wasted, performance degrades.
- **No revocation**: User's account is compromised. Admin deletes user from database, but JWT is still valid for 24 hours. Attacker has 24 hours of access.

Real pain: A fintech API used `HS256` (symmetric) with a weak secret ("secret123"). An attacker brute-forced the secret in 2 hours, generated admin tokens, and transferred $500K before detection. The fix: switch to `RS256` (asymmetric) and rotate keys.

## 2. Mental model (build imagination)

Think of JWT as a **tamper-proof envelope** with a **letter inside** and a **wax seal**.

**Letter (Payload)**: Contains user info (user ID, role, expiration time). Anyone can read it—it's Base64-encoded, not encrypted.

**Wax seal (Signature)**: Proves the letter hasn't been tampered with. Only the person with the seal (secret key) can create valid seals.

**Envelope structure**:
```
[Header].[Payload].[Signature]
```

**How it works**:
1. **Server creates JWT**: Writes letter (payload), seals it with wax (signature using secret key)
2. **Client receives JWT**: Stores it (localStorage, cookie)
3. **Client sends JWT**: Includes it in every request (Authorization header)
4. **Server verifies JWT**: Checks wax seal (signature). If valid, trusts the letter (payload). No database lookup needed.

**Key insight**: JWT is **stateless**. The server doesn't store tokens. It only verifies the signature. This enables horizontal scaling—any server can verify any token.

## 3. How Node.js implements this internally

JWT libraries (`jsonwebtoken`, `jose`) implement signing and verification. Understanding the internals helps avoid pitfalls.

### JWT structure

```
eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEyMywicm9sZSI6ImFkbWluIiwiaWF0IjoxNjQwOTk1MjAwLCJleHAiOjE2NDA5OTg4MDB9.4Adcj0mCkZzT5m0FRqXzCg7FhVz8T1F8K5xPZqGzCjE
```

**Decoded**:
- **Header**: `{"alg":"HS256","typ":"JWT"}`
- **Payload**: `{"userId":123,"role":"admin","iat":1640995200,"exp":1640998800}`
- **Signature**: HMAC-SHA256(base64(header) + "." + base64(payload), secret)

### Signing (creating JWT)

```javascript
const jwt = require('jsonwebtoken');

const payload = { userId: 123, role: 'admin' };
const secret = process.env.JWT_SECRET; // Must be strong, random

const token = jwt.sign(payload, secret, {
  algorithm: 'HS256',
  expiresIn: '1h',
  issuer: 'myapp',
  audience: 'myapp-api',
});
```

**What happens**:
1. **Synchronous**: `jwt.sign()` is CPU-bound, runs on event loop
2. **Base64 encoding**: Header and payload are Base64URL-encoded (not encrypted!)
3. **HMAC-SHA256**: Signature is computed using secret key
4. **String concatenation**: `header.payload.signature`

**Event loop impact**: For high-traffic APIs (10,000 req/sec), signing 10,000 JWTs/sec can block the event loop. Consider caching tokens or using async signing.

### Verification (validating JWT)

```javascript
const jwt = require('jsonwebtoken');

try {
  const decoded = jwt.verify(token, secret, {
    algorithms: ['HS256'], // Whitelist allowed algorithms
    issuer: 'myapp',
    audience: 'myapp-api',
  });
  
  console.log(decoded); // { userId: 123, role: 'admin', iat: ..., exp: ... }
} catch (err) {
  if (err.name === 'TokenExpiredError') {
    console.error('Token expired');
  } else if (err.name === 'JsonWebTokenError') {
    console.error('Invalid token');
  }
}
```

**What happens**:
1. **Synchronous**: `jwt.verify()` is CPU-bound
2. **Split token**: Extract header, payload, signature
3. **Decode header**: Check algorithm
4. **Recompute signature**: HMAC-SHA256(header + payload, secret)
5. **Compare signatures**: If match, token is valid
6. **Check expiration**: If `exp` < now, throw `TokenExpiredError`

**Critical detail**: Verification is synchronous. For 10,000 req/sec, this is 10,000 synchronous CPU operations. Can block event loop.

### Asymmetric signing (RS256)

```javascript
const fs = require('fs');
const jwt = require('jsonwebtoken');

const privateKey = fs.readFileSync('private.pem');
const publicKey = fs.readFileSync('public.pem');

// Sign with private key
const token = jwt.sign({ userId: 123 }, privateKey, {
  algorithm: 'RS256',
  expiresIn: '1h',
});

// Verify with public key
const decoded = jwt.verify(token, publicKey, {
  algorithms: ['RS256'],
});
```

**Why RS256**:
- **Private key** signs tokens (only auth service has it)
- **Public key** verifies tokens (all services have it)
- **Benefit**: If public key is exposed, attacker can't create tokens (only verify)
- **Trade-off**: Slower than HS256 (RSA is CPU-intensive)

## 4. Multiple diagrams (MANDATORY)

### JWT structure

```mermaid
graph LR
    subgraph "JWT Token"
        H[Header<br/>eyJhbGc...] --> D[.]
        D --> P[Payload<br/>eyJ1c2Vy...] --> D2[.]
        D2 --> S[Signature<br/>4Adcj0m...]
    end
    
    H2[Decoded Header<br/>alg: HS256<br/>typ: JWT] -.Base64URL decode.-> H
    P2[Decoded Payload<br/>userId: 123<br/>role: admin<br/>exp: 1640998800] -.Base64URL decode.-> P
    S2[HMAC-SHA256<br/>header + payload + secret] -.Computed.-> S
    
    style H fill:#2196F3
    style P fill:#4CAF50
    style S fill:#FF9800
```

### JWT flow (HS256)

```mermaid
sequenceDiagram
    participant User
    participant API as Node.js API
    participant DB as Database
    
    Note over User,DB: Login (Create JWT)
    
    User->>API: POST /login (email, password)
    API->>DB: Verify credentials
    DB-->>API: User record
    API->>API: jwt.sign(payload, secret)
    API-->>User: JWT token
    
    Note over User,DB: Authenticated Request
    
    User->>API: GET /profile (with JWT)
    API->>API: jwt.verify(token, secret)
    alt Valid Token
        API->>API: Extract userId from payload
        API->>DB: SELECT * FROM users WHERE id = userId
        DB-->>API: User data
        API-->>User: Profile data
    else Invalid/Expired Token
        API-->>User: 401 Unauthorized
    end
```

### Algorithm confusion attack

```mermaid
graph TB
    subgraph "Legitimate Token (RS256)"
        L1[Header: alg: RS256] --> L2[Payload: userId: 123]
        L2 --> L3[Signature: RSA signature]
    end
    
    subgraph "Malicious Token (none)"
        M1[Header: alg: none] --> M2[Payload: userId: 1 admin]
        M2 --> M3[Signature: empty]
    end
    
    L3 --> V1{Server Verification}
    M3 --> V2{Server Verification}
    
    V1 --> |Verify with public key| R1[✅ Valid]
    V2 --> |No algorithm whitelist| R2[❌ Accepts unsigned token!]
    
    style L1 fill:#4CAF50
    style M1 fill:#F44336
    style R2 fill:#F44336
```

### HS256 vs RS256

```mermaid
graph TB
    subgraph "HS256 (Symmetric)"
        H1[Secret Key<br/>Shared by all services]
        H1 --> H2[Sign Token]
        H1 --> H3[Verify Token]
        
        H4[Problem: If one service is compromised,<br/>attacker can sign tokens]
    end
    
    subgraph "RS256 (Asymmetric)"
        R1[Private Key<br/>Only auth service]
        R2[Public Key<br/>All services]
        
        R1 --> R3[Sign Token]
        R2 --> R4[Verify Token]
        
        R5[Benefit: Compromised service can't sign tokens]
    end
    
    style H1 fill:#FF9800
    style H4 fill:#F44336
    style R1 fill:#4CAF50
    style R5 fill:#4CAF50
```

## 5. Where this is used in real projects

### Production JWT implementation with security best practices

```javascript
const jwt = require('jsonwebtoken');
const crypto = require('crypto');

// Generate strong secret (do this once, store in env)
const generateSecret = () => crypto.randomBytes(64).toString('hex');

// Sign JWT with security best practices
function createToken(user) {
  const payload = {
    userId: user.id,
    role: user.role,
    // Don't include sensitive data (password, SSN, etc.)
  };
  
  return jwt.sign(payload, process.env.JWT_SECRET, {
    algorithm: 'HS256', // Explicitly set algorithm
    expiresIn: '1h',    // Short expiration
    issuer: 'myapp',    // Prevent token reuse across apps
    audience: 'myapp-api',
    jwtid: crypto.randomUUID(), // Unique token ID for revocation
    notBefore: '0', // Token valid immediately
  });
}

// Verify JWT with security best practices
function verifyToken(token) {
  try {
    return jwt.verify(token, process.env.JWT_SECRET, {
      algorithms: ['HS256'], // Whitelist algorithms (prevent algorithm confusion)
      issuer: 'myapp',
      audience: 'myapp-api',
      clockTolerance: 30, // Allow 30s clock skew
    });
  } catch (err) {
    if (err.name === 'TokenExpiredError') {
      throw new Error('Token expired');
    } else if (err.name === 'JsonWebTokenError') {
      throw new Error('Invalid token');
    } else if (err.name === 'NotBeforeError') {
      throw new Error('Token not yet valid');
    }
    throw err;
  }
}
```

### Middleware with token refresh

```javascript
const express = require('express');
const app = express();

// Authentication middleware
function authenticate(req, res, next) {
  const authHeader = req.headers.authorization;
  
  if (!authHeader || !authHeader.startsWith('Bearer ')) {
    return res.status(401).json({ error: 'No token provided' });
  }
  
  const token = authHeader.substring(7);
  
  try {
    const decoded = verifyToken(token);
    req.user = decoded;
    
    // Check if token expires soon, issue refresh token
    const expiresIn = decoded.exp - Math.floor(Date.now() / 1000);
    if (expiresIn < 300) { // Less than 5 minutes
      const newToken = createToken({ id: decoded.userId, role: decoded.role });
      res.setHeader('X-New-Token', newToken);
    }
    
    next();
  } catch (err) {
    return res.status(401).json({ error: err.message });
  }
}

// Protected route
app.get('/api/profile', authenticate, async (req, res) => {
  const user = await db.query('SELECT * FROM users WHERE id = $1', [req.user.userId]);
  res.json(user.rows[0]);
});
```

### Token revocation with blacklist

```javascript
const Redis = require('ioredis');
const redis = new Redis();

// Revoke token (e.g., on logout or password change)
async function revokeToken(token) {
  const decoded = jwt.decode(token);
  const ttl = decoded.exp - Math.floor(Date.now() / 1000);
  
  if (ttl > 0) {
    // Store token ID in Redis with TTL
    await redis.setex(`blacklist:${decoded.jti}`, ttl, '1');
  }
}

// Check if token is revoked
async function isTokenRevoked(token) {
  const decoded = jwt.decode(token);
  const revoked = await redis.get(`blacklist:${decoded.jti}`);
  return revoked === '1';
}

// Middleware: Check blacklist
function authenticate(req, res, next) {
  const token = req.headers.authorization?.substring(7);
  
  try {
    const decoded = verifyToken(token);
    
    // Check if token is blacklisted
    isTokenRevoked(token).then(revoked => {
      if (revoked) {
        return res.status(401).json({ error: 'Token revoked' });
      }
      
      req.user = decoded;
      next();
    });
  } catch (err) {
    return res.status(401).json({ error: err.message });
  }
}

// Logout endpoint
app.post('/logout', authenticate, async (req, res) => {
  const token = req.headers.authorization.substring(7);
  await revokeToken(token);
  res.json({ message: 'Logged out' });
});
```

### RS256 implementation for microservices

```javascript
const fs = require('fs');
const jwt = require('jsonwebtoken');

// Auth service: Sign with private key
const privateKey = fs.readFileSync('/secrets/jwt-private.pem');

function createToken(user) {
  return jwt.sign(
    { userId: user.id, role: user.role },
    privateKey,
    { algorithm: 'RS256', expiresIn: '1h' }
  );
}

// Other services: Verify with public key
const publicKey = fs.readFileSync('/secrets/jwt-public.pem');

function verifyToken(token) {
  return jwt.verify(token, publicKey, {
    algorithms: ['RS256'], // Only allow RS256
  });
}

// Middleware
function authenticate(req, res, next) {
  const token = req.headers.authorization?.substring(7);
  
  try {
    req.user = verifyToken(token);
    next();
  } catch (err) {
    return res.status(401).json({ error: 'Invalid token' });
  }
}
```

### Token size optimization

```javascript
// BAD: Large token (10KB)
const badToken = jwt.sign({
  userId: 123,
  email: 'user@example.com',
  name: 'John Doe',
  address: '123 Main St',
  phone: '555-1234',
  preferences: { theme: 'dark', language: 'en' },
  permissions: ['read:all', 'write:all', 'delete:all'],
  metadata: { createdAt: '2024-01-01', lastLogin: '2024-01-02' },
}, secret);

// GOOD: Minimal token (1KB)
const goodToken = jwt.sign({
  sub: 123, // Standard claim for user ID
  rol: 'admin', // Abbreviated role
  // Fetch other data from database when needed
}, secret, { expiresIn: '1h' });
```

## 6. Where this should NOT be used

### Storing sensitive data in JWT

```javascript
// BAD: Sensitive data in JWT
const token = jwt.sign({
  userId: 123,
  password: 'secret123', // NEVER!
  ssn: '123-45-6789',    // NEVER!
  creditCard: '4111111111111111', // NEVER!
}, secret);

// Anyone can decode the token and see this data!
const decoded = jwt.decode(token);
console.log(decoded.password); // 'secret123'
```

### Long-lived tokens without refresh mechanism

```javascript
// BAD: 30-day token with no refresh
const token = jwt.sign({ userId: 123 }, secret, { expiresIn: '30d' });

// If token is stolen, attacker has 30 days of access
// If user's permissions change, token is still valid for 30 days
```

### Using JWT for session management

```javascript
// BAD: Storing session data in JWT
const token = jwt.sign({
  userId: 123,
  cart: [{ productId: 1, quantity: 2 }, { productId: 2, quantity: 1 }],
  lastPage: '/products/123',
}, secret);

// Token grows with every cart update
// Can't invalidate token without blacklist
```

**Better**: Use sessions (Redis) for mutable state, JWT for authentication only.

### Accepting unsigned tokens (algorithm: none)

```javascript
// BAD: No algorithm whitelist
const decoded = jwt.verify(token, secret);

// Attacker can set alg: none and remove signature
// Server accepts unsigned token!

// GOOD: Whitelist algorithms
const decoded = jwt.verify(token, secret, {
  algorithms: ['HS256'], // Only allow HS256
});
```

## 7. Failure modes & edge cases

### Algorithm confusion attack

**Scenario**: Server uses RS256 (asymmetric). Attacker changes `alg` to `HS256` (symmetric) and signs token with public key (which is public).

**Impact**: Server verifies token using public key as HMAC secret. Token is valid. Attacker can create tokens for any user.

**Solution**: Whitelist algorithms in `jwt.verify()`.

```javascript
// Vulnerable
jwt.verify(token, publicKey); // Accepts any algorithm

// Secure
jwt.verify(token, publicKey, { algorithms: ['RS256'] }); // Only RS256
```

### Token replay attack

**Scenario**: Attacker intercepts valid token, uses it to make requests.

**Impact**: Attacker can impersonate user until token expires.

**Solution**: Use short expiration times, HTTPS only, and implement token binding (tie token to IP or device).

### Secret key exposure

**Scenario**: Developer commits JWT secret to GitHub.

**Impact**: Anyone can generate valid tokens for any user.

**Solution**: 
- Use environment variables
- Rotate secrets regularly
- Use strong, random secrets (64+ characters)

```javascript
// Generate strong secret
const crypto = require('crypto');
const secret = crypto.randomBytes(64).toString('hex');
console.log(secret); // Store in .env
```

### Token size explosion

**Scenario**: Developer stores large objects in JWT (user preferences, permissions, metadata).

**Impact**: Every request sends 10KB+ token. Network bandwidth wasted, performance degrades.

**Solution**: Store only essential claims (user ID, role). Fetch other data from database.

### Clock skew

**Scenario**: Server A issues token at 12:00:00. Server B's clock is 12:00:05 (5 seconds ahead). Token has `nbf` (not before) claim of 12:00:00. Server B rejects token as "not yet valid".

**Impact**: Intermittent authentication failures.

**Solution**: Use `clockTolerance` option in `jwt.verify()`.

```javascript
jwt.verify(token, secret, {
  clockTolerance: 30, // Allow 30s clock skew
});
```

### Token without expiration

**Scenario**: Developer forgets to set `expiresIn`.

**Impact**: Token is valid forever. If stolen, attacker has permanent access.

**Solution**: Always set `expiresIn`. Use short expiration (1 hour) with refresh tokens.

## 8. Trade-offs & alternatives

### What you gain
- **Stateless**: No session storage, scales horizontally
- **Decentralized**: Any service can verify tokens without calling auth service
- **Cross-domain**: Works across subdomains and different origins

### What you sacrifice
- **No revocation**: Can't invalidate tokens without blacklist (adds state)
- **Token size**: Larger than session IDs (1KB vs 32 bytes)
- **Exposure risk**: Tokens contain user data (Base64-encoded, not encrypted)

### Alternatives

**Session-based authentication**
- **Use case**: Traditional web apps, need instant revocation
- **Benefit**: Server controls session lifecycle, can revoke instantly
- **Trade-off**: Requires session storage (Redis), doesn't scale horizontally as easily

**Opaque tokens (random strings)**
- **Use case**: When you need revocation without blacklist
- **Benefit**: Server stores token metadata, can revoke by deleting from database
- **Trade-off**: Every request requires database lookup (slower)

**Macaroons (Google's approach)**
- **Use case**: Delegated authorization with caveats
- **Benefit**: Can add restrictions to tokens without re-signing
- **Trade-off**: More complex, less widely adopted

**Paseto (Platform-Agnostic Security Tokens)**
- **Use case**: Alternative to JWT with better security defaults
- **Benefit**: No algorithm confusion, versioned, encrypted by default
- **Trade-off**: Less ecosystem support

## 9. Interview-level articulation

**Question**: "How does JWT work and what are its security pitfalls?"

**Weak answer**: "JWT is a token with user data. It's signed so it can't be tampered with."

**Strong answer**: "JWT is a stateless authentication token with three parts: header (algorithm), payload (claims like user ID), and signature (HMAC or RSA). The server signs the token with a secret key, and clients include it in requests. The server verifies the signature without database lookups, enabling horizontal scaling. Key pitfalls: algorithm confusion (attacker changes alg to 'none'), secret exposure (weak or leaked secrets), token bloat (storing too much data), and no revocation (tokens valid until expiration). I mitigate these by whitelisting algorithms, using strong secrets, keeping payloads minimal, and implementing token blacklists for revocation."

**Follow-up**: "What's the difference between HS256 and RS256?"

**Answer**: "HS256 is symmetric—the same secret key signs and verifies tokens. It's fast but risky in microservices because every service needs the secret. If one service is compromised, attackers can create tokens. RS256 is asymmetric—a private key signs tokens (only auth service has it), and a public key verifies them (all services have it). If a service is compromised, attackers can verify tokens but can't create them. RS256 is slower due to RSA cryptography but more secure for distributed systems. I use HS256 for monoliths and RS256 for microservices."

**Follow-up**: "How do you revoke a JWT?"

**Answer**: "JWTs are stateless, so you can't revoke them directly. The common approach is a token blacklist: store revoked token IDs in Redis with TTL equal to token expiration. On every request, check if the token ID is blacklisted. This adds state but allows revocation. Alternatively, use short-lived access tokens (15 minutes) with long-lived refresh tokens. When you revoke a refresh token, the access token expires soon anyway. For critical actions (password change, account deletion), I invalidate all tokens by incrementing a user version number and including it in the JWT—old tokens with outdated versions are rejected."

## 10. Key takeaways (engineer mindset)

**What to remember**:
- **JWT is stateless**—no database lookup needed for verification
- **Payload is Base64-encoded, not encrypted**—don't store sensitive data
- **Always whitelist algorithms** to prevent algorithm confusion attacks
- **Use short expiration times** (1 hour) with refresh tokens
- **RS256 for microservices**, HS256 for monoliths

**What decisions this enables**:
- Choosing between JWT, sessions, or opaque tokens
- Designing token refresh and revocation strategies
- Implementing secure signing and verification
- Balancing token size vs payload richness

**How it connects to other Node.js concepts**:
- **Event loop**: JWT signing/verification is synchronous CPU work—can block event loop
- **Middleware**: JWT verification is typically implemented as Express middleware
- **Error handling**: Must handle TokenExpiredError, JsonWebTokenError separately
- **Observability**: Log token creation, verification failures, and revocations
- **Security headers**: Use HTTPS only, HttpOnly cookies to prevent XSS token theft
