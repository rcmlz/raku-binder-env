#!/bin/bash
source ~/start

export ZEF_TEST_DEGREE=`raku -e "say $*Kernel.cpu-cores"`
export ZEF_FETCH_DEGREE=$ZEF_TEST_DEGREE

echo "more libraries from https://raku.land/ that might be useful"
zef update
cat $HOME/postBuild.d/packages.txt | raku -e 'for $*IN.lines.grep(/^^\w/) { say shell "zef install --/test \"$_\"" }'
