# AgentForge

> AI 辅助开发工具集

## 项目结构

```
AgentForge/
├── README.md                          # 本文件
├── skills/                            # Claude Agent Skills
│   └── spec-driven-development/       # SDD 方法论 Skill
│       ├── .claude                    # Skill 定义
│       ├── scripts/                   # 辅助脚本
│       ├── references/                # 参考文档
│       └── assets/                    # 资源文件
└── spec-driven-development/           # SDD 文档目录
    └── README.md                      # 使用说明
```

## Spec-Driven Development

完整的 Spec-Driven Development 方法论实现，遵循 Claude Agent Skills 官方规范。

### 安装

```bash
cp -r skills/spec-driven-development ~/.claude/skills/
```

### 使用

在 Claude Code 中使用以下命令：

| 命令 | 描述 |
|------|------|
| `/speckit.constitution` | 创建项目宪法 |
| `/speckit.specify` | 创建功能规格 |
| `/speckit.clarify` | 澄清需求 |
| `/speckit.plan` | 创建技术计划 |
| `/speckit.tasks` | 生成任务清单 |
| `/speckit.implement` | 执行实现 |

### 详细文档

查看 [spec-driven-development/README.md](./spec-driven-development/README.md) 获取完整文档。

---

*遵循 [Agent Skills](https://agentskills.io/) 官方规范*
