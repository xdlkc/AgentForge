# Spec-Driven Development (SDD) 方法论

> **意图驱动开发** — 让规格说明成为可执行的蓝图

## 核心理念

Spec-Driven Development (规格驱动开发) 是一种 AI 时代的软件开发方法论，它将**详细、正式的规格说明**作为生成生产代码的可执行蓝图。它将开发焦点从"先写代码"转变为"先写规格"，遵循 **Specify → Plan → Tasks → Implement** 的工作流程。

### 为什么需要 SDD？

在 AI 能够生成代码的时代，工程瓶颈已从"编写语法"转移到"定义意图"。SDD 通过以下方式解决这一挑战：

- **消除"歧义税"**：减少因模糊需求导致的幻觉和返工
- **将规格作为单一事实来源**：规格成为代码、测试和文档的源头
- **转变开发者角色**：从"编码者"转变为"架构师和审查者"
- **利用 AI 进行繁重工作**：人类负责编排，AI 负责生成

---

## SDD 六阶段工作流

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                    SPEC-DRIVEN DEVELOPMENT WORKFLOW                         │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│  0. Constitution          建立项目宪章和不变原则                              │
│       ↓                                                                     │
│  1. Specify               定义"做什么"和"为什么"                            │
│       ↓                                                                     │
│  2. Clarify               澄清模糊区域，处理边界情况                          │
│       ↓                                                                     │
│  3. Plan                  技术蓝图：架构、数据模型、API                       │
│       ↓                                                                     │
│  4. Tasks                 分解为原子级、可测试的任务                          │
│       ↓                                                                     │
│  5. Implement             执行实现并迭代优化                                  │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

---

## 阶段详解

### Phase 0: Constitution (宪法) — 建立护栏

**目标**：建立持久化的项目原则，作为所有 AI 操作的不变上下文

**输出**：`constitution.md`

**内容**：
- 技术栈选择（语言、框架、数据库）
- 编码标准和风格指南
- 安全规则和合规要求
- 性能基准和约束
- 测试策略和质量门禁
- 架构决策记录 (ADR)

**示例**：
```markdown
# Project Constitution

## 技术栈
- 后端: Python 3.11+ with FastAPI
- 前端: React 18 with TypeScript
- 数据库: PostgreSQL 15
- 缓存: Redis

## 编码标准
- 遵循 PEP 8 和 Google Python Style Guide
- 所有代码必须通过 mypy 类型检查
- 测试覆盖率不低于 80%

## 安全规则
- 所有 API 端点必须认证
- 使用参数化查询防止 SQL 注入
- 敏感数据必须加密存储
```

---

### Phase 1: Specify (规格定义) — 定义做什么

**目标**：捕获明确的需求，包括用户故事、验收标准和约束。关注意图，而非技术实现细节。

**输出**：`spec.md`

**关键要素**：

#### 1.1 功能需求 (Functional Requirements)
使用 **EARS 语法**（Easy Approach to Requirements Syntax）：

```
WHEN <触发条件> THE SYSTEM SHALL <系统行为>
```

**示例**：
```markdown
## 功能需求

### 用户认证
- WHEN 用户输入有效的邮箱和密码 THEN THE SYSTEM SHALL 创建会话并返回 JWT 令牌
- WHEN 用户输入无效的凭证 THEN THE SYSTEM SHALL 返回 401 错误且不创建会话
- WHEN 令牌过期 THEN THE SYSTEM SHALL 拒绝请求并返回 401 错误

### 任务管理
- WHEN 用户创建任务并提供标题 THEN THE SYSTEM SHALL 保存任务并返回任务 ID
- WHEN 用户拖拽任务到不同列 THEN THE SYSTEM SHALL 更新任务状态并记录历史
```

#### 1.2 用户故事 (User Stories)
```markdown
## 用户故事

作为 [角色]，我想要 [功能]，以便 [价值]

### 故事 1: 创建任务
- **作为** 项目经理
- **我想要** 创建新任务并分配给团队成员
- **以便** 跟踪项目进度

**验收标准**：
- [ ] 任务必须包含标题和描述
- [ ] 可以设置截止日期
- [ ] 可以分配给团队成员
- [ ] 创建后出现在看板的第一列
```

