#!/bin/bash

awk -F '	' '
FNR > 1 {a[$13] += $21} END {maxq=999999999; for (i in a) { if (a[i]< maxq) {maxq=a[i]; region=i}} print region}
' Sample-Superstore.tsv > test.txt
