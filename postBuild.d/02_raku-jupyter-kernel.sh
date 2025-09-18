#!/bin/bash
source ~/start

export ZEF_TEST_DEGREE=4
export ZEF_FETCH_DEGREE=4

export PACKAGE_NAME='Jupyter::Chatbook:auth<zef:antononcube>'

echo "instruction taken from https://github.com/antononcube/Raku-Jupyter-Chatbook"

echo "Installing $PACKAGE_NAME dependencies only"
zef install --/test --deps-only "$PACKAGE_NAME"

echo "Installing $PACKAGE_NAME kernel"
zef install --/test "$PACKAGE_NAME"

echo "Generating $PACKAGE_NAME config"
jupyter-chatbook --generate-config

echo "Patching kernel.json - removing the .raku"
# diff --unified $HOME/.local/share/jupyter/kernels/raku/kernel.json kernel.json > kernel.json.patch
patch -d /home/jovyan/.local/share/jupyter/kernels/raku/  < kernel.json.patch