#!/bin/bin/bash

# build everything and clean (partially)

# install dependencies
apt-get update
apt-get install expect subversion autoconf cmake g++ --yes

# get Gecode from official repository
cd /usr/lib/
expect svn_gecode.exp
cd /usr/lib/trunk
# dirty hack to fix bad checkout
sleep 5
svn --username anonymous --password foo@bar.com cleanup
sleep 5
svn --username anonymous --password foo@bar.com up

# build Gecode
./configure --disable-gist --disable-flatzinc
make

# build Quacode
cd /usr/lib/trunk/contribs/quacode
cmake -DGECODE_BIN=/usr/lib/trunk/ -DGECODE_SRC=/usr/lib/trunk/ .
make

# relink
ln -s /usr/lib/trunk/contribs/quacode /usr/lib/quacode
ln -s /usr/lib/trunk/gecode /usr/lib/gecode

# clean dependencies
apt-get autoremove expect subversion autoconf cmake g++ --yes
cd /
