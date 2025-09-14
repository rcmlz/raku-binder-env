#!/bin/bash

curl https://rakubrew.org/install-on-perl.sh | sh

echo 'eval "$(/home/jovyan/.rakubrew/bin/rakubrew init Bash)"' >> ~/start
echo 'eval "$(/home/jovyan/.rakubrew/bin/rakubrew init Bash)"' >> ~/.bashrc

eval "$(/home/jovyan/.rakubrew/bin/rakubrew init Bash)"

# list available versions
rakubrew available

# download and install the latest Rakudo on MoarVM version
rakubrew download

# show current version
raku -e 'say "Now running {$*RAKU.compiler.version}!"'