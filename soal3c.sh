nama="pdkt_kusuma_"
namad="duplicate_"
namak="kenangan_"
dir="soal3/"
dird="soal3/duplicate/"
dirk="soal3/kenangan/"
format=""
cnt=0
i=1
d=1
k=1
sum=""

rm soal3/md5list.txt

for ff in "$dirk$namak"*;
do
	if [ -f "$ff$format" ]
	then
		echo $ff
		sum=$(md5sum -b $ff | awk '{print $1;}')
		echo $sum >> soal3/md5list.txt
	fi
done

for f in "$dir$nama"*;
do
	if [ -f "$f$format" ] 
	then
		echo $f
		sum=$(md5sum -b $f | awk '{print $1;}')
		if grep -Fxq "$sum" soal3/md5list.txt
		then
			while [ -f "$dird$namad$d" ] 
			do
				((d++))
			done
			mv $f $dird$namad$d
		else
			echo $sum >> soal3/md5list.txt
			while [ -f "$dirk$namak$k" ] 
			do
				((k++))
			done
			mv $f $dirk$namak$k
		fi	
	fi
	((i++))
done

mv soal3/wget.log soal3/wget.log.bak
