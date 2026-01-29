# AgentForge - AGENTS.md

## Project Overview

AgentForge is a Spec-Driven Development (SDD) methodology implementation following the [Agent Skills](https://agentskills.io/) specification. It provides a structured workflow for AI-assisted software development.

## Build/Test/Lint Commands

This project uses shell scripts for automation:

```bash
# Create a new feature spec
./skills/spec-driven-development/scripts/create-feature.sh <feature-name>

# Validate spec completeness
./skills/spec-driven-development/scripts/validate-spec.sh

# Run all validations
find . -name "*.sh" -type f | head -5
```

**Note**: This is a documentation/methodology project. No traditional build system (npm/make/poetry) is configured.

## Code Style Guidelines

### File Organization
- **Skills**: Place in `skills/<skill-name>/` following Agent Skills spec
- **Documentation**: Markdown files in `references/` directories
- **Scripts**: Executable bash scripts in `scripts/` directories

### Naming Conventions
- **Directories**: lowercase-with-hyphens (e.g., `spec-driven-development`)
- **Files**: lowercase-with-hyphens.md for docs, kebab-case.sh for scripts
- **Skills**: Must contain `SKILL.md` (not `.claude`) with YAML frontmatter

### Documentation Standards
- Use YAML frontmatter in SKILL.md: `name`, `description`, `version`, `author`, `tags`
- Write in English for skill definitions, Chinese allowed for methodology docs
- Follow Markdown best practices: proper heading hierarchy, code blocks with language tags

### Script Standards
- Start with `#!/bin/bash`
- Include brief comment describing purpose
- Use `set -e` for error handling when appropriate
- Quote variables: `"${VAR}"` not `$VAR`
- Use `[[ ]]` for conditionals in bash

### Git Workflow
- Branch naming: `feature/XXX-description` or `bugfix/XXX-description`
- Commit message: Conventional commits (feat:, fix:, docs:, refactor:)
- Always run validation scripts before committing

### SDD Workflow Commands

When working with this repository, use these slash commands:

| Command | Purpose |
|---------|---------|
| `/speckit.constitution` | Create project constitution |
| `/speckit.specify` | Create feature specification |
| `/speckit.clarify` | Clarify requirements |
| `/speckit.plan` | Create technical plan |
| `/speckit.tasks` | Generate task breakdown |
| `/speckit.implement` | Execute implementation |

### File Structure Template

```
skills/<skill-name>/
├── SKILL.md              # Required: skill definition
├── scripts/              # Optional: helper scripts
├── references/           # Optional: documentation
└── assets/               # Optional: templates/resources
```

### Validation Checklist

Before submitting changes:
- [ ] SKILL.md has valid YAML frontmatter
- [ ] Scripts are executable (`chmod +x`)
- [ ] No trailing whitespace in markdown
- [ ] All links in documentation are valid
- [ ] Follow existing directory structure

## External Resources

- [Agent Skills Spec](https://agentskills.io/specification)
- [GitHub Spec Kit](https://github.com/github/spec-kit)
- [SpecDriven.ai](https://specdriven.ai)
