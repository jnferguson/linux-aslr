#!/bin/sh

./mmap &
echo "mmap:"
ps waux | cat /proc/`grep mmap | grep -v grep | awk '{print $2}'`/maps | grep -i 'libc-2' | grep 'r-xp' | awk '{print $1}' | perl -e 'my @y = <>; my @x = split /-/, $y[0]; print "libc: 0x$x[0]\n"'


kill -TERM `ps waux | grep mmap | grep -v grep | awk '{print $2}'`


