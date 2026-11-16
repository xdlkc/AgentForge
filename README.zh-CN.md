# AgentForge

[English](./README.md) | 简体中文

遵循 [Agent Skills](https://agentskills.io/) 规范构建的 AI 辅助软件工程技能集合。当前仓库包含完整的 **Spec-Driven Development（SDD，规格驱动开发）** 技能包（`skills/spec-driven-development/`），提供方法论参考文档、结构化 Markdown 模板以及规格脚手架/校验脚本。

## 概述

Spec-Driven Development 将 AI 辅助开发从“直接写代码”转变为“先写可执行规格，再按计划拆解实现”的六阶段工程流程：

```text
0. Constitution -> 1. Specify -> 2. Clarify -> 3. Plan -> 4. Tasks -> 5. Implement
```

每一步实现都锚定在明确的项目宪章、EARS 语法功能需求（`WHEN ... THEN THE SYSTEM SHALL ...`）、技术架构蓝图以及 1–4 小时的原子级任务清单之上，减少需求歧义造成的返工。

## 内置 Skill：`spec-driven-development`

技能定义位于 [`skills/spec-driven-development/SKILL.md`](./skills/spec-driven-development/SKILL.md)（`v1.0.0`）：

### 六阶段工作流与命令约定

| 阶段 | 命令约定 | 核心动作 | 产出文件 |
|---|---|---|---|
| 0. Constitution（宪章） | `/speckit.constitution` | 建立项目技术栈、分层架构、安全与测试规范 | `constitution.md` |
| 1. Specify（规格） | `/speckit.specify` | 编写用户故事、EARS 功能需求、非功能需求与边界情况 | `spec.md` |
| 2. Clarify（澄清） | `/speckit.clarify` | 结构化识别需求盲区并补充错误处理策略 | 更新后的 `spec.md` |
| 3. Plan（计划） | `/speckit.plan` | 设计系统架构、数据模型、API 契约与风险缓解方案 | `plan.md` |
| 4. Tasks（任务） | `/speckit.tasks` | 拆解为 1–4 小时原子任务、依赖关系与验收标准 | `tasks.md` |
| 5. Implement（实现） | `/speckit.implement` | 按任务顺序编码实现、运行测试并对照规格验证 | 代码与测试 |
| 一致性检查 | `/speckit.analyze` | 跨宪章、规格、计划与任务文档的一致性核查 | 一致性报告 |
| 质量清单 | `/speckit.checklist` | 生成阶段性质量核对清单 | 核对清单 |

> **说明**：`/speckit.*` 对应 GitHub Spec Kit 与 Claude Code 中的工作流命令约定；在未注册 `/speckit.*` 斜杠命令的其他 Agent 工具中，Agent 仍可依据 `SKILL.md` 执行相同六阶段流程，也可直接在终端运行仓库附带的 Bash 脚本。

## 安装方式

克隆仓库并将 skill 目录复制到对应 Agent 的 skills 目录（适用于 Claude Code、Codex、Hermes、OpenCode 或项目级 `.agents/skills/`）：

```bash
git clone https://github.com/xdlkc/AgentForge.git
mkdir -p ~/.claude/skills
cp -r AgentForge/skills/spec-driven-development ~/.claude/skills/
```

如用于其他 Agent 工具，可将目标目录替换为 `~/.codex/skills/`、`~/.hermes/skills/` 或 `~/.config/opencode/skills/`。

## 辅助脚本用法

[`skills/spec-driven-development/scripts/`](./skills/spec-driven-development/scripts/create-feature.sh) 中的两个脚本基于相对路径 `references/` 与 `specs/` 运行，因此请在 `skills/spec-driven-development` 目录内执行：

```bash
cd skills/spec-driven-development

# 如无执行权限先添加权限
chmod +x scripts/create-feature.sh scripts/validate-spec.sh

# 创建编号规格目录 specs/001-user-auth/{contracts/,spec.md,plan.md,tasks.md}
./scripts/create-feature.sh user-auth

# 检查 specs/*/ 下是否齐全 spec.md、plan.md 与 tasks.md
./scripts/validate-spec.sh
```

## 参考文档与模板

全部参考文档与模板位于 `skills/spec-driven-development/references/`（均为中文文档）：

| 文件 | 说明 |
|---|---|
| [`references/spec-driven-development.md`](./skills/spec-driven-development/references/spec-driven-development.md) | SDD 六阶段完整方法论详解与 EARS 示例 |
| [`references/sdd-quickstart.md`](./skills/spec-driven-development/references/sdd-quickstart.md) | 5 分钟快速上手指南（以用户认证系统为例） |
| [`references/constitution.md`](./skills/spec-driven-development/references/constitution.md) | 项目宪章模板（技术栈、分层架构、编码与提交规范） |
| [`references/spec-template.md`](./skills/spec-driven-development/references/spec-template.md) | 功能规格模板（用户故事、EARS 需求、边界情况与验收清单） |
| [`references/plan-template.md`](./skills/spec-driven-development/references/plan-template.md) | 技术计划模板（架构、Schema、REST API、模块依赖与风险表） |
| [`references/tasks-template.md`](./skills/spec-driven-development/references/tasks-template.md) | 任务清单模板（优先级、工时、依赖图与进度追踪） |

仓库维护规范、脚本标准与提交前校验清单请参阅 [`AGENTS.md`](./AGENTS.md)。

## 仓库目录结构

```text
AgentForge/
├── AGENTS.md                                      # 仓库开发与 Skill 编写规范
├── README.md
├── README.zh-CN.md
└── skills/
    └── spec-driven-development/
        ├── SKILL.md                               # Agent Skills 规范定义（v1.0.0）
        ├── references/
        │   ├── constitution.md
        │   ├── plan-template.md
        │   ├── sdd-quickstart.md
        │   ├── spec-driven-development.md
        │   ├── spec-template.md
        │   └── tasks-template.md
        └── scripts/
            ├── create-feature.sh                  # 创建 specs/<NNN>-<feature>/ 目录与模板
            └── validate-spec.sh                   # 检查 spec.md / plan.md / tasks.md 完整性
```

## 相关资源

- [Agent Skills 规范](https://agentskills.io/)
- [GitHub Spec Kit](https://github.com/github/spec-kit)
- [SpecDriven.ai](https://specdriven.ai)
