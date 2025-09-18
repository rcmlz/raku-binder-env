#!/bin/bash
source ~/start

curl https://rakubrew.org/install-on-perl.sh | sh

# see https://raku.org/nav/1/install
# according to the above link, the following lines should be added to ~/.bashrc or ~/.zshrc
echo 'eval "$($HOME/.rakubrew/bin/rakubrew init Bash)"' >> ~/start
echo 'eval "$($HOME/.rakubrew/bin/rakubrew init Bash)"' >> ~/.bashrc
eval "$($HOME/.rakubrew/bin/rakubrew init Bash)"

# list available versions
# rakubrew available

# download and install the latest Rakudo on MoarVM version
rakubrew download

# show current version
echo "raku version:"
raku -e 'say "Now running {$*RAKU.compiler.version}!"'

echo "zef version:"
zef --version