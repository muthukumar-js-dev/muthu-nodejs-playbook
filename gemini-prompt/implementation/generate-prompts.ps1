# Topic data structure
$topics = @(
    # Section C: Event-Driven Architecture (19-29)
    @{Section="C. Event-Driven Architecture (Core Strength Area)"; SectionSlug="03-event-driven-architecture"; Index=20; Name="Pub/Sub patterns"; Slug="pub-sub-patterns"},
    @{Section="C. Event-Driven Architecture (Core Strength Area)"; SectionSlug="03-event-driven-architecture"; Index=21; Name="Message Brokers (Kafka / RabbitMQ / Redis Streams)"; Slug="message-brokers"},
    @{Section="C. Event-Driven Architecture (Core Strength Area)"; SectionSlug="03-event-driven-architecture"; Index=22; Name="At-least-once vs Exactly-once delivery"; Slug="at-least-once-vs-exactly-once"},
    @{Section="C. Event-Driven Architecture (Core Strength Area)"; SectionSlug="03-event-driven-architecture"; Index=23; Name="Idempotency"; Slug="idempotency"},
    @{Section="C. Event-Driven Architecture (Core Strength Area)"; SectionSlug="03-event-driven-architecture"; Index=24; Name="Event Versioning"; Slug="event-versioning"},
    @{Section="C. Event-Driven Architecture (Core Strength Area)"; SectionSlug="03-event-driven-architecture"; Index=25; Name="Schema evolution"; Slug="schema-evolution"},
    @{Section="C. Event-Driven Architecture (Core Strength Area)"; SectionSlug="03-event-driven-architecture"; Index=26; Name="Event replay & recovery"; Slug="event-replay-and-recovery"},
    @{Section="C. Event-Driven Architecture (Core Strength Area)"; SectionSlug="03-event-driven-architecture"; Index=27; Name="Saga Pattern"; Slug="saga-pattern"},
    @{Section="C. Event-Driven Architecture (Core Strength Area)"; SectionSlug="03-event-driven-architecture"; Index=28; Name="CQRS"; Slug="cqrs"},
    @{Section="C. Event-Driven Architecture (Core Strength Area)"; SectionSlug="03-event-driven-architecture"; Index=29; Name="Distributed transactions (without 2PC)"; Slug="distributed-transactions"},
    
    # Section D: System Design with Node.js (30-40)
    @{Section="D. System Design with Node.js"; SectionSlug="04-system-design"; Index=30; Name="API Gateway design"; Slug="api-gateway-design"},
    @{Section="D. System Design with Node.js"; SectionSlug="04-system-design"; Index=31; Name="Monolith → Modular Monolith → Microservices"; Slug="monolith-to-microservices"},
    @{Section="D. System Design with Node.js"; SectionSlug="04-system-design"; Index=32; Name="Service communication (Sync vs Async)"; Slug="service-communication"},
    @{Section="D. System Design with Node.js"; SectionSlug="04-system-design"; Index=33; Name="Load balancing strategies"; Slug="load-balancing-strategies"},
    @{Section="D. System Design with Node.js"; SectionSlug="04-system-design"; Index=34; Name="Horizontal vs Vertical scaling"; Slug="horizontal-vs-vertical-scaling"},
    @{Section="D. System Design with Node.js"; SectionSlug="04-system-design"; Index=35; Name="Stateless services"; Slug="stateless-services"},
    @{Section="D. System Design with Node.js"; SectionSlug="04-system-design"; Index=36; Name="Rate limiting & throttling"; Slug="rate-limiting-and-throttling"},
    @{Section="D. System Design with Node.js"; SectionSlug="04-system-design"; Index=37; Name="Circuit Breaker"; Slug="circuit-breaker"},
    @{Section="D. System Design with Node.js"; SectionSlug="04-system-design"; Index=38; Name="Bulkhead pattern"; Slug="bulkhead-pattern"},
    @{Section="D. System Design with Node.js"; SectionSlug="04-system-design"; Index=39; Name="Caching strategies (L1, L2, CDN)"; Slug="caching-strategies"},
    @{Section="D. System Design with Node.js"; SectionSlug="04-system-design"; Index=40; Name="Session management at scale"; Slug="session-management-at-scale"},
    
    # Section E: Data Layer & Performance (41-50)
    @{Section="E. Data Layer & Performance"; SectionSlug="05-data-layer-performance"; Index=41; Name="Connection pooling"; Slug="connection-pooling"},
    @{Section="E. Data Layer & Performance"; SectionSlug="05-data-layer-performance"; Index=42; Name="Read replicas & sharding"; Slug="read-replicas-and-sharding"},
    @{Section="E. Data Layer & Performance"; SectionSlug="05-data-layer-performance"; Index=43; Name="Write amplification"; Slug="write-amplification"},
    @{Section="E. Data Layer & Performance"; SectionSlug="05-data-layer-performance"; Index=44; Name="Indexing strategy"; Slug="indexing-strategy"},
    @{Section="E. Data Layer & Performance"; SectionSlug="05-data-layer-performance"; Index=45; Name="Eventual consistency"; Slug="eventual-consistency"},
    @{Section="E. Data Layer & Performance"; SectionSlug="05-data-layer-performance"; Index=46; Name="Data denormalization"; Slug="data-denormalization"},
    @{Section="E. Data Layer & Performance"; SectionSlug="05-data-layer-performance"; Index=47; Name="Transactions & isolation levels"; Slug="transactions-and-isolation-levels"},
    @{Section="E. Data Layer & Performance"; SectionSlug="05-data-layer-performance"; Index=48; Name="Handling hot keys"; Slug="handling-hot-keys"},
    @{Section="E. Data Layer & Performance"; SectionSlug="05-data-layer-performance"; Index=49; Name="Pagination strategies"; Slug="pagination-strategies"},
    @{Section="E. Data Layer & Performance"; SectionSlug="05-data-layer-performance"; Index=50; Name="Time-based data modeling"; Slug="time-based-data-modeling"},
    
    # Section F: Security (51-60)
    @{Section="F. Security (Senior-level expectation)"; SectionSlug="06-security"; Index=51; Name="Authentication vs Authorization"; Slug="authentication-vs-authorization"},
    @{Section="F. Security (Senior-level expectation)"; SectionSlug="06-security"; Index=52; Name="JWT internals & pitfalls"; Slug="jwt-internals-and-pitfalls"},
    @{Section="F. Security (Senior-level expectation)"; SectionSlug="06-security"; Index=53; Name="Token rotation"; Slug="token-rotation"},
    @{Section="F. Security (Senior-level expectation)"; SectionSlug="06-security"; Index=54; Name="OAuth 2.0 flows"; Slug="oauth-flows"},
    @{Section="F. Security (Senior-level expectation)"; SectionSlug="06-security"; Index=55; Name="RBAC vs ABAC"; Slug="rbac-vs-abac"},
    @{Section="F. Security (Senior-level expectation)"; SectionSlug="06-security"; Index=56; Name="Rate-limit bypass attacks"; Slug="rate-limit-bypass-attacks"},
    @{Section="F. Security (Senior-level expectation)"; SectionSlug="06-security"; Index=57; Name="DOS protection"; Slug="dos-protection"},
    @{Section="F. Security (Senior-level expectation)"; SectionSlug="06-security"; Index=58; Name="Secrets management"; Slug="secrets-management"},
    @{Section="F. Security (Senior-level expectation)"; SectionSlug="06-security"; Index=59; Name="Secure headers"; Slug="secure-headers"},
    @{Section="F. Security (Senior-level expectation)"; SectionSlug="06-security"; Index=60; Name="Input validation at scale"; Slug="input-validation-at-scale"},
    
    # Section G: Production Readiness (61-70)
    @{Section="G. Production Readiness"; SectionSlug="07-production-readiness"; Index=61; Name="Logging strategy (structured logs)"; Slug="logging-strategy"},
    @{Section="G. Production Readiness"; SectionSlug="07-production-readiness"; Index=62; Name="Distributed tracing"; Slug="distributed-tracing"},
    @{Section="G. Production Readiness"; SectionSlug="07-production-readiness"; Index=63; Name="Metrics & SLIs/SLOs"; Slug="metrics-and-slis-slos"},
    @{Section="G. Production Readiness"; SectionSlug="07-production-readiness"; Index=64; Name="Health checks"; Slug="health-checks"},
    @{Section="G. Production Readiness"; SectionSlug="07-production-readiness"; Index=65; Name="Blue-Green & Canary deployments"; Slug="blue-green-and-canary-deployments"},
    @{Section="G. Production Readiness"; SectionSlug="07-production-readiness"; Index=66; Name="Feature flags"; Slug="feature-flags"},
    @{Section="G. Production Readiness"; SectionSlug="07-production-readiness"; Index=67; Name="Graceful degradation"; Slug="graceful-degradation"},
    @{Section="G. Production Readiness"; SectionSlug="07-production-readiness"; Index=68; Name="Chaos testing basics"; Slug="chaos-testing-basics"},
    @{Section="G. Production Readiness"; SectionSlug="07-production-readiness"; Index=69; Name="Error budgets"; Slug="error-budgets"},
    @{Section="G. Production Readiness"; SectionSlug="07-production-readiness"; Index=70; Name="Postmortem culture"; Slug="postmortem-culture"},
    
    # Section H: Testing & Reliability (71-76)
    @{Section="H. Testing & Reliability"; SectionSlug="08-testing-reliability"; Index=71; Name="Unit vs Integration vs E2E"; Slug="unit-vs-integration-vs-e2e"},
    @{Section="H. Testing & Reliability"; SectionSlug="08-testing-reliability"; Index=72; Name="Contract testing"; Slug="contract-testing"},
    @{Section="H. Testing & Reliability"; SectionSlug="08-testing-reliability"; Index=73; Name="Load testing"; Slug="load-testing"},
    @{Section="H. Testing & Reliability"; SectionSlug="08-testing-reliability"; Index=74; Name="Fault injection"; Slug="fault-injection"},
    @{Section="H. Testing & Reliability"; SectionSlug="08-testing-reliability"; Index=75; Name="Test data strategies"; Slug="test-data-strategies"},
    @{Section="H. Testing & Reliability"; SectionSlug="08-testing-reliability"; Index=76; Name="Mocking async dependencies"; Slug="mocking-async-dependencies"},
    
    # Section I: Tooling & Ecosystem (77-84)
    @{Section="I. Tooling & Ecosystem"; SectionSlug="09-tooling-ecosystem"; Index=77; Name="Node.js performance profiling"; Slug="nodejs-performance-profiling"},
    @{Section="I. Tooling & Ecosystem"; SectionSlug="09-tooling-ecosystem"; Index=78; Name="Heap snapshots"; Slug="heap-snapshots"},
    @{Section="I. Tooling & Ecosystem"; SectionSlug="09-tooling-ecosystem"; Index=79; Name="CPU flame graphs"; Slug="cpu-flame-graphs"},
    @{Section="I. Tooling & Ecosystem"; SectionSlug="09-tooling-ecosystem"; Index=80; Name="PM2 vs Docker vs Kubernetes"; Slug="pm2-vs-docker-vs-kubernetes"},
    @{Section="I. Tooling & Ecosystem"; SectionSlug="09-tooling-ecosystem"; Index=81; Name="Env-based config"; Slug="env-based-config"},
    @{Section="I. Tooling & Ecosystem"; SectionSlug="09-tooling-ecosystem"; Index=82; Name="Build vs runtime config"; Slug="build-vs-runtime-config"},
    @{Section="I. Tooling & Ecosystem"; SectionSlug="09-tooling-ecosystem"; Index=83; Name="Monorepo patterns"; Slug="monorepo-patterns"},
    @{Section="I. Tooling & Ecosystem"; SectionSlug="09-tooling-ecosystem"; Index=84; Name="CI/CD for Node.js"; Slug="cicd-for-nodejs"},
    
    # Section J: TypeScript for Large Systems (85-90)
    @{Section="J. TypeScript for Large Systems"; SectionSlug="10-typescript-large-systems"; Index=85; Name="TS Compiler internals (high-level)"; Slug="ts-compiler-internals"},
    @{Section="J. TypeScript for Large Systems"; SectionSlug="10-typescript-large-systems"; Index=86; Name="Advanced generics"; Slug="advanced-generics"},
    @{Section="J. TypeScript for Large Systems"; SectionSlug="10-typescript-large-systems"; Index=87; Name="Type-safe APIs"; Slug="type-safe-apis"},
    @{Section="J. TypeScript for Large Systems"; SectionSlug="10-typescript-large-systems"; Index=88; Name="Runtime validation vs compile-time"; Slug="runtime-validation-vs-compile-time"},
    @{Section="J. TypeScript for Large Systems"; SectionSlug="10-typescript-large-systems"; Index=89; Name="Schema-driven development"; Slug="schema-driven-development"},
    @{Section="J. TypeScript for Large Systems"; SectionSlug="10-typescript-large-systems"; Index=90; Name="Migrating JS → TS safely"; Slug="migrating-js-to-ts-safely"}
)

