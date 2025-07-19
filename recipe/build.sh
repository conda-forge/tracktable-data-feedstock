#!/bin/sh

# Build script for tracktable-data
#
# The big thing we need to do is make sure we've re-hydrated
# all the smudge files from Git LFS.  The conda-build process
# clones the repository before LFS is active so we need
# to do that part manually.

echo "--- Path:"
echo $PATH

echo "--- Running git lfs install"
git lfs install

echo "--- Running git lfs fetch"
git lfs fetch

echo "--- Running du"
du $SRC_DIR

echo "--- Checking for smudge files"
find \$SRC_DIR/tracktable-data -type f \
   | grep -v .git \
   | xargs grep -l "version https://git-lfs.github.com/spec/v1"
status=$?
if [ $status -eq 0 ]; then
  echo "ERROR: Smudge files found in repository"
  exit 1
fi


echo "--- Running pip install"
$PYTHON -m pip install .


