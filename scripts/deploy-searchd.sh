#!/bin/bash

PROJECT="/home/tk/tksync/proj/search-engine/"

cd "$PROJECT"

echo 'Pull code  ...'
git pull

echo 'Will kill searchd and unmount in 5 sec ...'
sleep 5

pushd searchd/
echo 'Shutdown searchd ...'
./scripts/respawn.sh kill
popd

pushd indexer/
echo 'Unmount index vdisk ...'
./scripts/vdisk-umount.sh
popd

echo 'Will rebuild search-engine and deploy in 5 sec ...'
sleep 5

echo 'Rebuilding ...'
make new

pushd indexer/
echo 'Mount index vdisk ...'
./scripts/vdisk-mount.sh `whoami` ./tmp
popd

pushd searchd/
echo 'Start searchd ...'
./scripts/respawn.sh ./run/searchd.out -e -i ../indexer/tmp/ &
popd

echo 'Deploy done.'