$template = @'
You are a senior Node.js architect, system designer, and mentor
with real production experience building large-scale backend systems.

Your role is to teach a highly capable student who:
- Learns best by connecting dots
- Builds mental models through real-world mapping
- Needs imagination, not tutorials
- Wants confidence to design, explain, and defend systems

--------------------------------------------------
INPUTS
--------------------------------------------------

SECTION_NAME:
{SECTION_NAME}

TOPIC_NAME:
{TOPIC_NAME}

TOPIC_INDEX:
{TOPIC_INDEX}

--------------------------------------------------
TASK
--------------------------------------------------

1. Create a folder for the section if it does not exist.
   Folder naming convention:
   /{{{{SECTION_INDEX}}}}-{{{{SECTION_SLUG}}}}/

   Example:
   /01-nodejs-internals/
   /02-async-concurrency/
   /03-event-driven-architecture/

2. Inside that folder, create a Markdown file:
   {{{{TOPIC_INDEX}}}}-{{{{TOPIC_SLUG}}}}.md

--------------------------------------------------
CONTENT PRINCIPLES (VERY IMPORTANT)
--------------------------------------------------

- Do NOT write like a tutorial or blog post
- Do NOT explain theory in isolation
- Always anchor concepts to real systems and real failures
- Teach through imagination, scenarios, and mental models
- Assume the reader is preparing for:
  - Senior interviews
  - System design discussions
  - Real product development

