# Claude Code Docker

[English](https://github.com/huangsen365/claude-code/blob/main/README.en.md) | 中文

## 🚀 一键快速体验

```bash
docker run --rm -it -e ANTHROPIC_BASE_URL="https://api.moonshot.cn/anthropic" -w /root --name my-claude-code huangsen365/claude-code bash
```

然后在容器内运行 `claude` 命令启动 Claude Code。

> 💡 **提示**: 容器启动后会进入 bash shell，然后运行 `claude` 命令启动 Claude Code。运行后会提示输入 API Key，请准备好您的 Moonshot API Key

## 介绍

Claude Code Docker 是一个封装了 Anthropic Claude Code CLI 工具的 Docker 镜像。它提供了一个即用型的环境，让您可以在容器中运行 Claude Code，而无需在本地安装 Node.js 和相关依赖。

🔗 **项目仓库**: [https://github.com/huangsen365/claude-code](https://github.com/huangsen365/claude-code)

**🔥 重要提示：本项目默认使用 API 端点 [https://platform.moonshot.cn/console/api-keys](https://platform.moonshot.cn/console/api-keys)，这是月之暗面发布的万亿参数模型 Kimi K2 提供的 Anthropic API 兼容服务，让中国大陆用户能够无缝体验 Vibe Coding（Claude Code 的沉浸式 CLI）！**

Claude Code 是 Anthropic 官方的命令行界面工具，可以帮助您：
- 与 Claude AI 进行交互式编程对话
- 获取代码建议和解决方案
- 执行各种软件工程任务

## 特性

- 🐳 基于 Ubuntu 最新版本的轻量级 Docker 镜像
- 📦 预装 Node.js、npm 和 Claude Code CLI
- 🚀 支持自定义 API Base URL（如使用代理服务）
- 🔧 零配置，开箱即用
- 🌐 使用阿里云镜像源加速国内访问

## 快速开始

### 1. 使用 Docker Hub 镜像（推荐）

从 [Docker Hub](https://hub.docker.com/r/huangsen365/claude-code) 拉取并运行：

```bash
docker run --rm -it -e ANTHROPIC_BASE_URL="https://api.moonshot.cn/anthropic" -w /root --name my-claude-code huangsen365/claude-code bash
```

然后在容器内运行 `claude` 命令启动 Claude Code。

### 2. 构建本地镜像

```bash
# 克隆仓库
git clone https://github.com/huangsen365/claude-code.git
cd claude-code

# 构建镜像
docker build -t claude-code .

# 运行容器
docker run --rm -it \
  -e ANTHROPIC_BASE_URL="https://api.moonshot.cn/anthropic" \
  -w /root \
  --name my-claude-code \
  claude-code bash

# 然后在容器内运行 claude 命令
```

## 环境变量

| 变量名 | 说明 | 默认值 |
|--------|------|--------|
| ANTHROPIC_BASE_URL | Claude API 的基础 URL | https://api.moonshot.cn/anthropic |
| ANTHROPIC_API_KEY | Claude API 密钥（运行时提示输入） | - |

## 使用说明

### 基本使用

1. **首次运行**：容器启动后会提示您输入 API 密钥
2. **交互模式**：输入您的问题或代码需求，Claude 会为您提供帮助
3. **退出**：使用 `Ctrl+C` 或输入 `exit` 退出

### 挂载本地目录

如果您想让 Claude Code 访问本地项目文件：

```bash
docker run --rm -it \
  -e ANTHROPIC_BASE_URL="https://api.moonshot.cn/anthropic" \
  -v /path/to/your/project:/workspace \
  -w /workspace \
  --name my-claude-code \
  huangsen365/claude-code bash
```

然后在容器内运行 `claude` 命令。

### 使用不同的 API 服务

#### 使用官方 API
```bash
docker run --rm -it \
  -w /root \
  --name my-claude-code \
  huangsen365/claude-code bash
```

然后在容器内运行 `claude` 命令。

#### 使用 Moonshot（Kimi K2 兼容服务）
```bash
docker run --rm -it -e ANTHROPIC_BASE_URL="https://api.moonshot.cn/anthropic" -w /root --name my-claude-code huangsen365/claude-code bash
```

然后在容器内运行 `claude` 命令。

## 高级配置

### 持久化配置

如果您想保存 API 密钥和配置，可以挂载配置目录：

```bash
docker run --rm -it \
  -e ANTHROPIC_BASE_URL="https://api.moonshot.cn/anthropic" \
  -v ~/.config/claude:/root/.config/claude \
  -w /root \
  --name my-claude-code \
  huangsen365/claude-code bash
```

然后在容器内运行 `claude` 命令。

### Docker Compose 使用

创建 `docker-compose.yml` 文件：

```yaml
version: '3.8'

services:
  claude-code:
    image: huangsen365/claude-code
    container_name: claude-code
    environment:
      - ANTHROPIC_BASE_URL=https://api.moonshot.cn/anthropic
    volumes:
      - ./workspace:/workspace
      - ~/.config/claude:/root/.config/claude
    working_dir: /workspace
    stdin_open: true
    tty: true
    command: /bin/bash
```

运行：
```bash
docker-compose run --rm claude-code
```

然后在容器内运行 `claude` 命令。

## 常见问题

### Q: 如何获取 Claude API 密钥？
A: 
- **国际/境外用户**：请访问 [Anthropic Console](https://console.anthropic.com/) 注册并获取 API 密钥。
- **国内用户**：请访问 [Moonshot Platform](https://platform.moonshot.cn/console/api-keys) 注册并获取 API 密钥。

### Q: 为什么使用 Moonshot 的 API URL？
A: 月之暗面最近发布的万亿参数模型 Kimi K2 兼容了 Anthropic 的 API 格式，使得中国大陆用户可以无缝体验 Claude Code。这不是代理服务，而是直接的兼容实现。

### Q: 容器退出后数据会丢失吗？
A: 是的，除非您使用 `-v` 参数挂载了本地目录。建议挂载工作目录和配置目录以持久化数据。

## 贡献指南

欢迎贡献代码和提出建议！

1. Fork 本仓库
2. 创建您的特性分支 (`git checkout -b feature/AmazingFeature`)
3. 提交您的更改 (`git commit -m 'Add some AmazingFeature'`)
4. 推送到分支 (`git push origin feature/AmazingFeature`)
5. 开启一个 Pull Request

## 许可证

本项目采用 MIT 许可证。详见 [LICENSE](LICENSE) 文件。

## 相关链接

- [Claude Code 官方文档](https://docs.anthropic.com/claude/docs/claude-code)
- [Anthropic 官网](https://www.anthropic.com/)
- [Docker Hub 镜像](https://hub.docker.com/r/huangsen365/claude-code)
- [Moonshot API Keys](https://platform.moonshot.cn/console/api-keys)
