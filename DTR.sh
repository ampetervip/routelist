#!/bin/bash
#下载路由表
wget -O cnip_0.txt http://ftp.apnic.net/stats/apnic/delegated-apnic-latest
#处理转换路由表
cat cnip_0.txt | awk -F '|' '/CN/&&/ipv4/ {print $4 "/" 32-log($5)/log(2)}' > cnip_1.txt
#下载路由表
wget -O CIDR.sh https://raw.githubusercontent.com/ampetervip/routelist/main/CIDR.sh
#修改执行权限
chmod +x CIDR.sh
#精简路由表
./CIDR.sh < cnip_1.txt > cnip_2.txt
#转换路由命令表
#每行前加
sed "s/^/add &/g" cnip_2.txt > cnip_add.txt
sed "s/^/delete &/g" cnip_2.txt > cnip_del.txt
#每行后加
sed "s/$/& default METRIC default IF default/g" cnip_add.txt > add.txt
sed "s/$/& default METRIC default IF default/g" cnip_del.txt > del.txt
#删除文件
rm -f cnip_0.txt
rm -f cnip_1.txt
rm -f cnip_2.txt
rm -f cnip_add.txt
rm -f cnip_del.txt
