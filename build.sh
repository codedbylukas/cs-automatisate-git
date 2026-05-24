#!/bin/bash

set -e

os_list=(
    "win-x64"
    "win-x86"
    "win-arm64"
    "linux-x64"
    "linux-arm64"
    "linux-arm"
    "linux-musl-x64"
    "linux-musl-arm64"
    "osx-x64"
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

mkdir -p ./linux-arm/usr/bin/
cp ./binarys/release/linux-arm/* ./linux-arm/usr/bin/

mkdir -p ./linux-x64/usr/bin/
cp ./binarys/release/linux-x64/* ./linux-x64/usr/bin/

echo "Cleaning up old Debian-package..."
rm -f ./linux-x64.deb
rm -f ./linux-arm.deb

echo "Building Debian-package..."
dpkg-deb --root-owner-group --build linux-x64
dpkg-deb --root-owner-group --build linux-arm
