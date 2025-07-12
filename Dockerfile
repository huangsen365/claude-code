FROM ubuntu:latest

# First install ca-certificates using default repositories
RUN apt-get update && \
    apt-get install -y ca-certificates
#    apt-get install -y ca-certificates && \
#    apt-get clean && \
#    rm -rf /var/lib/apt/lists/*

# Replace Ubuntu repository URLs with mirror
#RUN sed -i 's|http://archive.ubuntu.com/ubuntu/|https://archive-ubuntu-com.jiasu.yunbiyun.com/ubuntu/|g' /etc/apt/sources.list.d/ubuntu.sources && \
#    sed -i 's|http://security.ubuntu.com/ubuntu/|https://archive-ubuntu-com.jiasu.yunbiyun.com/ubuntu/|g' /etc/apt/sources.list.d/ubuntu.sources

RUN sed -i 's|http://archive.ubuntu.com/ubuntu/|https://mirrors.aliyun.com/ubuntu/|g' /etc/apt/sources.list.d/ubuntu.sources && \
    sed -i 's|http://security.ubuntu.com/ubuntu/|https://mirrors.aliyun.com/ubuntu/|g' /etc/apt/sources.list.d/ubuntu.sources


# Update package list and install Node.js and npm
RUN apt-get update && \
    apt-get install -y nodejs npm && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install Claude Code globally
RUN npm install -g @anthropic-ai/claude-code

# Define environment variables (only BASE_URL, token will be prompted)
ENV ANTHROPIC_BASE_URL=""

# Copy entrypoint script
COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# Set the entrypoint
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
CMD ["claude"]

