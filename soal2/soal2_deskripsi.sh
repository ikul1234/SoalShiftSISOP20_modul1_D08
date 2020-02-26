
#!/bin/bash

filename=$1
n_filename=$(echo $filename | cut -f 1 -d '.')
jam=$(stat -c %w $filename | date '+%H' -r $filename) 


while [ "$jam" -gt 0 ]
do 
	n_filename=$(echo $n_filename | tr '[b-za-aB-ZA-A]' '[a-zA-Z]')
	jam=$(($jam - 1))
done

mv "$filename" "$n_filename.txt"
