#!/bin/bash

#groupdel lfs
#userdel -r lfs

if [ -z "$1" ];then
    echo "ERROR: not input partition"
    exit
fi

if [ ! -b /dev/$1 ]; then
    echo "ERROR: Can not find /dev/$1"
    exit
fi


echo "# 2.6. Setting The $LFS Variable"
export LFS=/mnt/lfs
echo $LFS

echo "# 2.7. Mounting the New Partition"
mkdir -pv $LFS
chmod -v 777 $LFS
mount -v -t ext4 /dev/$1 $LFS

echo "# 4.2. Creating the $LFS/sources Directory"
tar -xf lfs-packages-9.0.tar -C $LFS
cp *.sh $LFS/9.0
sed -i 's/$partition/'$1'/g' $LFS/9.0/ch7-9.sh
rm -rf $LFS/sources
mv $LFS/9.0 $LFS/sources
chmod -Rv a+wt $LFS/sources

echo "# 4.2. Creating the $LFS/tools Directory"
mkdir -v $LFS/tools
ln -sv $LFS/tools /

echo "# 4.3. Adding the LFS User"
groupadd lfs
useradd -s /bin/bash -g lfs -m -k /dev/null lfs
echo "Enter lfs user new password"
passwd lfs << "EOF"
lfs
lfs
EOF
chown -v lfs $LFS/tools
chown -v lfs $LFS/sources

su - lfs << "INPUT"
echo "# 4.4. Setting Up the Environment"
cat > ~/.bash_profile << "EOF"
exec env -i HOME=$HOME TERM=$TERM PS1='\u:\w\$ ' /bin/bash
EOF
cat > ~/.bashrc << "EOF"
set +h
umask 022
LFS=/mnt/lfs
LC_ALL=POSIX
LFS_TGT=$(uname -m)-lfs-linux-gnu
PATH=/tools/bin:/bin:/usr/bin
export LFS LC_ALL LFS_TGT PATH
EOF
source ~/.bash_profile
INPUT

echo "Setting Up the Environment Successful"
echo 'next command "bash $LFS/sources/ch5.sh"'
su - lfs

echo "end ch2-4.sh"