--------------------------------------------------
MANDATORY MARKDOWN STRUCTURE
--------------------------------------------------

# {{{{TOPIC_NAME}}}}

## 1. Why this exists (Real-world problem first)
Explain:
- What breaks in real systems without this concept
- What pain engineers actually face
- Use a real product example (SaaS, e-commerce, chat, audit system)

## 2. Mental model (build imagination)
Explain the concept using:
- Plain language
- Analogies (traffic, factory, office, restaurant, etc.)
- What is happening step-by-step in the system

## 3. How Node.js implements this internally
Explain:
- Event loop phases, libuv, V8, threads, queues (only what is relevant)
- What happens behind the scenes
- Where developers usually misunderstand things

## 4. Multiple diagrams (MANDATORY)
Provide:
- At least one high-level system diagram
- At least one internal flow diagram

Use:
- Mermaid diagrams (preferred)
OR
- ASCII diagrams if Mermaid is not suitable

Diagrams must help imagination, not decoration.

## 5. Where this is used in real projects
Explain:
- Which layers of a backend use this
- Concrete examples (API, background jobs, messaging, DB, cache)
- How senior engineers decide to use it

## 6. Where this should NOT be used
Explain:
- Misuse cases
- Performance traps
- Scalability risks
- Real examples of bad decisions

