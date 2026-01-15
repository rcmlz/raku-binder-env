#!/bin/bash
source ~/start

export ZEF_TEST_DEGREE=`raku -e "say $*Kernel.cpu-cores"`
export ZEF_FETCH_DEGREE=$ZEF_TEST_DEGREE

export PACKAGE_NAME='Jupyter::Kernel:auth<zef:bduggan>'

echo "instruction taken from https://github.com/bduggan/raku-jupyter-kernel"

echo "Installing $PACKAGE_NAME dependencies only"
zef install --/test --deps-only "$PACKAGE_NAME"

echo "Installing $PACKAGE_NAME kernel"
zef install --/test "$PACKAGE_NAME"

echo "Generating $PACKAGE_NAME config"
jupyter-kernel.raku --generate-config --location=$HOME/.local/share/jupyter/kernels/raku

echo "Patching kernel.json - removing the .raku"
# cp $HOME/.local/share/jupyter/kernels/raku/kernel.json $HOME/postBuild.d/
# vi $HOME/postBuild.d/kernel.json
# diff --unified $HOME/.local/share/jupyter/kernels/raku/kernel.json kernel.json > kernel.json.patch
# echo "\n" >> $HOME/postBuild.d/kernel.json.patch
patch -d $HOME/.local/share/jupyter/kernels/raku/ < $HOME/postBuild.d/kernel.json.patch

echo "patched kernel.json"
cat $HOME/.local/share/jupyter/kernels/raku/kernel.json
