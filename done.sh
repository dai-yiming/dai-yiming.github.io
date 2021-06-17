#!/bin/bash
echo "deleting current documentation..."
rm -rf docs/
echo "starting building..."
sphinx-build -E -b html ./source ./docs
echo "add .nojekyll file..."
touch ./docs/.nojekyll

git add .
git commit -m "$(date)"
git push -u origin main