## 7. Failure modes & edge cases
Explain:
- What happens under load
- What happens during partial failures
- How this fails in production, not theory

## 8. Trade-offs & alternatives
Explain:
- What you gain
- What you sacrifice
- Alternatives and why they may be chosen instead

## 9. Interview-level articulation
Provide:
- How to explain this clearly in interviews
- Typical follow-up questions
- How to sound confident and practical

## 10. Key takeaways (engineer mindset)
Summarize:
- What to remember
- What decisions this enables
- How it connects to other Node.js concepts

--------------------------------------------------
TONE & DEPTH
--------------------------------------------------

- Write like a mentor explaining to a strong mid/senior engineer
- Be precise, calm, and confident
- Depth > breadth
- Clarity > jargon

--------------------------------------------------
OUTPUT
--------------------------------------------------

Output ONLY the final Markdown content.
Do NOT include explanations about how you generated it.
'@

$basePath = "D:\github\muthu-nodejs-playbook\gemini-prompt\implementation"

foreach ($topic in $topics) {
    $folderPath = Join-Path $basePath $topic.SectionSlug
    $filePath = Join-Path $folderPath "$($topic.Index)-$($topic.Slug).md"
    
    # Create folder if it doesn't exist
    if (-not (Test-Path $folderPath)) {
        New-Item -ItemType Directory -Path $folderPath -Force | Out-Null
    }
    
    # Generate content from template
    $content = $template -replace '{SECTION_NAME}', $topic.Section
    $content = $content -replace '{TOPIC_NAME}', $topic.Name
    $content = $content -replace '{TOPIC_INDEX}', $topic.Index
    
    # Write file
    Set-Content -Path $filePath -Value $content -Encoding UTF8
    Write-Host "Created: $filePath"
}

Write-Host "`nAll files created successfully!"
