# AgentForge

English | [简体中文](./README.zh-CN.md)

An AI-assisted software development skill collection built around the [Agent Skills](https://agentskills.io/) specification. Currently provides the complete **Spec-Driven Development (SDD)** skill package (`skills/spec-driven-development/`), including methodology references, structured Markdown templates, and shell scaffolding/validation scripts.

## Overview

Spec-Driven Development shifts AI coding workflows from "prompt and patch" to specification-first engineering:

```text
0. Constitution -> 1. Specify -> 2. Clarify -> 3. Plan -> 4. Tasks -> 5. Implement
```

Rather than jumping straight to code generation, the workflow anchors every implementation step to an explicit project constitution, EARS-format functional requirements (`WHEN ... THEN THE SYSTEM SHALL ...`), technical blueprints, and atomic 1–4 hour tasks.

## Included Skill: `spec-driven-development`

Defined in [`skills/spec-driven-development/SKILL.md`](./skills/spec-driven-development/SKILL.md) (`v1.0.0`):

### Six-Phase Workflow & Command Conventions

| Phase | Slash Command | Purpose | Output Artifact |
|---|---|---|---|
| 0. Constitution | `/speckit.constitution` | Establish tech stack, architecture rules, security & test standards | `constitution.md` |
| 1. Specify | `/speckit.specify` | Capture user stories, EARS functional requirements, and edge cases | `spec.md` |
| 2. Clarify | `/speckit.clarify` | Resolve underspecified areas and error-handling gaps | Updated `spec.md` |
| 3. Plan | `/speckit.plan` | Design architecture, data models, API contracts, and risks | `plan.md` |
| 4. Tasks | `/speckit.tasks` | Break work into 1–4 hour atomic tasks with dependencies | `tasks.md` |
| 5. Implement | `/speckit.implement` | Implement tasks and validate against specifications and tests | Code + tests |
| Cross-Check | `/speckit.analyze` | Check consistency across constitution, spec, plan, and tasks | Consistency report |
| Checklist | `/speckit.checklist` | Generate a phase/feature quality verification checklist | Checklist |

> **Note**: `/speckit.*` commands reflect the GitHub Spec Kit / Claude Code workflow convention documented in [`SKILL.md`](./skills/spec-driven-development/SKILL.md). Agents following `SKILL.md` execute the same six phases even in harnesses without native `/speckit.*` slash bindings, and you can run the bundled Bash scripts directly from the terminal.

## Installation

Clone the repository and copy the skill folder into your agent's skills directory (Claude Code, Codex, Hermes, OpenCode, or project-local `.agents/skills/`):

```bash
git clone https://github.com/xdlkc/AgentForge.git
mkdir -p ~/.claude/skills
cp -r AgentForge/skills/spec-driven-development ~/.claude/skills/
```

For other harnesses, adjust the target path (for example `~/.codex/skills/`, `~/.hermes/skills/`, or `~/.config/opencode/skills/`).

## Helper Scripts Usage

Both scripts in [`skills/spec-driven-development/scripts/`](./skills/spec-driven-development/scripts/create-feature.sh) operate on relative `references/` and `specs/` directories, so invoke them from inside the installed or cloned `spec-driven-development` skill directory:

```bash
cd skills/spec-driven-development

# Ensure executable permissions if needed
chmod +x scripts/create-feature.sh scripts/validate-spec.sh

# Scaffold specs/001-user-auth/{contracts/,spec.md,plan.md,tasks.md}
./scripts/create-feature.sh user-auth

# Verify spec.md, plan.md, and tasks.md presence across specs/*/
./scripts/validate-spec.sh
```

## Reference Docs & Templates

All reference documents and templates live in `skills/spec-driven-development/references/` (written in Chinese):

| File | Description |
|---|---|
| [`references/spec-driven-development.md`](./skills/spec-driven-development/references/spec-driven-development.md) | Complete SDD methodology guide (all 6 phases, EARS syntax, examples) |
| [`references/sdd-quickstart.md`](./skills/spec-driven-development/references/sdd-quickstart.md) | 5-minute quickstart walkthrough using a user-auth example |
| [`references/constitution.md`](./skills/spec-driven-development/references/constitution.md) | Project constitution template (stack, layered architecture, standards) |
| [`references/spec-template.md`](./skills/spec-driven-development/references/spec-template.md) | Feature specification template with EARS requirements and edge cases |
| [`references/plan-template.md`](./skills/spec-driven-development/references/plan-template.md) | Technical plan template (architecture, DB schema, REST API, risk table) |
| [`references/tasks-template.md`](./skills/spec-driven-development/references/tasks-template.md) | Atomic task list template with dependency graph and progress table |

Contributor conventions, script rules, and repository validation checklists are documented in [`AGENTS.md`](./AGENTS.md).

## Repository Layout

```text
AgentForge/
├── AGENTS.md                                      # Repository & skill authoring conventions
├── README.md
├── README.zh-CN.md
└── skills/
    └── spec-driven-development/
        ├── SKILL.md                               # Agent Skills spec definition (v1.0.0)
        ├── references/
        │   ├── constitution.md
        │   ├── plan-template.md
        │   ├── sdd-quickstart.md
        │   ├── spec-driven-development.md
        │   ├── spec-template.md
        │   └── tasks-template.md
        └── scripts/
            ├── create-feature.sh                  # Scaffold numbered specs/<NNN>-<feature>/
            └── validate-spec.sh                   # Check spec.md / plan.md / tasks.md presence
```

## External References

- [Agent Skills Specification](https://agentskills.io/)
- [GitHub Spec Kit](https://github.com/github/spec-kit)
- [SpecDriven.ai](https://specdriven.ai)