#### 1.3 非功能需求 (Non-Functional Requirements)
```markdown
## 非功能需求

### 性能
- API 响应时间 < 200ms (P95)
- 页面加载时间 < 3秒
- 支持 1000 并发用户

### 安全
- 所有数据传输使用 TLS 1.3
- 密码使用 bcrypt 哈希
- 实施速率限制 (100请求/分钟)

### 可用性
- 系统可用性 99.9%
- 支持离线模式
```

#### 1.4 边界情况和错误处理
```markdown
## 边界情况

### 任务创建
- **空标题**：显示错误"任务标题不能为空"
- **超长标题** (>200字符)：截断并显示警告
- **重复任务**：检测相似标题并提示

### 网络错误
- **离线状态**：本地缓存更改，恢复后同步
- **超时**：重试 3 次后显示友好错误信息
```

---

### Phase 2: Clarify (澄清) — 消除歧义

**目标**：系统性地识别和记录 underspecified 区域——边界情况、空状态和错误处理

**输出**：更新 `spec.md` (添加 Clarifications 部分)

**方法**：
1. **结构化澄清流程**：使用 `/speckit.clarify` 命令
2. **覆盖式提问**：顺序检查每个需求的完整性
3. **记录答案**：将澄清结果写入规格文档

**检查清单**：
- [ ] 所有用户输入都验证了格式和范围？
- [ ] 所有错误情况都有处理策略？
- [ ] 边界值（空、最大、最小）都定义了？
- [ ] 并发和竞态条件考虑了？
- [ ] 权限和访问控制明确了？

---

### Phase 3: Plan (规划) — 技术蓝图

**目标**：将意图转化为可行的技术方案：架构决策、数据模型、API 契约和依赖

**输出**：`plan.md`

**内容结构**：

```markdown
# 技术实现计划

## 1. 架构概述
### 1.1 系统架构图
[插入 C4 图或架构图]

### 1.2 技术栈
- **运行时**: Node.js 20 LTS
- **框架**: Express.js 4.x
- **数据库**: PostgreSQL 15
- **ORM**: Prisma
- **缓存**: Redis
- **消息队列**: BullMQ

## 2. 数据模型
### 2.1 实体关系图
```
User ||--o{ Project : owns
Project ||--o{ Task : contains
Task }o--|| User : assigned_to
```

### 2.2 数据库 Schema
```sql
-- 用户表
CREATE TABLE users (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  email VARCHAR(255) UNIQUE NOT NULL,
  password_hash VARCHAR(255) NOT NULL,
  created_at TIMESTAMP DEFAULT NOW()
);

-- 任务表
CREATE TABLE tasks (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  title VARCHAR(200) NOT NULL,
  status VARCHAR(50) DEFAULT 'todo',
  assignee_id UUID REFERENCES users(id),
  project_id UUID REFERENCES projects(id)
);
```

## 3. API 设计
### 3.1 REST API 规范
```yaml
POST /api/v1/tasks
Request:
  body:
    title: string (required, max 200)
    description: string (optional)
    assignee_id: UUID (optional)
    
Response 201:
  body:
    id: UUID
    title: string
    status: string
    created_at: ISO8601
```

### 3.2 错误响应格式
```json
{
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "Invalid input data",
    "details": [
      {"field": "title", "message": "Title is required"}
    ]
  }
}
```

## 4. 组件设计
### 4.1 模块划分
- **AuthModule**: 认证和授权
- **TaskModule**: 任务 CRUD 和状态管理
- **ProjectModule**: 项目和团队管理
- **NotificationModule**: 通知服务

### 4.2 接口定义
```typescript
// TaskService 接口
interface ITaskService {
  createTask(data: CreateTaskDTO): Promise<Task>;
  updateStatus(taskId: string, status: TaskStatus): Promise<Task>;
  assignTask(taskId: string, userId: string): Promise<Task>;
}
```

## 5. 实现策略
### 5.1 依赖关系
```
TaskModule → UserModule
TaskModule → NotificationModule
ProjectModule → TaskModule
```

### 5.2 风险缓解
- **风险**: 数据库性能瓶颈
- **缓解**: 实施读写分离，添加缓存层
```

