#!/bin/bash
IDX=index2

umount mnt-${IDX}.img
rm -f ${IDX}.img

./vdisk-creat.sh reiserfs
mv vdisk.img ${IDX}.img 

./vdisk-mount.sh reiserfs ${IDX}.img

echo tmux new -d -s 'indexing' "\'./indexer.out -p ../corpus/ -o mnt-${IDX}.img 2> ${IDX}.log\'"
