#!/bin/bash
# GeoClaw 启动脚本

echo "🦞 GeoClaw 地质智能分析助手"
echo "================================"

# 检查依赖
if ! command -v streamlit &> /dev/null; then
    echo "⚠️ Streamlit 未安装，正在安装..."
    pip install streamlit -q
fi

# 检查智谱 SDK
python3 -c "import zhipuai" 2>/dev/null
if [ $? -ne 0 ]; then
    echo "⚠️ 智谱 SDK 未安装，正在安装..."
    pip install zhipuai -q
fi

# 检查 API Key
if [ ! -f ~/.openclaw/.env ]; then
    echo "⚠️ 请先配置智谱 API Key"
    echo "   1. 访问 https://bigmodel.cn/usercenter/proj-mgmt/apikeys 获取 API Key"
    echo "   2. 创建 ~/.openclaw/.env 文件"
    echo "   3. 添加: ZHIPU_API_KEY=your_api_key"
    exit 1
fi

# 启动应用
echo "🚀 启动 Streamlit 应用..."
cd ~/openclaw-game/app
streamlit run geoclaw.py
