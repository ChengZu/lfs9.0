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

```Bash
su
```
```Bash
bash ch2-4.sh sha5
```

```Bash
bash $LFS/sources/ch5.sh
```

```Bash
exit
```

```Bash
bash ch6-1.sh
```

```Bash
bash /sources/ch6-2.sh
```

```Bash
exec /tools/bin/bash --login +h 
```

```Bash
bash /sources/ch6-3.sh
```

```Bash
logout
```

```Bash
bash lfschroot.sh
```


```Bash
bash /sources/ch7-9.sh
```

```Bash
logout
```

```Bash
update-grub
```
