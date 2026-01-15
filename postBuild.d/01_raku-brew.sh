#!/bin/bash
source ~/start

RAKUVERSION='moar-2025.12'

curl https://rakubrew.org/install-on-perl.sh | sh

# see https://raku.org/nav/1/install
# according to the above link, the following lines should be added to ~/.bashrc or ~/.zshrc
echo 'eval "$($HOME/.rakubrew/bin/rakubrew init Bash)"' >> ~/start
echo 'eval "$($HOME/.rakubrew/bin/rakubrew init Bash)"' >> ~/.bashrc
eval "$($HOME/.rakubrew/bin/rakubrew init Bash)"

# list available versions
rakubrew available

# download and install pre-defined Rakudo on MoarVM version
rakubrew download $RAKUVERSION

# show current version
cat $HOME/postBuild.d/raku.asciiart
raku --version

cat $HOME/postBuild.d/zef.asciiart
zef --version

# add rakubrew bin to PATH
MYRAKUPATH='export PATH=/home/jovyan/.rakubrew/bin:/home/jovyan/.rakubrew/versions/' + $RAKUVERSION + '/share/perl6/site/bin:$PATH'
echo $MYRAKUPATH >> ~/start
