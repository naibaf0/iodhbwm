#!/bin/bash

shopt -s extglob

# Get latest tag
#latestTag=$(git describe --tags `git rev-list --tags --max-count=1`)
latestTag=$(git describe --tags)

# Delete iodhbwm directory if exists
if [ -d release/$latestTag ]
then
	rm -r release/$latestTag
fi

echo "Create directory"

mkdir -p tmp/$latestTag/iodhbwm

# Copy all files except of files needed only
# for development
echo "Copy files into tmp/iodhbwm"
cp -r include tmp/$latestTag/iodhbwm
cp -r examples tmp/$latestTag/iodhbwm
cp dhbw-logo.png tmp/$latestTag/iodhbwm
cp iodhbwm* tmp/$latestTag/iodhbwm
cp README* tmp/$latestTag/iodhbwm
cp LICENCE* tmp/$latestTag/iodhbwm

mkdir -p release
#cd tmp
#tar cfvz ../release/iodhbwm.tar.gz iodhbwm
#cd ..

echo "Copy directory iodhbwm into release"
cp -r tmp/* release

rm -r tmp
