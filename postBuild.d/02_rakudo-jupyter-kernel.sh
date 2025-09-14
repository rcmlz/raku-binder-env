#!/bin/bash
source ~/start

export ZEF_TEST_DEGREE=4
export ZEF_FETCH_DEGREE=4

# instruction taken from https://github.com/antononcube/Raku-Jupyter-Chatbook
zef install --/test --deps-only Jupyter::Chatbook
zef install --/test Jupyter::Chatbook
jupyter-chatbook.raku --generate-config
