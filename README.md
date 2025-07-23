# 一键修改DNS
这是一个可以一键修改服务器DNS的脚本，支持Linux系统（包括Debian、CentOS、Alpine、Ubuntu），内置七个DNS，支持一键修改。

![截图](https://raw.githubusercontent.com/qmsdh/DNS/refs/heads/main/img.png)

用ssh连接服务器后运行下面的脚本即可一键修改DNS，方便快捷

# 一键安装脚本（首次）
```bash
curl -sSL https://raw.githubusercontent.com/qmsdh/DNS/refs/heads/main/dns_set.sh -o dns_set.sh && chmod +x dns_set.sh && bash dns_set.sh && sudo qmsdns
```

# 再次运行
```bash
sudo qmsdns
```