---

### Phase 4: Tasks (任务分解) — 原子级拆分

**目标**：将工作分解为小型、可测试、独立的块，每个块适合单个 PR（1-4 小时）

**输出**：`tasks.md`

**原则**：
- **原子性**：每个任务不可再分
- **可测试性**：每个任务有明确的完成标准
- **独立性**：任务间依赖最小化
- **可估算性**：每个任务 1-4 小时完成

**格式**：

```markdown
# 实现任务清单

## 任务 1: 设置项目基础结构
**优先级**: P0 | **预估**: 2h | **依赖**: 无

### 描述
初始化项目，配置开发环境

### 验收标准
- [ ] 项目目录结构创建
- [ ] 依赖包安装 (Express, Prisma, etc.)
- [ ] 环境变量配置
- [ ] 基础路由和中间件设置

### 文件变更
- `package.json`
- `src/app.ts`
- `.env.example`
- `tsconfig.json`

---

## 任务 2: 设计数据库 Schema
**优先级**: P0 | **预估**: 3h | **依赖**: 任务 1

### 描述
创建数据库表和关系

### 验收标准
- [ ] User 表创建
- [ ] Task 表创建
- [ ] Project 表创建
- [ ] 外键关系建立
- [ ] 初始迁移文件生成

### 文件变更
- `prisma/schema.prisma`
- `prisma/migrations/`

---

## 任务 3: 实现用户认证 API
**优先级**: P0 | **预估**: 4h | **依赖**: 任务 2

### 描述
实现注册和登录接口

### 验收标准
- [ ] POST /auth/register 实现
- [ ] POST /auth/login 实现
- [ ] JWT 令牌生成
- [ ] 密码哈希 (bcrypt)
- [ ] 输入验证
- [ ] 单元测试覆盖

### 文件变更
- `src/modules/auth/controller.ts`
- `src/modules/auth/service.ts`
- `src/modules/auth/validator.ts`
- `tests/auth.test.ts`
```

---

### Phase 5: Implement (实现) — 执行与迭代

**目标**：AI 根据规格/计划片段生成代码和测试，人类根据规格进行验证

**工作流**：

```
1. 选择任务 → 2. AI 生成代码 → 3. 人类审查 → 4. 运行测试 → 5. 提交 PR
```

**原则**：
- **规格优先**：任何更改都先修改规格
- **测试驱动**：测试嵌入规格中
- **验证后提交**：AI 和人类都验证后才提交
- **版本控制**：规格作为代码进行版本控制

**命令示例**：
```bash
# 执行所有任务
/speckit.implement

# 执行特定任务
/speckit.implement --task 3

# 验证实现
/speckit.verify
```

---

## 关键原则

### 1. 规格即真理 (Specification as Truth)
规格是代码、测试和文档的单一事实来源。将规格视为活文档和可执行蓝图。

### 2. 前置清晰 (Upfront Clarity)
在编码前提供明确的细节：业务规则、边界情况、非功能需求和架构规划。

### 3. 持久上下文 (Persistent Context)
将规格作为单一、不断演进的真相源，跨开发会话保持一致。

### 4. 测试驱动护栏 (Test-Driven Guardrails)
从规格直接派生自动化测试和明确的验收标准。

### 5. 系统分解 (Systematic Decomposition)
将复杂功能分解为小型、原子、可测试的任务。

### 6. 人类编排 (Human Orchestration)
人类负责编排和审查，AI 负责生成。

### 7. 可执行意图 (Executable Intent)
设计规格使其可被 AI 工具直接执行。

---

## 项目结构

```
project-root/
├── .specify/                    # SDD 配置和规格
│   ├── memory/
│   │   └── constitution.md      # 项目宪法
│   ├── specs/                   # 功能规格
│   │   └── 001-feature-name/
│   │       ├── spec.md          # 功能规格
│   │       ├── plan.md          # 技术计划
│   │       ├── tasks.md         # 任务清单
│   │       └── contracts/       # API/数据契约
│   ├── templates/               # 模板文件
│   │   ├── spec-template.md
│   │   ├── plan-template.md
│   │   └── tasks-template.md
│   └── scripts/                 # 辅助脚本
│       ├── create-feature.sh
│       └── validate-spec.sh
├── src/                         # 源代码
├── tests/                       # 测试文件
└── docs/                        # 文档
```

