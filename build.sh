#!/bin/bash
set -e

os_list=(
    "win-x64"
    "linux-x64"
    "osx-arm64"
)

echo "Building C# Git Tool..."
for os in "${os_list[@]}"; do
    dotnet publish -r "$os" -c Debug --self-contained true -p:PublishSingleFile=true -p:FixedNames=true
    dotnet publish -r "$os" -c Release --self-contained true -p:PublishSingleFile=true -p:FixedNames=true
done

echo "Copying Debug builds..."
for os in "${os_list[@]}"; do
    mkdir -p "./binarys/debug/$os/"
    rsync -av --exclude="*.pdb" "./bin/Debug/net6.0/$os/publish/" "./binarys/debug/$os/"
done

echo "Copying Release builds..."
for os in "${os_list[@]}"; do
    mkdir -p "./binarys/release/$os/"
    rsync -av --exclude="*.pdb" "./bin/Release/net6.0/$os/publish/" "./binarys/release/$os/"
done

mkdir -p ./Linux/usr/bin/
cp ./binarys/release/linux-x64/* ./Linux/usr/bin/

echo "Cleaning up old Debian-package..."
rm -f ./Linux.deb

echo "Building Debian-package..."
dpkg-deb --root-owner-group --build Linux
