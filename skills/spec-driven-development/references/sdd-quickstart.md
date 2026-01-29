# Spec-Driven Development 快速开始指南

## 5 分钟上手 SDD

### 第 1 步：初始化项目

```bash
# 创建新项目目录
mkdir my-sdd-project
cd my-sdd-project

# 初始化 Git 仓库
git init
```

### 第 2 步：创建项目宪法

创建 `.specify/memory/constitution.md`：

```markdown
# Project Constitution

## 技术栈
- **语言**: Python 3.11+
- **框架**: FastAPI
- **数据库**: PostgreSQL
- **ORM**: SQLAlchemy
- **测试**: pytest

## 编码标准
- 使用 Black 格式化代码
- 使用 mypy 进行类型检查
- 测试覆盖率 > 80%
- 遵循 Google Python Style Guide

## 架构原则
- 使用分层架构 (Controller → Service → Repository)
- API 遵循 RESTful 设计
- 所有函数必须有类型注解
- 异步优先 (async/await)
```

### 第 3 步：创建功能规格

创建 `.specify/specs/001-user-auth/spec.md`：

```markdown
# 功能规格: 用户认证系统

## 概述
实现用户注册、登录和会话管理功能。

## 用户故事
作为新用户，我想要注册账户，以便使用应用功能。

## 功能需求
- WHEN 用户提供邮箱和密码 THEN THE SYSTEM SHALL 创建账户并返回成功消息
- WHEN 用户使用无效邮箱 THEN THE SYSTEM SHALL 返回验证错误
- WHEN 用户使用弱密码 THEN THE SYSTEM SHALL 提示密码强度不足
- WHEN 用户登录 THEN THE SYSTEM SHALL 返回 JWT 访问令牌

## 验收标准
- [ ] 用户可以注册新账户
- [ ] 密码必须加密存储
- [ ] 登录返回有效 JWT
- [ ] 令牌包含用户 ID 和过期时间
```

### 第 4 步：创建技术计划

创建 `.specify/specs/001-user-auth/plan.md`：

```markdown
# 技术计划: 用户认证系统

## 数据模型
```python
class User(Base):
    __tablename__ = "users"
    
    id: UUID
    email: str (unique, indexed)
    password_hash: str
    created_at: datetime
```

## API 端点
- `POST /api/v1/auth/register` - 用户注册
- `POST /api/v1/auth/login` - 用户登录
- `POST /api/v1/auth/refresh` - 刷新令牌

## 实现步骤
1. 创建数据库模型
2. 实现密码哈希服务
3. 实现 JWT 服务
4. 创建 API 端点
5. 编写单元测试
```

### 第 5 步：分解任务

创建 `.specify/specs/001-user-auth/tasks.md`：

```markdown
# 任务清单

## 任务 1: 数据库模型
- [ ] 创建 User 模型
- [ ] 创建数据库迁移
- [ ] 添加唯一索引

## 任务 2: 认证服务
- [ ] 实现密码哈希 (bcrypt)
- [ ] 实现 JWT 生成
- [ ] 实现 JWT 验证

## 任务 3: API 端点
- [ ] POST /auth/register
- [ ] POST /auth/login
- [ ] 输入验证

## 任务 4: 测试
- [ ] 单元测试
- [ ] 集成测试
```

### 第 6 步：开始实现

使用 AI 助手执行：

```
/speckit.implement
```

或者手动实现：

```bash
# 安装依赖
pip install fastapi sqlalchemy bcrypt pyjwt

# 创建项目结构
mkdir -p src/{models,services,routers,tests}

# 开始编码...
```

---

## 常用命令速查

| 命令 | 用途 |
|------|------|
| `/speckit.constitution` | 创建项目宪法 |
| `/speckit.specify` | 创建功能规格 |
| `/speckit.clarify` | 澄清需求 |
| `/speckit.plan` | 创建技术计划 |
| `/speckit.tasks` | 生成任务清单 |
| `/speckit.implement` | 执行实现 |
| `/speckit.verify` | 验证实现 |

---

## 下一步

- 阅读完整 [SDD 方法论](./spec-driven-development.md)
- 查看 [示例项目](./examples/)
- 了解 [最佳实践](./best-practices.md)
