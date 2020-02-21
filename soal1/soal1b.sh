#!/bin/bash

var=`cat test.txt`

awk -F '	' -v region="$var" 'FNR > 1 {if ($13==region) {a[$11] += $21}} END {for (i in a) {print a[i],i}}' Sample-Superstore.tsv | sort -g | awk 'NR <=2 {printf "%s ", $2}' > test2.txt
