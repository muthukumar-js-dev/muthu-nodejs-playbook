# Changelog

All notable changes to the Node.js Production Playbook will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

## [Unreleased]

### Added
- Comprehensive README with complete content index
- GitHub community standards (CONTRIBUTING.md, CODE_OF_CONDUCT.md)
- Issue templates for content suggestions, bug reports, and questions
- Pull request template
- Funding configuration (Buy Me a Coffee)
- .gitignore for Node.js projects

## [1.0.0] - 2026-01-02

### Added

#### Section 1: Node.js Internals (10 topics)
- Node.js Architecture (C++ + V8 + libuv)
- Event Loop – All Phases
- Microtasks vs Macrotasks
- Call Stack and Heap
- libuv Thread Pool
- Blocking vs Non-Blocking I/O
- Backpressure and Stream Internals
- Memory Management and Garbage Collection
- Process Lifecycle
- Signals and Graceful Shutdown

#### Section 2: Async & Concurrency (8 topics)
- Callbacks, Promises, Async/Await
- Promise Queues and Starvation
- CPU-Bound vs I/O-Bound Tasks
- Worker Threads
- Child Processes and Cluster Module
- Mutex & Semaphore Patterns
- Event Emitters Pitfalls
- Async Context Tracking

#### Section 3: Event-Driven Architecture (11 topics)
- Event-Driven vs Request-Driven
- Pub/Sub Patterns
- Message Brokers
- At-Least-Once vs Exactly-Once
- Idempotency
- Event Versioning
- Schema Evolution
- Event Replay and Recovery
- Saga Pattern
- CQRS
- Distributed Transactions

#### Section 4: System Design (11 topics)
- API Gateway Design
- Monolith to Microservices
- Service Communication
- Load Balancing Strategies
- Horizontal vs Vertical Scaling
- Stateless Services
- Rate Limiting and Throttling
- Circuit Breaker
- Bulkhead Pattern
- Caching Strategies
- Session Management at Scale

#### Section 5: Data Layer & Performance (10 topics)
- Connection Pooling
- Read Replicas and Sharding
- Write Amplification
- Indexing Strategy
- Eventual Consistency
- Data Denormalization
- Transactions and Isolation Levels
- Handling Hot Keys
- Pagination Strategies
- Time-Based Data Modeling

#### Section 6: Security (10 topics)
- Authentication Strategies
- JWT vs Session Tokens
- OAuth2 and OpenID Connect
- SQL Injection Prevention
- XSS and CSRF Protection
- Rate Limit Bypass Attacks
- Dependency Vulnerabilities
- Secrets Management
- Input Validation and Sanitization
- API Security Best Practices

#### Section 7: Production Readiness (10 topics)
- Logging Strategies
- Structured Logging
- Metrics and Monitoring
- Distributed Tracing
- Health Checks
- Zero-Downtime Deployments
- Feature Flags
- Error Handling Patterns
- Alerting and On-Call
- Capacity Planning

#### Section 8: Testing & Reliability (6 topics)
- Testing Pyramid
- Contract Testing
- Load Testing
- Fault Injection
- Test Data Strategies
- Mocking Async Dependencies

#### Section 9: Tooling & Ecosystem (8 topics)
- Debugging Production Issues
- Heap Snapshots
- CPU Profiling
- Package Management Strategies
- Monorepo vs Polyrepo
- Build Tools and Bundlers
- Linting and Code Quality
- CI/CD Pipelines

#### Section 10: TypeScript & Large Systems (6 topics)
- TypeScript Runtime Overhead
- Type Safety in APIs
- Generic Patterns
- Strict Mode Trade-offs
- Compile-Time vs Runtime
- Migrating JS to TS Safely

### Repository Structure
- Production-focused content philosophy
- Mental model-driven learning approach
- Comprehensive diagrams (4+ per topic)
- Real-world failure modes and trade-offs
- Interview and system design preparation focus

---

## How to Use This Changelog

- **Added**: New topics, sections, or features
- **Changed**: Updates to existing content
- **Deprecated**: Content marked for removal
- **Removed**: Deleted content
- **Fixed**: Corrections to errors or inaccuracies
- **Security**: Security-related updates

For detailed changes to specific topics, see individual commit messages and pull requests.
