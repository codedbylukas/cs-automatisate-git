#!/bin/bash
set -e

echo "Enter new version (e.g., 1.0.1):"
read version

echo "⬆ update version to: $version"
sed -i "s/Version: .*/Version: $version/" Linux/DEBIAN/control

./build.sh

echo "Copying Linux binaries to package folder..."
mv ./Linux.deb ./binarys/release/CSharpGitTool_$version.deb 

cd ./binarys/release/
for d in */; do
    if [ -d "$d" ]; then
        zip -r "${d%/}.zip" "$d"
    fi
done
cd ../..

gh release create "v$version" ./binarys/release/*.zip ./binarys/release/*.deb --title "Version $version" --notes "Automatic generated builds."
