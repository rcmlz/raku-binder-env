#!/bin/bash
source ~/start

echo 'echo $PATH'
echo $PATH

export ZEF_TEST_DEGREE=`raku -e "say $*Kernel.cpu-cores"`
export ZEF_FETCH_DEGREE=$ZEF_TEST_DEGREE

export PACKAGE_NAME='Jupyter::Chatbook:auth<zef:antononcube>'

echo "instruction taken from https://github.com/antononcube/Raku-Jupyter-Chatbook"

echo "Installing $PACKAGE_NAME dependencies only"
zef install --/test --deps-only "$PACKAGE_NAME"

echo "Installing $PACKAGE_NAME kernel"
zef install --/test "$PACKAGE_NAME"

echo "Generating $PACKAGE_NAME config"
jupyter-chatbook-raku --generate-config

echo "more libraries from https://raku.land/ that might be useful"
zef update
cat $HOME/postBuild.d/packages.txt | raku -e 'for $*IN.lines.grep(/^^\w/) { say shell "zef install --/test \"$_\"" }'
