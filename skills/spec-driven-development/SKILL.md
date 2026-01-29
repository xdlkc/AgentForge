name: spec-driven-development
description: Master the Spec-Driven Development methodology for AI-assisted software development. Guides through the six-phase workflow from constitution to implementation.
version: 1.0.0
author: AgentForge
tags:
  - methodology
  - workflow
  - planning
  - architecture
---

# Spec-Driven Development Skill

Guide users through the Spec-Driven Development (SDD) methodology - a structured approach to AI-assisted software development.

## When to Use This Skill

Use this skill when:
- Starting a new feature or project
- Planning complex implementations
- Creating technical specifications
- Breaking down work into actionable tasks
- Ensuring quality and consistency in development

## Core Workflow

The SDD methodology follows six phases:

### Phase 0: Constitution
Establish persistent project principles that guide all development.

**Key activities:**
- Define technology stack
- Set coding standards
- Establish security rules
- Define performance requirements

**Output:** `constitution.md`

### Phase 1: Specify
Capture unambiguous requirements including user stories and acceptance criteria.

**Key activities:**
- Write user stories
- Define functional requirements (use EARS syntax)
- Document non-functional requirements
- Identify edge cases

**Output:** `spec.md`

### Phase 2: Clarify
Systematically identify and resolve underspecified areas.

**Key activities:**
- Run structured clarification workflow
- Document edge cases
- Define error handling strategies
- Validate requirements completeness

**Output:** Updated `spec.md` with clarifications

### Phase 3: Plan
Create technical blueprint including architecture and data models.

**Key activities:**
- Design system architecture
- Define data models
- Design API contracts
- Plan implementation strategy

**Output:** `plan.md`

### Phase 4: Tasks
Break work into small, testable, atomic tasks.

**Key activities:**
- Decompose work into 1-4 hour tasks
- Define dependencies
- Set acceptance criteria
- Estimate effort

**Output:** `tasks.md`

### Phase 5: Implement
Execute tasks according to the plan.

**Key activities:**
- Implement each task
- Validate against specifications
- Run tests
- Update documentation

## Commands Reference

| Command | Phase | Description |
|---------|-------|-------------|
| `/speckit.constitution` | 0 | Create or update project constitution |
| `/speckit.specify` | 1 | Create feature specification |
| `/speckit.clarify` | 2 | Clarify underspecified areas |
| `/speckit.plan` | 3 | Create technical implementation plan |
| `/speckit.tasks` | 4 | Generate task breakdown |
| `/speckit.implement` | 5 | Execute implementation |
| `/speckit.analyze` | - | Cross-artifact consistency analysis |
| `/speckit.checklist` | - | Generate quality checklist |

## Best Practices

1. **Start with Constitution**: Always establish project principles first
2. **Be Explicit**: Use EARS syntax for requirements (WHEN...THEN THE SYSTEM SHALL...)
3. **Clarify Before Planning**: Resolve ambiguities before creating technical plans
4. **Small Tasks**: Keep tasks to 1-4 hours of work
5. **Validate Continuously**: Check implementation against specifications
6. **Update Specs First**: Any changes start with updating the specification

## Templates

See references/ directory for:
- `spec-template.md` - Feature specification template
- `plan-template.md` - Technical plan template
- `tasks-template.md` - Task breakdown template

## Example Usage

```
User: "I want to build a user authentication system"

1. Check if constitution.md exists, if not:
   /speckit.constitution

2. Create specification:
   /speckit.specify Build a user authentication system with email/password login, JWT tokens, and password reset

3. Clarify requirements:
   /speckit.clarify

4. Create technical plan:
   /speckit.plan Use FastAPI, PostgreSQL, and JWT authentication

5. Generate tasks:
   /speckit.tasks

6. Implement:
   /speckit.implement
```

## References

- [spec-driven-development.md](./references/spec-driven-development.md) - Full methodology documentation
- [sdd-quickstart.md](./references/sdd-quickstart.md) - Quick start guide
- [constitution.md](./references/constitution.md) - Example project constitution

## Additional Resources

- GitHub Spec Kit: https://github.com/github/spec-kit
- Kiro SDD: https://github.com/jasonkneen/kiro
- SpecDriven.ai: https://specdriven.ai
