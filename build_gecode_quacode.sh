#!/bin/bin/bash

# build everything and clean (partially)

# install dependencies
apt-get update
apt-get install subversion autoconf cmake g++ --yes

# get Gecode from official repository
cd /usr/lib/
svn --non-interactive --username anonymous --password foo@bar.com --trust-server-cert checkout https://svn.gecode.org/svn/gecode/trunk

# build Gecode
cd /usr/lib/trunk
./configure --disable-gist --disable-flatzinc
make -j 5

# build Quacode
cd /usr/lib/trunk/contribs/quacode
cmake -DGECODE_BIN=/usr/lib/trunk/ -DGECODE_SRC=/usr/lib/trunk/ .
make -j 5

# relink
ln -s /usr/lib/trunk/contribs/quacode /usr/lib/quacode
ln -s /usr/lib/trunk/gecode /usr/lib/gecode

# clean dependencies
apt-get autoremove subversion autoconf cmake g++ --yes
cd /
