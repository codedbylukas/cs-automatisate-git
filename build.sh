#!/bin/bash

echo "Building C# Git Tool..."
dotnet publish -r win-x64 --self-contained true -p:PublishSingleFile=true -p:FixedNames=true
dotnet publish -r linux-x64 --self-contained true -p:PublishSingleFile=true -p:FixedNames=true
dotnet publish -r osx-arm64 --self-contained true -p:PublishSingleFile=true -p:FixedNames=true

dotnet publish -r win-x64 -c Release --self-contained true -p:PublishSingleFile=true -p:FixedNames=true
dotnet publish -r linux-x64 -c Release --self-contained true -p:PublishSingleFile=true -p:FixedNames=true
dotnet publish -r osx-arm64 -c Release --self-contained true -p:PublishSingleFile=true -p:FixedNames=true

# Debug Builds
echo "Copying Debug builds..."
rsync -av --exclude="*.pdb" ./bin/Debug/net6.0/linux-x64/publish/ ./binarys/debug/linux-x64/
rsync -av --exclude="*.pdb" ./bin/Debug/net6.0/osx-arm64/publish/ ./binarys/debug/osx-arm64/
rsync -av --exclude="*.pdb" ./bin/Debug/net6.0/win-x64/publish/ ./binarys/debug/win-x64/

# Release Builds
echo "Copying Release builds..."
rsync -av --exclude="*.pdb" ./bin/Release/net6.0/linux-x64/publish/ ./binarys/release/linux-x64/
rsync -av --exclude="*.pdb" ./bin/Release/net6.0/osx-arm64/publish/ ./binarys/release/osx-arm64/
rsync -av --exclude="*.pdb" ./bin/Release/net6.0/win-x64/publish/ ./binarys/release/win-x64/

# Update Version
CURRENT_VERSION=$(grep "Version:" Linux/DEBIAN/control | awk '{print $2}')
NEW_VERSION=$(echo $CURRENT_VERSION | awk -F. '{$NF = $NF + 1;} 1' OFS=.)
echo "⬆Update Version: $CURRENT_VERSION -> $NEW_VERSION"
sed -i "s/Version: .*/Version: $NEW_VERSION/" Linux/DEBIAN/control

# make folder if needed
mkdir -p ./Linux/usr/bin/

echo "Copying Linux binaries to package folder..."
cp ./binarys/release/linux-x64/* ./Linux/usr/bin/
mv ./Linux.deb ./binarys/release/linux-x64/CSharpGitTool_$NEW_VERSION.deb 

# --- build debian package ---
echo "Cleaning up old Debian-package..."
rm -f ./Linux.deb
echo "build Debian-package..."
dpkg-deb --root-owner-group --build Linux


