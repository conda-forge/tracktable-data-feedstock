#!/bin/sh

# Build script for tracktable-data
#
# The big thing we need to do is make sure we've re-hydrated
# all the smudge files from Git LFS.  The conda-build process
# clones the repository before LFS is active so we need
# to do that part manually.

echo "--- Running git lfs install"
$BUILD_PREFIX/git lfs install

echo "--- Running git lfs fetch"
$BUILD_PREFIX/git lfs fetch

echo "--- Running du"
du $SRC_DIR

echo "--- Running pip install"
$PYTHON -m pip install .


