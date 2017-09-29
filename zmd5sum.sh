#!/bin/bash
# returns md5sum of the uncompressed content of gzip files

set -o pipefail		# makes $? return nonzero if zcat fails

for a in $*
do
	md5=$(zcat $a | md5sum | cut -f1 -d\ )
	if [ "$?" == 0 ]
	then
		echo $md5 "" $a
	fi
done

