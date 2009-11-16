#!/bin/sh

GLUSTERFS=$1
OLDDIR=`pwd`

for i in `ls | grep "^[0-9]*$"|sort -n`
do
   cd $i/regr
   if [ -f ./testcase ];then	
   	./testcase $GLUSTERFS
   fi
   cd $OLDDIR
done
