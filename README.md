可以将
http://ftp.apnic.net/stats/apnic/delegated-apnic-latest
转换为
add 1.0.1.0 mask 255.255.255.0 default METRIC default IF default
格式的文件

一共生成add.txt和del.txt两个文件

执行命令
bash -c "$(wget -O- https://raw.githubusercontent.com/ampetervip/routelist/main/DTR.sh)"


