import { defineConfig } from 'vitepress'
import { withMermaid } from 'vitepress-plugin-mermaid'

export default withMermaid(defineConfig({
  title: 'Node.js Production Playbook',
  description: 'Production-focused playbook for building scalable Node.js backend systems',
  

  
  base: '/muthu-nodejs-playbook/',
  
  themeConfig: {
    logo: '/logo.svg',
    
    nav: [
      { text: 'Home', link: '/' },
      { text: 'Guide', link: '/guide/getting-started' },
      { text: 'GitHub', link: 'https://github.com/muthukumar-js-dev/muthu-nodejs-playbook' }
    ],

    sidebar: [
      {
        text: 'Introduction',
        items: [
          { text: 'Getting Started', link: '/guide/getting-started' },
          { text: 'How to Use', link: '/guide/how-to-use' },
          { text: 'Contributing', link: '/guide/contributing' }
        ]
      },
      {
        text: '1. Node.js Internals',
        collapsed: false,
        items: [
          { text: '01 - Node.js Architecture', link: '/sections/01-nodejs-internals/01-nodejs-architecture' },
          { text: '02 - Event Loop', link: '/sections/01-nodejs-internals/02-event-loop' },
          { text: '03 - Microtasks vs Macrotasks', link: '/sections/01-nodejs-internals/03-microtasks-vs-macrotasks' },
          { text: '04 - Call Stack and Heap', link: '/sections/01-nodejs-internals/04-call-stack-and-heap' },
          { text: '05 - libuv Thread Pool', link: '/sections/01-nodejs-internals/05-libuv-thread-pool' },
          { text: '06 - Blocking vs Non-Blocking I/O', link: '/sections/01-nodejs-internals/06-blocking-vs-non-blocking-io' },
          { text: '07 - Backpressure and Stream Internals', link: '/sections/01-nodejs-internals/07-backpressure-and-stream-internals' },
          { text: '08 - Memory Management and GC', link: '/sections/01-nodejs-internals/08-memory-management-and-garbage-collection' },
          { text: '09 - Process Lifecycle', link: '/sections/01-nodejs-internals/09-process-lifecycle' },
          { text: '10 - Signals and Graceful Shutdown', link: '/sections/01-nodejs-internals/10-signals-and-graceful-shutdown' }
        ]
      },
      {
        text: '2. Async & Concurrency',
        collapsed: true,
        items: [
          { text: '11 - Callbacks, Promises, Async/Await', link: '/sections/02-async-concurrency/11-callbacks-promises-async-await' },
          { text: '12 - Promise Queues and Starvation', link: '/sections/02-async-concurrency/12-promise-queues-and-starvation' },
          { text: '13 - CPU-Bound vs I/O-Bound Tasks', link: '/sections/02-async-concurrency/13-cpu-bound-vs-io-bound-tasks' },
          { text: '14 - Worker Threads', link: '/sections/02-async-concurrency/14-worker-threads' },
          { text: '15 - Child Processes and Cluster', link: '/sections/02-async-concurrency/15-child-processes-and-cluster-module' },
          { text: '16 - Mutex & Semaphore Patterns', link: '/sections/02-async-concurrency/16-mutex-semaphore-patterns' },
          { text: '17 - Event Emitters Pitfalls', link: '/sections/02-async-concurrency/17-event-emitters-pitfalls' },
          { text: '18 - Async Context Tracking', link: '/sections/02-async-concurrency/18-async-context-tracking' }
        ]
      },
      {
        text: '3. Event-Driven Architecture',
        collapsed: true,
        items: [
          { text: '19 - Event-Driven vs Request-Driven', link: '/sections/03-event-driven-architecture/19-event-driven-vs-request-driven' },
          { text: '20 - Pub/Sub Patterns', link: '/sections/03-event-driven-architecture/20-pub-sub-patterns' },
          { text: '21 - Message Brokers', link: '/sections/03-event-driven-architecture/21-message-brokers' },
          { text: '22 - At-Least-Once vs Exactly-Once', link: '/sections/03-event-driven-architecture/22-at-least-once-vs-exactly-once' },
          { text: '23 - Idempotency', link: '/sections/03-event-driven-architecture/23-idempotency' },
          { text: '24 - Event Versioning', link: '/sections/03-event-driven-architecture/24-event-versioning' },
          { text: '25 - Schema Evolution', link: '/sections/03-event-driven-architecture/25-schema-evolution' },
          { text: '26 - Event Replay and Recovery', link: '/sections/03-event-driven-architecture/26-event-replay-and-recovery' },
          { text: '27 - Saga Pattern', link: '/sections/03-event-driven-architecture/27-saga-pattern' },
          { text: '28 - CQRS', link: '/sections/03-event-driven-architecture/28-cqrs' },
          { text: '29 - Distributed Transactions', link: '/sections/03-event-driven-architecture/29-distributed-transactions' }
        ]
      },
      {
        text: '4. System Design',
        collapsed: true,
        items: [
          { text: '30 - API Gateway Design', link: '/sections/04-system-design/30-api-gateway-design' },
          { text: '31 - Monolith to Microservices', link: '/sections/04-system-design/31-monolith-to-microservices' },
          { text: '32 - Service Communication', link: '/sections/04-system-design/32-service-communication' },
          { text: '33 - Load Balancing Strategies', link: '/sections/04-system-design/33-load-balancing-strategies' },
          { text: '34 - Horizontal vs Vertical Scaling', link: '/sections/04-system-design/34-horizontal-vs-vertical-scaling' },
          { text: '35 - Stateless Services', link: '/sections/04-system-design/35-stateless-services' },
          { text: '36 - Rate Limiting and Throttling', link: '/sections/04-system-design/36-rate-limiting-and-throttling' },
          { text: '37 - Circuit Breaker', link: '/sections/04-system-design/37-circuit-breaker' },
          { text: '38 - Bulkhead Pattern', link: '/sections/04-system-design/38-bulkhead-pattern' },
          { text: '39 - Caching Strategies', link: '/sections/04-system-design/39-caching-strategies' },
          { text: '40 - Session Management at Scale', link: '/sections/04-system-design/40-session-management-at-scale' }
        ]
      },
      {
        text: '5. Data Layer & Performance',
        collapsed: true,
        items: [
          { text: '41 - Connection Pooling', link: '/sections/05-data-layer-performance/41-connection-pooling' },
          { text: '42 - Read Replicas and Sharding', link: '/sections/05-data-layer-performance/42-read-replicas-and-sharding' },
          { text: '43 - Write Amplification', link: '/sections/05-data-layer-performance/43-write-amplification' },
          { text: '44 - Indexing Strategy', link: '/sections/05-data-layer-performance/44-indexing-strategy' },
          { text: '45 - Eventual Consistency', link: '/sections/05-data-layer-performance/45-eventual-consistency' },
          { text: '46 - Data Denormalization', link: '/sections/05-data-layer-performance/46-data-denormalization' },
          { text: '47 - Transactions and Isolation Levels', link: '/sections/05-data-layer-performance/47-transactions-and-isolation-levels' },
          { text: '48 - Handling Hot Keys', link: '/sections/05-data-layer-performance/48-handling-hot-keys' },
          { text: '49 - Pagination Strategies', link: '/sections/05-data-layer-performance/49-pagination-strategies' },
          { text: '50 - Time-Based Data Modeling', link: '/sections/05-data-layer-performance/50-time-based-data-modeling' }
        ]
      },
      {
        text: '6. Security',
        collapsed: true,
        items: [
          { text: '51 - Authentication Strategies', link: '/sections/06-security/51-authentication-strategies' },
          { text: '52 - JWT vs Session Tokens', link: '/sections/06-security/52-jwt-vs-session-tokens' },
          { text: '53 - OAuth2 and OpenID Connect', link: '/sections/06-security/53-oauth2-and-openid-connect' },
          { text: '54 - SQL Injection Prevention', link: '/sections/06-security/54-sql-injection-prevention' },
          { text: '55 - XSS and CSRF Protection', link: '/sections/06-security/55-xss-and-csrf-protection' },
          { text: '56 - Rate Limit Bypass Attacks', link: '/sections/06-security/56-rate-limit-bypass-attacks' },
          { text: '57 - Dependency Vulnerabilities', link: '/sections/06-security/57-dependency-vulnerabilities' },
          { text: '58 - Secrets Management', link: '/sections/06-security/58-secrets-management' },
          { text: '59 - Input Validation and Sanitization', link: '/sections/06-security/59-input-validation-and-sanitization' },
          { text: '60 - API Security Best Practices', link: '/sections/06-security/60-api-security-best-practices' }
        ]
      },
      {
        text: '7. Production Readiness',
        collapsed: true,
        items: [
          { text: '61 - Logging Strategies', link: '/sections/07-production-readiness/61-logging-strategies' },
          { text: '62 - Structured Logging', link: '/sections/07-production-readiness/62-structured-logging' },
          { text: '63 - Metrics and Monitoring', link: '/sections/07-production-readiness/63-metrics-and-monitoring' },
          { text: '64 - Distributed Tracing', link: '/sections/07-production-readiness/64-distributed-tracing' },
          { text: '65 - Health Checks', link: '/sections/07-production-readiness/65-health-checks' },
          { text: '66 - Zero-Downtime Deployments', link: '/sections/07-production-readiness/66-zero-downtime-deployments' },
          { text: '67 - Feature Flags', link: '/sections/07-production-readiness/67-feature-flags' },
          { text: '68 - Error Handling Patterns', link: '/sections/07-production-readiness/68-error-handling-patterns' },
          { text: '69 - Alerting and On-Call', link: '/sections/07-production-readiness/69-alerting-and-on-call' },
          { text: '70 - Capacity Planning', link: '/sections/07-production-readiness/70-capacity-planning' }
        ]
      },
      {
        text: '8. Testing & Reliability',
        collapsed: true,
        items: [
          { text: '71 - Testing Pyramid', link: '/sections/08-testing-reliability/71-testing-pyramid' },
          { text: '72 - Contract Testing', link: '/sections/08-testing-reliability/72-contract-testing' },
          { text: '73 - Load Testing', link: '/sections/08-testing-reliability/73-load-testing' },
          { text: '74 - Fault Injection', link: '/sections/08-testing-reliability/74-fault-injection' },
          { text: '75 - Test Data Strategies', link: '/sections/08-testing-reliability/75-test-data-strategies' },
          { text: '76 - Mocking Async Dependencies', link: '/sections/08-testing-reliability/76-mocking-async-dependencies' }
        ]
      },
      {
        text: '9. Tooling & Ecosystem',
        collapsed: true,
        items: [
          { text: '77 - Debugging Production Issues', link: '/sections/09-tooling-ecosystem/77-debugging-production-issues' },
          { text: '78 - Heap Snapshots', link: '/sections/09-tooling-ecosystem/78-heap-snapshots' },
          { text: '79 - CPU Profiling', link: '/sections/09-tooling-ecosystem/79-cpu-profiling' },
          { text: '80 - Package Management Strategies', link: '/sections/09-tooling-ecosystem/80-package-management-strategies' },
          { text: '81 - Monorepo vs Polyrepo', link: '/sections/09-tooling-ecosystem/81-monorepo-vs-polyrepo' },
          { text: '82 - Build Tools and Bundlers', link: '/sections/09-tooling-ecosystem/82-build-tools-and-bundlers' },
          { text: '83 - Linting and Code Quality', link: '/sections/09-tooling-ecosystem/83-linting-and-code-quality' },
          { text: '84 - CI/CD Pipelines', link: '/sections/09-tooling-ecosystem/84-ci-cd-pipelines' }
        ]
      },
      {
        text: '10. TypeScript & Large Systems',
        collapsed: true,
        items: [
          { text: '85 - TypeScript Runtime Overhead', link: '/sections/10-typescript-large-systems/85-typescript-runtime-overhead' },
          { text: '86 - Type Safety in APIs', link: '/sections/10-typescript-large-systems/86-type-safety-in-apis' },
          { text: '87 - Generic Patterns', link: '/sections/10-typescript-large-systems/87-generic-patterns' },
          { text: '88 - Strict Mode Trade-offs', link: '/sections/10-typescript-large-systems/88-strict-mode-trade-offs' },
          { text: '89 - Compile-Time vs Runtime', link: '/sections/10-typescript-large-systems/89-compile-time-vs-runtime' },
          { text: '90 - Migrating JS to TS Safely', link: '/sections/10-typescript-large-systems/90-migrating-js-to-ts-safely' }
        ]
      }
    ],

    socialLinks: [
      { icon: 'github', link: 'https://github.com/muthukumar-js-dev/muthu-nodejs-playbook' }
    ],

    footer: {
      message: 'Released under the MIT License.',
      copyright: 'Copyright © 2026 Muthukumar'
    },

    search: {
      provider: 'local'
    },

    editLink: {
      pattern: 'https://github.com/muthukumar-js-dev/muthu-nodejs-playbook/edit/main/docs/:path',
      text: 'Edit this page on GitHub'
    }
  },

  markdown: {
    theme: {
      light: 'github-light',
      dark: 'github-dark'
    }
  },

  vite: {
    optimizeDeps: {
      include: ['mermaid', 'vitepress-plugin-mermaid']
    },
    ssr: {
      noExternal: ['mermaid', 'vitepress-plugin-mermaid']
    }
  }
}))
