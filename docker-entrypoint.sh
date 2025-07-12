#!/bin/bash

# Define color codes
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
GREEN='\033[1;32m'
RED='\033[1;31m'
NC='\033[0m' # No Color

# Check if ANTHROPIC_AUTH_TOKEN is already set
if [ -z "$ANTHROPIC_AUTH_TOKEN" ]; then
    clear
    echo -e "${YELLOW}==================================================${NC}"
    echo -e "${YELLOW}ANTHROPIC_AUTH_TOKEN not set. Please enter your API token:${NC}"
    echo -e "${YELLOW}ANTHROPIC_AUTH_TOKEN 未设置。请输入您的 API 密钥：${NC}"
    echo ""
    
    # Function to display with flashing URL
    display_with_flash() {
        while true; do
            for color in "$RED" "$YELLOW" "$GREEN" "$BLUE"; do
                tput cup 4 0
                echo -e "${BLUE}You can create an API Key at: ${color}https://platform.moonshot.cn/console/api-keys${NC}\033[K"
                echo -e "${BLUE}您可以到【月之暗面】创建官方 API 密钥【建议充值小额以得到良好体验】：${color}https://platform.moonshot.cn/console/api-keys${NC}\033[K"
                tput cup 8 0
                sleep 0.3
            done
        done
    }
    
    # Display initial content with infinite flashing
    display_with_flash &
    FLASH_PID=$!
    
    echo -e "${YELLOW}==================================================${NC}"
    echo ""
    echo -ne "${GREEN}API Token/API 密钥【粘贴后直接按回车Enter】: ${NC}"
    
    # Read input
    read -s ANTHROPIC_AUTH_TOKEN
    
    # Stop flashing if still running
    kill $FLASH_PID 2>/dev/null
    wait $FLASH_PID 2>/dev/null
    
    export ANTHROPIC_AUTH_TOKEN
    echo ""
    echo ""
    
    # Show asterisks based on token length
    if [ -n "$ANTHROPIC_AUTH_TOKEN" ]; then
        TOKEN_LENGTH=${#ANTHROPIC_AUTH_TOKEN}
        echo -n "Token received: "
        printf '*%.0s' $(seq 1 $TOKEN_LENGTH)
        echo ""
        echo ""
        echo "Token set successfully. / 密钥设置成功。"
        echo ""
        
        # Confirmation step with 10-second timeout
        CONFIRM=""
        for i in 10 9 8 7 6 5 4 3 2 1; do
            echo -ne "\r${GREEN}Continue? / 是否继续? [Y/n] (auto-confirm in / 自动确认倒计时: $i): ${NC}"
            read -t 1 -r CONFIRM
            if [ $? -eq 0 ]; then  # User pressed something
                break
            fi
        done
        echo ""
        
        # Default to Y if empty (just Enter pressed), timeout, or user enters yes formats
        # Only reject if user explicitly enters n/N/no/No
        if [[ -z "$CONFIRM" || "$CONFIRM" =~ ^[Yy]([Ee][Ss])?$ ]]; then
            echo "Starting Claude Code... / 正在启动 Claude Code..."
            echo ""
            
            # Countdown from 5
            for i in 5 4 3 2 1; do
                echo -ne "\r${GREEN}Starting in / 启动倒计时: $i${NC} "
                sleep 1
            done
            echo -ne "\r${GREEN}Launching... / 启动中...     ${NC}"
            echo ""
            echo ""
        else
            echo "Exiting. / 退出。"
            exit 0
        fi
    else
        echo "No token entered. / 未输入密钥。"
        exit 1
    fi
fi

# Execute the command passed to the container
exec "$@"