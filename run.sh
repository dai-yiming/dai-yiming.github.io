#!/bin/bash
echo "removing everything under 'docs'..."
make clean
echo "starting building..."
make html
echo "add .nojekyll file..."
touch ./build/.nojekyll
