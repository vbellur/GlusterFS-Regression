#!/bin/sh

VERSION=$1
OLDDIR=`pwd`

for i in `ls | grep "^[0-9]*$"`
do
   cd $i
   if [ -f ./regr/testcase ];then	
   	./regr/testcase $VERSION
   fi
   cd $OLDDIR
done
