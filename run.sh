#!/bin/bash
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

_init ()
{
    [ $# -lt 1 ] && {
    	echo "#<Usage: $(basename $0) <complete_path_to_glusterd> [bug id]"
    	exit;
    }

    source ./init
    source ./regression_helpers
    export GLUSTERD=$1
    bug_id=;
    if [ $# -eq 2 ]; then
        bug_id=$2;
    fi
    export EXPORT_DIR="/regression/export";
}

main ()
{
    check_glusterd_running;
    if [ $? -ne 0 ]; then
        echo "glusterd is already running. Please stop and run the script";
        exit;
    fi

    start_glusterd $GLUSTERD;
    if [ $? -ne  0 ]; then
        return 2;
    fi

    create_directory $EXPORT_DIR;

    if [ ! $bug_id ]; then
	run_testcase;
    else
	run_testcase $bug_id;
    fi

    final_kill;

    final_cleanup;

    return 0;
}

_init "$@" && main "$@"
