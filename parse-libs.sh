#!/bin/sh

egrep -h '(libc-2|ld-2)' ./raw/vsftpd-*.txt | grep 'r-xp' > libc-to-ld.txt
egrep -h '(libattr|libc-2)' ./raw/vsftpd-*.txt | grep 'r-xp' > libattr-to-libc.txt
egrep -h '(libattr|libcap)' ./raw/vsftpd-*.txt | grep 'r-xp' > libattr-to--libcap.txt
egrep -h '(libutil|libresolv)' ./raw/vsftpd-*.txt | grep 'r-xp' > libutil-to-libresolv.txt

rm -f diffs.txt
for i in `ls *.txt`;
do
echo "Differences between library load location for $i ..." >> diffs.txt
./file.pl $i >> diffs.txt;
done
