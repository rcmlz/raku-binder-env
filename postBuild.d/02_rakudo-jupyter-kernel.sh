#!/bin/bash
source ~/start

export ZEF_TEST_DEGREE=4
export ZEF_FETCH_DEGREE=4

echo "instruction taken from https://github.com/antononcube/Raku-Jupyter-Chatbook"

echo "Installing Jupyter::Chatbook dependencies only"
zef install --/test --deps-only Jupyter::Chatbook

echo "Installing Jupyter::Chatbook kernel"
zef install --/test Jupyter::Chatbook

echo "Generating Jupyter::Chatbook config"
jupyter-chatbook --generate-config
