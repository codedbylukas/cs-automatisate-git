#!/bin/bash

dotnet publish -r win-x64 --self-contained true -p:PublishSingleFile=true -p:FixedNames=true
dotnet publish -r linux-x64 --self-contained true -p:PublishSingleFile=true -p:FixedNames=true
dotnet publish -r osx-arm64 --self-contained true -p:PublishSingleFile=true -p:FixedNames=true

dotnet publish -r win-x64 -c Release --self-contained true -p:PublishSingleFile=true -p:FixedNames=true
dotnet publish -r linux-x64 -c Release --self-contained true -p:PublishSingleFile=true -p:FixedNames=true
dotnet publish -r osx-arm64 -c Release --self-contained true -p:PublishSingleFile=true -p:FixedNames=true

# Debug Builds
rsync -av --exclude="*.pdb" ./bin/Debug/net6.0/linux-x64/publish/ ./binarys/debug/linux-x64/
rsync -av --exclude="*.pdb" ./bin/Debug/net6.0/osx-arm64/publish/ ./binarys/debug/osx-arm64/
rsync -av --exclude="*.pdb" ./bin/Debug/net6.0/win-x64/publish/ ./binarys/debug/win-x64/

# Release Builds
rsync -av --exclude="*.pdb" ./bin/Release/net6.0/linux-x64/publish/ ./binarys/release/linux-x64/
rsync -av --exclude="*.pdb" ./bin/Release/net6.0/osx-arm64/publish/ ./binarys/release/osx-arm64/
rsync -av --exclude="*.pdb" ./bin/Release/net6.0/win-x64/publish/ ./binarys/release/win-x64/