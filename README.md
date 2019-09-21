# lfs9.0

快速编译LFS9.0 
终端依次输入下面指令

检查主机是否满足条件
```Bash
bash version-check.sh
```

下载源码包
```Bash
wget http://mirror.jaleco.com/lfs/pub/lfs/lfs-packages/lfs-packages-9.0.tar
```
终端root用户
```Bash
su
```
执行2到4章内容

sda5换成你要安装的硬盘分区名，分区格式ext4
```Bash
bash ch2-4.sh sda5
```
执行5章内容
```Bash
bash $LFS/sources/ch5.sh
```
退出lfs用户
```Bash
exit
```
执行6章内容
```Bash
bash ch6-1.sh
```
执行6章内容
```Bash
bash /sources/ch6-2.sh
```
终端重新登录
```Bash
exec /tools/bin/bash --login +h 
```
执行6章内容
```Bash
bash /sources/ch6-3.sh
```
退出chroot
```Bash
logout
```
进入chroot
```Bash
bash lfschroot.sh
```
执行7到9章内容
```Bash
bash /sources/ch7-9.sh
```
退出chroot
```Bash
logout
```
更新grub,自动加入开机启动选项
```Bash
update-grub
```



lfs用户密码：lfs


root用户密码：root
