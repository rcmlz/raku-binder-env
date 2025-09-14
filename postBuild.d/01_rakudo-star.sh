#!/bin/bash

# instruction taken from see https://rakudo.org/star/source
INSTALL_DIR=~/rakudo

mkdir $INSTALL_DIR && cd $INSTALL_DIR
curl -LJO https://rakudo.org/latest/star/src
tar -xzf rakudo-star-*.tar.gz
mv rakudo-star-*/* .
rm -fr rakudo-star-*

./bin/rstar install

# ensure jupyter-kernel.raku is in path at startup of jupyter
export PATH=$INSTALL_DIR/bin/:$INSTALL_DIR/share/perl6/site/bin:$INSTALL_DIR/share/perl6/vendor/bin:$INSTALL_DIR/share/perl6/core/bin:$PATH

echo "export PATH=$PATH" >> ~/start
