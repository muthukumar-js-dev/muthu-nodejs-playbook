<div align="center">

# Node.js Production Playbook
### From Internals to Production Systems

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Documentation](https://img.shields.io/badge/Documentation-Read%20Now-blue.svg)](https://muthukumar-js-dev.github.io/muthu-nodejs-playbook/)
[![Buy Me A Coffee](https://img.shields.io/badge/Buy%20Me%20A%20Coffee-Donate-orange.svg)](https://www.buymeacoffee.com/muthukumar)

<br />

[**Explore the Documentation »**](https://muthukumar-js-dev.github.io/muthu-nodejs-playbook/)

<br />

</div>

## What this repository is

This repository exists to bridge the gap between knowing Node.js syntax and understanding how to build production-grade systems. It focuses on the "missing manual" for senior engineers—the architectural decisions, trade-offs, and failure modes that aren't covered in basic tutorials.

It fills the gap for engineers who know *how* to write code but want to understand *why* systems behave the way they do under load. It prioritizes mental models and system design over API references.

## What this repository is NOT

- **Not a beginner guide**: We assume you know JavaScript promises, basic Express, and SQL.
- **Not framework documentation**: The concepts here apply whether you use NestJS, Fastify, or vanilla Node.js.
- **Not copy-paste examples**: The code snippets are designed to illustrate concepts, not to be pasted into production without thought.

## Who this repository is for

- **Mid to Senior Backend Engineers** looking to deepen their understanding of Node.js internals and architecture.
- **Engineers preparing for system design interviews** who need to articulate trade-offs clearly.
- **Architects and Tech Leads** making high-level decisions about Node.js stacks (monorepo vs polyrepo, microservices vs monolith).

## Prerequisites

- **JavaScript Fundamentals**: Promises, async/await, closures, and ES6+ syntax.
- **Basic Node.js Usage**: Experience building a simple API or background worker.
- **Backend Concepts**: Basic understanding of HTTP, databases, and general web architecture.

*Note: You do not need a computer science degree or advanced math skills to master this content.*

## How to use this repository

- **Read sequentially or randomly**: Each section builds on the previous one, but topics are self-contained.
- **Slow, reflective reading**: This is high-density content. Read one topic, then think about how it applies to your current work.
- **Use the diagrams**: The Mermaid diagrams are critical for building mental models. Don't skip them.
- **Revisit for interviews**: Use these topics to practice explaining complex concepts simply.

## Repository structure

The content is organized into 10 sections, each focusing on a specific domain of production engineering. Each concept has its own dedicated markdown file to ensure depth and focus. This structure mirrors how we think about real systems: from low-level internals up to high-level architecture.

## Content philosophy

- **Imagination-first**: We use analogies and "mental models" to make abstract concepts concrete.
- **Production reality**: We focus on what actually breaks in production (memory leaks, event loop lag, connection exhaustion).
- **"When to use" vs "When NOT to use"**: Every pattern has trade-offs. We explicitly discuss when a pattern is a bad idea.
- **Reasoning over definitions**: We care more about *why* a decision was made than the textbook definition of a term.

## Complete Content Index

### 🧠 Node.js Internals
*Understanding how Node.js actually works under the hood.*

Folder: `/src/01-nodejs-internals/`

- [01 - Node.js Architecture (C++ + V8 + libuv)](src/01-nodejs-internals/01-nodejs-architecture.md)
- [02 - Event Loop – All Phases](src/01-nodejs-internals/02-event-loop.md)
- [03 - Microtasks vs Macrotasks](src/01-nodejs-internals/03-microtasks-vs-macrotasks.md)
- [04 - Call Stack and Heap](src/01-nodejs-internals/04-call-stack-and-heap.md)
- [05 - libuv Thread Pool](src/01-nodejs-internals/05-libuv-thread-pool.md)
- [06 - Blocking vs Non-Blocking I/O](src/01-nodejs-internals/06-blocking-vs-non-blocking-io.md)
- [07 - Backpressure and Stream Internals](src/01-nodejs-internals/07-backpressure-and-stream-internals.md)
- [08 - Memory Management and Garbage Collection](src/01-nodejs-internals/08-memory-management-and-garbage-collection.md)
- [09 - Process Lifecycle](src/01-nodejs-internals/09-process-lifecycle.md)
- [10 - Signals and Graceful Shutdown](src/01-nodejs-internals/10-signals-and-graceful-shutdown.md)

### ⚡ Async & Concurrency
*Mastering non-blocking operations and finding the right tool for the job.*

Folder: `/src/02-async-concurrency/`

- [11 - Callbacks, Promises, Async/Await](src/02-async-concurrency/11-callbacks-promises-async-await.md)
- [12 - Promise Queues and Starvation](src/02-async-concurrency/12-promise-queues-and-starvation.md)
- [13 - CPU-Bound vs I/O-Bound Tasks](src/02-async-concurrency/13-cpu-bound-vs-io-bound-tasks.md)
- [14 - Worker Threads](src/02-async-concurrency/14-worker-threads.md)
- [15 - Child Processes and Cluster Module](src/02-async-concurrency/15-child-processes-and-cluster-module.md)
- [16 - Mutex & Semaphore Patterns](src/02-async-concurrency/16-mutex-semaphore-patterns.md)
- [17 - Event Emitters Pitfalls](src/02-async-concurrency/17-event-emitters-pitfalls.md)
- [18 - Async Context Tracking](src/02-async-concurrency/18-async-context-tracking.md)

### 📡 Event-Driven Architecture
*Designing systems that react to change rather than just processing requests.*

Folder: `/src/03-event-driven-architecture/`

- [19 - Event-Driven vs Request-Driven](src/03-event-driven-architecture/19-event-driven-vs-request-driven.md)
- [20 - Pub/Sub Patterns](src/03-event-driven-architecture/20-pub-sub-patterns.md)
- [21 - Message Brokers](src/03-event-driven-architecture/21-message-brokers.md)
- [22 - At-Least-Once vs Exactly-Once](src/03-event-driven-architecture/22-at-least-once-vs-exactly-once.md)
- [23 - Idempotency](src/03-event-driven-architecture/23-idempotency.md)
- [24 - Event Versioning](src/03-event-driven-architecture/24-event-versioning.md)
- [25 - Schema Evolution](src/03-event-driven-architecture/25-schema-evolution.md)
- [26 - Event Replay and Recovery](src/03-event-driven-architecture/26-event-replay-and-recovery.md)
- [27 - Saga Pattern](src/03-event-driven-architecture/27-saga-pattern.md)
- [28 - CQRS](src/03-event-driven-architecture/28-cqrs.md)
- [29 - Distributed Transactions](src/03-event-driven-architecture/29-distributed-transactions.md)

### 🏗️ System Design
*Architecting scalable and resilient applications.*

Folder: `/src/04-system-design/`

- [30 - API Gateway Design](src/04-system-design/30-api-gateway-design.md)
- [31 - Monolith to Microservices](src/04-system-design/31-monolith-to-microservices.md)
- [32 - Service Communication](src/04-system-design/32-service-communication.md)
- [33 - Load Balancing Strategies](src/04-system-design/33-load-balancing-strategies.md)
- [34 - Horizontal vs Vertical Scaling](src/04-system-design/34-horizontal-vs-vertical-scaling.md)
- [35 - Stateless Services](src/04-system-design/35-stateless-services.md)
- [36 - Rate Limiting and Throttling](src/04-system-design/36-rate-limiting-and-throttling.md)
- [37 - Circuit Breaker](src/04-system-design/37-circuit-breaker.md)
- [38 - Bulkhead Pattern](src/04-system-design/38-bulkhead-pattern.md)
- [39 - Caching Strategies](src/04-system-design/39-caching-strategies.md)
- [40 - Session Management at Scale](src/04-system-design/40-session-management-at-scale.md)

### 💾 Data Layer & Performance
*Efficiently managing data, connections, and consistency.*

Folder: `/src/05-data-layer-performance/`

- [41 - Connection Pooling](src/05-data-layer-performance/41-connection-pooling.md)
- [42 - Read Replicas and Sharding](src/05-data-layer-performance/42-read-replicas-and-sharding.md)
- [43 - Write Amplification](src/05-data-layer-performance/43-write-amplification.md)
- [44 - Indexing Strategy](src/05-data-layer-performance/44-indexing-strategy.md)
- [45 - Eventual Consistency](src/05-data-layer-performance/45-eventual-consistency.md)
- [46 - Data Denormalization](src/05-data-layer-performance/46-data-denormalization.md)
- [47 - Transactions and Isolation Levels](src/05-data-layer-performance/47-transactions-and-isolation-levels.md)
- [48 - Handling Hot Keys](src/05-data-layer-performance/48-handling-hot-keys.md)
- [49 - Pagination Strategies](src/05-data-layer-performance/49-pagination-strategies.md)
- [50 - Time-Based Data Modeling](src/05-data-layer-performance/50-time-based-data-modeling.md)

### 🛡️ Security
*Protecting your application and users from modern threats.*

Folder: `/src/06-security/`

- [51 - Authentication vs Authorization](src/06-security/51-authentication-vs-authorization.md)
- [52 - JWT Internals and Pitfalls](src/06-security/52-jwt-internals-and-pitfalls.md)
- [53 - Token Rotation](src/06-security/53-token-rotation.md)
- [54 - OAuth Flows](src/06-security/54-oauth-flows.md)
- [55 - RBAC vs ABAC](src/06-security/55-rbac-vs-abac.md)
- [56 - Rate Limit Bypass Attacks](src/06-security/56-rate-limit-bypass-attacks.md)
- [57 - DoS Protection](src/06-security/57-dos-protection.md)
- [58 - Secrets Management](src/06-security/58-secrets-management.md)
- [59 - Secure Headers](src/06-security/59-secure-headers.md)
- [60 - Input Validation at Scale](src/06-security/60-input-validation-at-scale.md)

### ⚙️ Production Readiness
*Ensuring your system is observable, resilient, and maintainable.*

Folder: `/src/07-production-readiness/`

- [61 - Logging Strategy](src/07-production-readiness/61-logging-strategy.md)
- [62 - Distributed Tracing](src/07-production-readiness/62-distributed-tracing.md)
- [63 - Metrics and SLIs/SLOs](src/07-production-readiness/63-metrics-and-slis-slos.md)
- [64 - Health Checks](src/07-production-readiness/64-health-checks.md)
- [65 - Blue-Green and Canary Deployments](src/07-production-readiness/65-blue-green-and-canary-deployments.md)
- [66 - Feature Flags](src/07-production-readiness/66-feature-flags.md)
- [67 - Graceful Degradation](src/07-production-readiness/67-graceful-degradation.md)
- [68 - Chaos Testing Basics](src/07-production-readiness/68-chaos-testing-basics.md)
- [69 - Error Budgets](src/07-production-readiness/69-error-budgets.md)
- [70 - Postmortem Culture](src/07-production-readiness/70-postmortem-culture.md)

### 🧪 Testing & Reliability
*Building confidence in your code through rigorous verification.*

Folder: `/src/08-testing-reliability/`

- [71 - Unit vs Integration vs E2E](src/08-testing-reliability/71-unit-vs-integration-vs-e2e.md)
- [72 - Contract Testing](src/08-testing-reliability/72-contract-testing.md)
- [73 - Load Testing](src/08-testing-reliability/73-load-testing.md)
- [74 - Fault Injection](src/08-testing-reliability/74-fault-injection.md)
- [75 - Test Data Strategies](src/08-testing-reliability/75-test-data-strategies.md)
- [76 - Mocking Async Dependencies](src/08-testing-reliability/76-mocking-async-dependencies.md)

### 🛠️ Tooling & Ecosystem
*Leveraging the right tools for profiling, building, and deploying.*

Folder: `/src/09-tooling-ecosystem/`

- [77 - Node.js Performance Profiling](src/09-tooling-ecosystem/77-nodejs-performance-profiling.md)
- [78 - Heap Snapshots](src/09-tooling-ecosystem/78-heap-snapshots.md)
- [79 - CPU Flame Graphs](src/09-tooling-ecosystem/79-cpu-flame-graphs.md)
- [80 - PM2 vs Docker vs Kubernetes](src/09-tooling-ecosystem/80-pm2-vs-docker-vs-kubernetes.md)
- [81 - Env-Based Config](src/09-tooling-ecosystem/81-env-based-config.md)
- [82 - Build vs Runtime Config](src/09-tooling-ecosystem/82-build-vs-runtime-config.md)
- [83 - Monorepo Patterns](src/09-tooling-ecosystem/83-monorepo-patterns.md)
- [84 - CI/CD for Node.js](src/09-tooling-ecosystem/84-cicd-for-nodejs.md)

### 📘 TypeScript & Large Systems
*Scaling development with static typing and advanced patterns.*

Folder: `/src/10-typescript-large-systems/`

- [85 - TS Compiler Internals](src/10-typescript-large-systems/85-ts-compiler-internals.md)
- [86 - Advanced Generics](src/10-typescript-large-systems/86-advanced-generics.md)
- [87 - Type-Safe APIs](src/10-typescript-large-systems/87-type-safe-apis.md)
- [88 - Runtime Validation vs Compile-Time](src/10-typescript-large-systems/88-runtime-validation-vs-compile-time.md)
- [89 - Schema-Driven Development](src/10-typescript-large-systems/89-schema-driven-development.md)
- [90 - Migrating JS to TS Safely](src/10-typescript-large-systems/90-migrating-js-to-ts-safely.md)

## How this repository helps in interviews

- **Mental models changes interview answers**: Instead of memorizing "the event loop has 6 phases," you can explain *how* a slow regex blocks the loop and degrades throughput.
- **Trade-offs**: Senior interviews are about trade-offs. This repo gives you the vocabulary to discuss *why* you'd choose a monolith over microservices, or Eventual Consistency over ACID.
- **Confidence**: Understanding failure modes makes you confident in your designs.

## How this repository helps in real-world projects

- **Design before coding**: Use the System Design principles to whiteboard your architecture before writing a line of code.
- **Avoid common failures**: Learn about connection pool exhaustion and blocking the event loop *before* they cause an outage.
- **Make informed decisions**: Use the knowledge of "Strict Mode trade-offs" or "Monorepo patterns" to guide your team's technical strategy.

## How to contribute

We value contributions that clarify complex topics or add realistic production scenarios. Please focus on:
- **Clarity and intuition**: Can a mid-level engineer understand this?
- **Diagrams**: Improvements to Mermaid diagrams are highly valued.
- **Reasoning**: Explain *why*, not just *how*.

See [CONTRIBUTING.md](CONTRIBUTING.md) for full guidelines.

## Final note

Mastering Node.js is a journey. Use this playbook as your map, but remember that the territory (production) is always changing. Keep learning, keep questioning, and think in systems.

<div align="center">

## Support the Author

If you found this playbook helpful, consider buying me a coffee! ☕

<a href="https://www.buymeacoffee.com/muthukumar">
  <img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" alt="Buy Me A Coffee" width="200" />
</a>

</div>