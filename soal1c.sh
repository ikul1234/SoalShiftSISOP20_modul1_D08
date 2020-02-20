#!/bin/bash

var=`cat test.txt`
var2=`cat test2.txt`

IFS=" " read -r -a array <<< "$var2"

awk -F '	' -v region="$var" -v state1="${array[0]}" -v state2="${array[1]}" 'FNR > 1 {if ($13==region && ($11==state1 || $11==state2)) {a[$17] += $21}} END {for (i in a) {print a[i],i}}' Sample-Superstore.tsv | sort -g | awk 'NR <=10  {print $0}'
