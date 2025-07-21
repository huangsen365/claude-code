# Claude Code Docker

English | [中文](README.md)

## 🚀 Quick Start - One Command

```bash
docker run --rm -it -e ANTHROPIC_BASE_URL="https://api.moonshot.cn/anthropic" -w /root --name my-claude-code huangsen365/claude-code bash
```

Then run `claude` command inside the container to start Claude Code.

> 💡 **Note**: The container will start with a bash shell. Run the `claude` command to start Claude Code. You'll then be prompted to enter your API Key. Please have your Moonshot API Key ready.

## Introduction

Claude Code Docker is a Docker image that packages Anthropic's Claude Code CLI tool. It provides a ready-to-use environment that allows you to run Claude Code in a container without installing Node.js and related dependencies locally.

🔗 **Project Repository**: [https://github.com/huangsen365/claude-code](https://github.com/huangsen365/claude-code)

**🔥 Important: This project uses the API endpoint [https://platform.moonshot.cn/console/api-keys](https://platform.moonshot.cn/console/api-keys) by default, which is Moonshot's Kimi K2 trillion-parameter model providing Anthropic API-compatible service, enabling seamless Claude Code experience for users in mainland China!**

Claude Code is Anthropic's official command-line interface tool that helps you:
- Have interactive programming conversations with Claude AI
- Get code suggestions and solutions
- Perform various software engineering tasks

## Features

- 🐳 Lightweight Docker image based on the latest Ubuntu version
- 📦 Pre-installed with Node.js, npm, and Claude Code CLI
- 🚀 Supports custom API Base URL (e.g., using proxy services)
- 🔧 Zero configuration, ready to use out of the box
- 🌏 Uses Aliyun mirror for faster access in China

## Quick Start

### 1. Using Docker Hub Image (Recommended)

Pull and run from [Docker Hub](https://hub.docker.com/r/huangsen365/claude-code):

```bash
docker run --rm -it -e ANTHROPIC_BASE_URL="https://api.moonshot.cn/anthropic" -w /root --name my-claude-code huangsen365/claude-code bash
```

Then run `claude` command inside the container to start Claude Code.

### 2. Building Local Image

```bash
# Clone the repository
git clone https://github.com/huangsen365/claude-code.git
cd claude-code

# Build the image
docker build -t claude-code .

# Run the container
docker run --rm -it \
  -e ANTHROPIC_BASE_URL="https://api.moonshot.cn/anthropic" \
  -w /root \
  --name my-claude-code \
  claude-code bash

# Then run claude command inside the container
```

## Environment Variables

| Variable | Description | Default |
|----------|-------------|----------|
| ANTHROPIC_BASE_URL | Claude API 的基础 URL | https://api.moonshot.cn/anthropic |
| ANTHROPIC_API_KEY | Claude API key (prompted at runtime) | - |

## Usage

### Basic Usage

1. **First Run**: The container will prompt you to enter your API key when it starts
2. **Interactive Mode**: Enter your questions or code requirements, and Claude will help you
3. **Exit**: Use `Ctrl+C` or type `exit` to quit

### Mounting Local Directories

If you want Claude Code to access local project files:

```bash
docker run --rm -it \
  -e ANTHROPIC_BASE_URL="https://api.moonshot.cn/anthropic" \
  -v /path/to/your/project:/workspace \
  -w /workspace \
  --name my-claude-code \
  huangsen365/claude-code bash
```

Then run `claude` command inside the container.

### Using Different API Services

#### Using Official API
```bash
docker run --rm -it \
  -w /root \
  --name my-claude-code \
  huangsen365/claude-code bash
```

Then run `claude` command inside the container.

#### Using Moonshot (Kimi K2 Compatible Service)
```bash
docker run --rm -it -e ANTHROPIC_BASE_URL="https://api.moonshot.cn/anthropic" -w /root --name my-claude-code huangsen365/claude-code bash
```

Then run `claude` command inside the container.

## Advanced Configuration

### Persistent Configuration

If you want to save API keys and configuration, you can mount the configuration directory:

```bash
docker run --rm -it \
  -e ANTHROPIC_BASE_URL="https://api.moonshot.cn/anthropic" \
  -v ~/.config/claude:/root/.config/claude \
  -w /root \
  --name my-claude-code \
  huangsen365/claude-code bash
```

Then run `claude` command inside the container.

### Docker Compose Usage

Create a `docker-compose.yml` file:

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

Run:
```bash
docker-compose run --rm claude-code
```

Then run `claude` command inside the container.

## FAQ

### Q: How do I get a Claude API key?
A: 
- **International/Overseas Users**: Please visit [Anthropic Console](https://console.anthropic.com/) to register and obtain an API key.
- **China Mainland Users**: Please visit [Moonshot Platform](https://platform.moonshot.cn/console/api-keys) to register and obtain an API key.

### Q: Why use Moonshot's API URL?
A: Moonshot recently released the trillion-parameter model Kimi K2, which is compatible with Anthropic's API format, allowing users in mainland China to seamlessly experience Claude Code. This is not a proxy service, but a direct compatible implementation.

### Q: Will data be lost after the container exits?
A: Yes, unless you mount local directories using the `-v` parameter. It's recommended to mount working and configuration directories to persist data.

## Contributing

Contributions and suggestions are welcome!

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Related Links

- [Claude Code Official Documentation](https://docs.anthropic.com/claude/docs/claude-code)
- [Anthropic Official Website](https://www.anthropic.com/)
- [Docker Hub Image](https://hub.docker.com/r/huangsen365/claude-code)
- [Moonshot API Keys](https://platform.moonshot.cn/console/api-keys)
