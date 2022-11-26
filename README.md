====================================================
WireGuard分流IP生成工具
一共生成add.txt和del.txt两个文件
执行脚本生成
bash -c "$(wget -O- https://raw.githubusercontent.com/ampetervip/routelist/main/DTR.sh)"
====================================================
把以下两条命令加入到TunSafe配置文件中
PreUp = start X:\...\routes-up.bat
PostDown = start X:\...\routes-down.bat
====================================================
