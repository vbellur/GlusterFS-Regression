#!/bin/sh
#
#  Copyright (c) 2006-2009 Gluster, Inc. <http://www.gluster.com>
#  This file is part of GlusterFS.
#
#  GlusterFS is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published
#  by the Free Software Foundation; either version 3 of the License,
#  or (at your option) any later version.
#
#  GlusterFS is distributed in the hope that it will be useful, but
#  WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
#  General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program.  If not, see
#  <http://www.gnu.org/licenses/>.

GLUSTERFS=$1
OLDDIR=`pwd`

if [ 1 -ne $# ]
then
        echo "Usage: run.sh <path_to_glusterfs_binary>"
        return;
fi

for i in `ls | grep "^[0-9]*$"|sort -n`
do
   cd $i/regr
   if [ -f ./testcase ];then	
   	./testcase $GLUSTERFS
   fi
   cd $OLDDIR
done
