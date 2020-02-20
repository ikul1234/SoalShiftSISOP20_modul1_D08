nama="pdkt_kusuma_"
dir="soal3/"
cnt=0
i=1

while [ $cnt -lt 28 ]
do
	if [ -f "$dir$nama$i" ]
	then
		(( i++ ))
	else
		wget -a $dir"wget.log" -O "$dir$nama$i" "loremflickr.com/320/240/cat"
		(( cnt++ ))
	fi
done
