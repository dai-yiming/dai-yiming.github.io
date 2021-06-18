#!/bin/bash
echo "Deleting current docs..."
rm -rf ./dai-yiming.github.io/*
echo "Starting building..."
sphinx-build -E -b html ./source ./dai-yiming.github.io
echo "Add .nojekyll file..."
touch ./docs/.nojekyll

git add .
git commit -m "$(date)"
git push -u origin main
