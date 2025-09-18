#!/bin/bash

curl https://rakubrew.org/install-on-perl.sh | sh

echo 'eval "$($HOME/.rakubrew/bin/rakubrew init Bash)"' >> ~/start
eval "$($HOME/.rakubrew/bin/rakubrew init Bash)"

echo 'export PATH=$HOME/.rakubrew/bin:$PATH' >> ~/start
echo 'export PATH=$(rakubrew home)/shims:$PATH' >> ~/start
echo 'rakubrew mode shim' >> ~/start

export PATH=$HOME/.rakubrew/bin:$PATH
export PATH=$(rakubrew home)/shims:$PATH

# list available versions
rakubrew available

# download and install the latest Rakudo on MoarVM version
rakubrew download

# show current version
raku -e 'say "Now running {$*RAKU.compiler.version}!"'