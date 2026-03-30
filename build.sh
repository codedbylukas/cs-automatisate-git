#!/bin/bash

dotnet publish -r win-x64 --self-contained true -p:PublishSingleFile=true -p:FixedNames=true
dotnet publish -r linux-x64 --self-contained true -p:PublishSingleFile=true -p:FixedNames=true
dotnet publish -r osx-arm64 --self-contained true -p:PublishSingleFile=true -p:FixedNames=true

dotnet publish -r win-x64 -c Release --self-contained true -p:PublishSingleFile=true -p:FixedNames=true
dotnet publish -r linux-x64 -c Release --self-contained true -p:PublishSingleFile=true -p:FixedNames=true
dotnet publish -r osx-arm64 -c Release --self-contained true -p:PublishSingleFile=true -p:FixedNames=true
