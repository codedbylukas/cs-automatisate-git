cd ./binarys/release/
for d in */; do zip -r "${d%/}.zip" "$d"; done
cd ../..

gh release create v1.0.0 ./binarys/release/*.zip --title "Version 1.0.0" --notes "Automatic generated builds."
