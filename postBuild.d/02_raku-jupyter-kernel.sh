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
# cp $HOME/.local/share/jupyter/kernels/raku/kernel.json $HOME/postBuild.d/
# vi $HOME/postBuild.d/kernel.json
# diff --unified $HOME/.local/share/jupyter/kernels/raku/kernel.json kernel.json > kernel.json.patch
# echo "\n" >> $HOME/postBuild.d/kernel.json.patch
patch -d $HOME/.local/share/jupyter/kernels/raku/ < $HOME/postBuild.d/kernel.json.patch

echo "patched kernel.json"
cat $HOME/.local/share/jupyter/kernels/raku/kernel.json

# more libraries that might be useful
zef update
cat $HOME/postBuild.d/packages.txt | raku -e 'for $*IN.lines.grep(/^^\w/) { say shell "zef install --/test \"$_\"" }'
