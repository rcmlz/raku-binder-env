#!/bin/bash
source ~/start

# currently we use an older version of rakudo from the package manager
# defined in apt.txt


mkdir -p .local/bin
mkdir -p /usr/lib/perl6/site/short
chmod 777 /usr/lib/perl6/site/short

echo 'export PATH=$HOME/.local/bin:$PATH' >> ~/start
export PATH=$HOME/.local/bin:$PATH

git clone https://github.com/ugexe/zef.git
cd zef
raku -I. bin/zef install .

#curl https://rakubrew.org/install-on-perl.sh | sh

# see https://raku.org/nav/1/install
# according to the above link, the following lines should be added to ~/.bashrc or ~/.zshrc
#echo 'eval "$($HOME/.rakubrew/bin/rakubrew init Bash)"' >> ~/start
#echo 'eval "$($HOME/.rakubrew/bin/rakubrew init Bash)"' >> ~/.bashrc
#echo 'eval "$($HOME/.rakubrew/bin/rakubrew init Bash)"' >> ~/.zshrc

#eval "$($HOME/.rakubrew/bin/rakubrew init Bash)"

# but that does not work. So, we add the following lines to ~/start and source it.
#echo 'export PATH=$HOME/.rakubrew/bin:$PATH' >> ~/start
#echo 'export PATH=$(rakubrew home)/shims:$PATH' >> ~/start
#echo 'rakubrew mode shim' >> ~/start

#export PATH=$HOME/.rakubrew/bin:$PATH
#export PATH=$(rakubrew home)/shims:$PATH
#rakubrew mode shim

# but that also did not work. Also booth together did not work.§

# I suspect it is the way binder and rakudo work together.

# list available versions
#rakubrew available

# download and install the latest Rakudo on MoarVM version
#rakubrew download

# show current version
raku -e 'say "Now running {$*RAKU.compiler.version}!"'

echo "zef version:"
zef --version