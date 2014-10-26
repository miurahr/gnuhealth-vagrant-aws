#!/bin/sh
BASEDIR=`dirname $0`
VN=314
DLFILE=byomei${VN}.zip
cd $BASEDIR

# clean up
rm -rf byomei${VN}
rm $DLFILE

wget http://www2.medis.or.jp/stdcd/byomei/download/file/$DLFILE
unzip $DLFILE byomei${VN}/main/nmain${VN}.txt
ruby nmain_gdbm.rb byomei${VN}/main/nmain${VN}.txt

rm -rf byomei${VN}
ruby diseases_trans.rb
