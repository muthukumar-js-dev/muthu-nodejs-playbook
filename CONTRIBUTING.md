# Contributing to Node.js Production Playbook

Thank you for your interest in contributing to this playbook! This repository exists to help engineers build production-grade Node.js systems through deep understanding, not surface-level tutorials.

## Contribution Philosophy

All contributions must align with the repository's core principles:

### 1. Production-Focused
- All examples must come from real production scenarios
- No toy examples or contrived use cases
- Failure modes should reflect actual production incidents
- Trade-offs should be grounded in real-world constraints

### 2. Mental Model Building
- Help readers build intuition, not just provide information
- Use diagrams to visualize complex concepts
- Explain the "why" behind every recommendation
- Connect concepts to broader system design principles

### 3. Depth Over Breadth
- Better to explain one concept thoroughly than many superficially
- Include failure modes, edge cases, and trade-offs
- Show when NOT to use a pattern, not just when to use it
- Demonstrate understanding through nuance

### 4. Clarity and Accessibility
- Avoid unnecessary jargon and abstractions
- Use concrete examples over theoretical explanations
- Keep language professional but approachable
- Assume the reader is intelligent but may lack specific context

## What We're Looking For

### Content Improvements
- Corrections to technical inaccuracies
- Additional production scenarios and failure modes
- Better diagrams or mental models
- Clarifications of confusing explanations
- Real-world examples from your production experience

### New Topics
Before proposing a new topic, ensure it:
- Fits within the existing section structure
- Addresses production concerns, not basic concepts
- Provides depth that isn't available in standard documentation
- Includes real-world scenarios and trade-offs

### What We're NOT Looking For
- Beginner tutorials or "getting started" guides
- Framework-specific documentation (Express, NestJS, etc.)
- Copy-paste code snippets without explanation
- Marketing content or promotional material
- Theoretical concepts without production relevance

## Content Structure

Every topic must follow this structure:

### 1. Why This Exists (Real-World Problem First)
Start with a production scenario that motivates the concept. Make it tangible and relatable.

### 2. Mental Model (Build Imagination)
Provide an analogy or framework that helps readers build intuition. This should be memorable and applicable.

### 3. How Node.js Implements This Internally
Explain the technical details, but always connect them back to practical implications.

### 4. Multiple Diagrams (MANDATORY)
Include at least 4 Mermaid diagrams that visualize:
- Architecture or flow
- Comparison of approaches
- Failure scenarios
- Decision trees or trade-offs

### 5. Where This Is Used in Real Projects
Show concrete production use cases across different system layers.

### 6. Where This Should NOT Be Used
Explicitly cover anti-patterns and scenarios where this approach fails.

### 7. Failure Modes & Edge Cases
Document what breaks, how it breaks, and how to detect it.

### 8. Trade-offs & Decision Framework
Help readers make informed decisions by explaining the costs and benefits.

## How to Contribute

### For Content Corrections or Improvements

1. **Open an Issue First**
   - Describe the inaccuracy or improvement
   - Provide context or sources if applicable
   - Wait for discussion before submitting a PR

2. **Submit a Pull Request**
   - Reference the issue number
   - Keep changes focused and atomic
   - Follow the existing writing style and structure
   - Include diagrams if adding new concepts

3. **PR Review Process**
   - Maintainers will review for technical accuracy
   - We'll check alignment with content philosophy
   - Expect discussion and iteration
   - Be patient—quality takes time

### For New Topics

1. **Propose via Issue**
   - Explain why this topic is needed
   - Show how it fits the repository structure
   - Outline the production scenarios it addresses
   - Wait for approval before writing

2. **Write Following the Template**
   - Use the 8-section structure above
   - Include at least 4 Mermaid diagrams
   - Aim for 20KB+ of comprehensive content
   - Ground everything in production reality

3. **Submit for Review**
   - Expect significant feedback and iteration
   - Be open to restructuring or rewriting
   - Focus on teaching, not just documenting

## Writing Guidelines

### Style
- **Professional and calm**: No hype, no marketing language
- **Mentor-like**: Encouraging but realistic about complexity
- **Clear and structured**: Easy to scan and navigate
- **Production-focused**: Always tie back to real systems

### Technical Accuracy
- Verify all technical claims with official documentation or reliable sources
- Test code examples to ensure they work
- Cite sources for performance claims or statistics
- Acknowledge when something is opinion vs fact

### Diagrams
- Use Mermaid for all diagrams (consistency)
- Keep diagrams focused and uncluttered
- Label all components clearly
- Use color to highlight important elements
- Ensure diagrams are readable on both light and dark themes

### Code Examples
- Use modern JavaScript/TypeScript (ES6+)
- Include comments explaining non-obvious parts
- Show both good and bad examples
- Keep examples concise but complete
- Avoid framework-specific code unless necessary

## Review Criteria

Your contribution will be evaluated on:

1. **Technical Accuracy**: Is the information correct?
2. **Production Relevance**: Does this reflect real-world systems?
3. **Clarity**: Can a mid-level engineer understand this?
4. **Depth**: Does this go beyond surface-level documentation?
5. **Structure**: Does it follow the required format?
6. **Diagrams**: Are the visualizations helpful and accurate?
7. **Trade-offs**: Are limitations and alternatives discussed?

## Questions?

If you're unsure about anything:
- Open a GitHub Discussion to ask questions
- Reference existing topics as examples
- Ask for feedback early and often
- Remember: we'd rather help you improve a contribution than reject it

## Code of Conduct

This project follows a standard Code of Conduct. Be respectful, constructive, and focused on improving the content for everyone.

## License

By contributing, you agree that your contributions will be licensed under the same license as the repository (MIT License).

---

Thank you for helping make this playbook a valuable resource for the Node.js community!
