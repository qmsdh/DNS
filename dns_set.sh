#!/bin/sh

# 安装路径
TARGET_PATH="/usr/local/bin/qmsdns"

echo "正在安装 qmsdns 到 $TARGET_PATH..."

# 写入脚本内容
cat << 'EOF' > "$TARGET_PATH"
#!/bin/sh

if [ "$(id -u)" -ne 0 ]; then
    echo "请使用 root 用户或 sudo 来运行此脚本"
    exit 1
fi

cat << 'EOM'

版本号：1.0.0
欢迎使用秋名山一键修改DNS脚本！
秋名山博客：https://blog.qmsdh.com/
本项目地址：https://github.com/qmsdh/DNS
特别鸣谢：我的脑洞、ChatGPT
快捷启动指令：sudo qmsdns
----------
请选择要设置的 DNS（输入对应序号）：
 1) Cloudflare   1.1.1.1
 2) Cloudflare   1.0.0.1
 3) Google        8.8.8.8
 4) Google        8.8.4.4
 5) 阿里云       223.5.5.5
 6) 阿里云       223.6.6.6
 7) 腾讯云       119.29.29.29
 8) 自定义 DNS
EOM

printf "请输入序号 [1-8]: "
read choice

case "$choice" in
    1) DNS_IP="1.1.1.1"     ;;
    2) DNS_IP="1.0.0.1"     ;;
    3) DNS_IP="8.8.8.8"     ;;
    4) DNS_IP="8.8.4.4"     ;;
    5) DNS_IP="223.5.5.5"   ;;
    6) DNS_IP="223.6.6.6"   ;;
    7) DNS_IP="119.29.29.29";;
    8)
        printf "请输入自定义 DNS IP: "
        read DNS_IP
        if ! echo "$DNS_IP" | grep -Eq '^([0-9]{1,3}\.){3}[0-9]{1,3}$'; then
            echo "无效的 IP 地址！"
            exit 1
        fi
        ;;
    *)
        echo "无效的选择，脚本退出。"
        exit 1
        ;;
esac

cp /etc/resolv.conf /etc/resolv.conf.bak.$(date +%Y%m%d%H%M%S)
echo "nameserver $DNS_IP" > /etc/resolv.conf
echo "已成功将 DNS 更改为：$DNS_IP"
EOF

# 设置执行权限
chmod +x "$TARGET_PATH"

echo "安装完成！现在你可以使用以下命令来运行脚本："
echo ""
echo "  sudo qmsdns"
echo ""