---

## 工具集成

### 支持的 AI 代理

| 代理 | 支持 | 备注 |
|------|------|------|
| Claude Code | ✅ | 完整支持 |
| GitHub Copilot | ✅ | 完整支持 |
| Cursor | ✅ | 完整支持 |
| Gemini CLI | ✅ | 完整支持 |
| Codex CLI | ✅ | 完整支持 |
| Windsurf | ✅ | 完整支持 |
| opencode | ✅ | 完整支持 |

### 可用命令

| 命令 | 描述 |
|------|------|
| `/speckit.constitution` | 创建/更新项目宪法 |
| `/speckit.specify` | 定义功能规格 |
| `/speckit.clarify` | 澄清规格中的模糊区域 |
| `/speckit.plan` | 创建技术实现计划 |
| `/speckit.tasks` | 生成任务清单 |
| `/speckit.implement` | 执行实现 |
| `/speckit.analyze` | 跨工件一致性分析 |
| `/speckit.checklist` | 生成质量检查清单 |

---

## SDD vs Vibe Coding

| 方面 | Vibe Coding | Spec-Driven Development |
|------|-------------|------------------------|
| **定义** | 探索性，基于"感觉"的自然语言提示 | 结构化方法论，详细可执行规格 |
| **流程** | 临时提示；快速迭代；依赖 AI 直觉 | 分阶段工作流，前置严谨性 |
| **优势** | 原型快速；门槛低；创意性强 | 复杂项目可靠；减少歧义；确保对齐 |
| **劣势** | 容易幻觉、上下文丢失、代码脆弱 | 需要更多前置时间；小项目显得僵化 |
| **AI 角色** | 主要生成器；松散指导 | 执行定义好的任务；人类编排 |

---

## 最佳实践

### 规格编写
1. **使用 EARS 语法** 编写精确需求
2. **分层规格**：用户故事 → 详细需求 → 技术约束
3. **显式定义非功能需求**：性能、安全、可扩展性
4. **包含边界情况和错误处理**

### 项目管理
1. **保持规格人类可审查**：规格要简洁，便于人类有效审查
2. **有意义的分解**：将功能分解为有价值、独立交付的切片
3. **使用 INVEST 和 MoSCoW** 进行优先级排序

### 质量保障
1. **验收标准前置**：在实现前定义"完成"的标准
2. **持续验证**：对照规格验证实现
3. **规格即代码**：版本控制、审查、测试规格

---

## 决策框架：何时使用 SDD

### 使用 SDD 的场景
- ✅ 功能涉及多个组件或系统
- ✅ 需要与外部 API 或服务集成
- ✅ 涉及复杂业务逻辑或数据转换
- ✅ 需要处理多个用户角色或权限级别
- ✅ 影响现有系统架构
- ✅ 高风险或高影响功能

### 不需要 SDD 的场景
- ❌ 简单的 bug 修复
- ❌ 配置变更
- ❌ 文档更新
- ❌ 实现明确且遵循既定模式
- ❌ 纯 UI 变更（无逻辑）

---

## 总结

Spec-Driven Development 是一种适应 AI 时代的工程方法论。通过将规格作为核心工件，它：

1. **减少返工**：前置清晰度消除歧义
2. **提高质量**：系统化的规划和验证
3. **加速开发**：AI 根据明确规格快速生成代码
4. **改善协作**：规格成为团队间的通用语言
5. **降低风险**：早期识别和缓解问题

> **核心信条**：先想清楚，再写清楚，最后让 AI 帮你实现。

---

## 参考资源

- [GitHub Spec Kit](https://github.com/github/spec-kit)
- [Kiro Spec-Driven Development](https://github.com/jasonkneen/kiro)
- [SpecDriven.ai](https://specdriven.ai)
- [Microsoft Spec-Driven Development Training](https://learn.microsoft.com/en-us/training/modules/spec-driven-development-github-spec-kit-enterprise-developers/)

---

*最后更新: 2026-01-30*
