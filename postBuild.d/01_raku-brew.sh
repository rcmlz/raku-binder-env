#!/bin/bash

curl https://rakubrew.org/install-on-perl.sh | sh

echo 'eval "$(/home/jovyan/.rakubrew/bin/rakubrew init Bash)"' >> ~/start
