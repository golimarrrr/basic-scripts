#!/bin/bash

if [ $# -eq 2 ]
then
        diff <(python2 /usr/bin/xlsx2csv --sheet=0 "$1") <(python2 /usr/bin/xlsx2csv --sheet=0 "$2")
else
        echo Usage: $0 file1.xlsx file2.xlsx
fi
