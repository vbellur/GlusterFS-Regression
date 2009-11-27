#!/bin/bash

(for j in {1..10} ; do for i in {1..10} ; do touch file$i ; setfattr -n trusted.user -v 2  file$i ; rm file$i ; done ; done)& > /dev/null
PID1=$!

(for k in {1..1000} ; do getfattr -n trusted.user * ; done)

kill $PID1