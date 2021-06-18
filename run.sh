#!/bin/bash
echo "removing everything under 'docs'..."
rm -rfv ./docs/*
echo "starting building..."
sphinx-build -E -b html ./source ./docs
echo "add .nojekyll file..."
touch ./docs/.nojekyll
