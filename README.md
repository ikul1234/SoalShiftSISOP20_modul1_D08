# SoalShiftSISOP20_modul1_D08
- [SoalShiftSISOP20_modul1_D08](#soalshiftsisop20modul1d08)
  - [Soal 1](#soal-1)
    - [1A](#1a)
    - [1B](#1b)
    - [1C](#1c)
  - [Soal 2](#soal-2)
    - [2A](#2a)
    - [2B](#2b)
    - [2C](#2c)
    - [2D](#2d)
  - [Soal 3](#soal-3)
    - [3A](#3a)
    - [3B](#3b)
    - [3C](#3c)
## Soal 1
### 1A
* Pertama saya buka filenya dulu dengan nano untuk mengetahui delimiter dan kolom berapa yang diperlukan
* Karena delimiter tab maka saya menggunakan awk dan -F '   ' untuk memisahkannya
* Karena tidak perlu menggunakan row paling atas maka saya menggunakan FNR > 1
* Lalu saya membuat array berdasarkan State dan menambahkan Profitnya pada {a[$13] += $21}
* Lalu saya menambahkan variable untuk dibandingkan pada maxq=999999999
* Setelah itu saya menggunakan perulangan yang membandingkan satu per satu lalu ambil yang paling kecil pada for (i in a) { if (a[i]< maxq) {maxq=a[i]; region=i
* Lalu diprint dan dikirim ke file test.txt agar dapat dilanjutkan ke soal selanjutnya
### 1B
* Pada 1B kita mengambil output dari soal 1A yaitu test.txt pada var=`cat test.txt`
* Karena tetap dipisahkan oleh tab maka saya gunakan awk -F '	'
* Untuk menambah variable ke awk saya gunakan -v pada -v region="$var"
* Karena row pertama tidak digunakan maka akan dibuang pada FNR > 1
* Karena ingin menggunakan region pada soal 1A maka gunakan logika if seperti if ($13==region)
* Karena ingin berdasarkan State maka saya gunakan array kolom 11 dan 21 untuk penjumlahan profitnya seperti {a[$11] += $21}
* Setelah itu diprint semua seperti {print a[i],i} dan panggil tabelnya
* Setelah itu saya sort secara general dengan cara  sort -g
* Lalu menggunakan ak lagi untuk mengambil 2 teratas dan print dipisah dengan spasi( ) lalu dikirim ke test2.txt agar dapat digunakan ke soal selanjutnya, seperti  awk 'NR <=2 {printf "%s ", $2}' > test2.txt
### 1C
* Pada soal 1C diperlukan output dari 1A dan 1B maka saya memanggil test.txt dan test2.txt seperti var=`cat test.txt`
var2=`cat test2.txt`
* Pada output soal 1B terdiri dari 2 state maka saya buat output tersebut menjadi array pada IFS=" " read -r -a array <<< "$var2"
* Lalu saya menggunakan awk yang dipisah dengan tab dan memasukan variable-variable yang diperlukan menggunakan -v, seperti awk -F '	' -v region="$var" -v state1="${array[0]}" -v state2="${array[1]}"
* Lalu buang row pertama dan menggunakan logika if untuk region dan state nya seperti {if ($13==region && ($11==state1 || $11==state2))
* Setelah itu buat array dari product name dan tambah setiap profitnya seperti {a[$17] += $21}
* Lalu print array tersebut dan table yang digunakan seperti {for (i in a) {print a[i],i}}' Sample-Superstore.tsv 
* Sortir secara general dan gunakan awk untuk ngeprint 10 teratas seperti sort -g | awk 'NR <=10  {print $0}'
## Soal 2
### 2A
* #!/bin/bash

head /dev/urandom | tr -dc A-Za-z0-9 | head -c 28 > "$1.txt"

* Hasil dari program diatas menghasilkan password acak denngan 28 karakter hanya berisi huruf dan angka.
* head/dev/urandom berfungsi untuk mnghasilkan password acak. 
* A-Za-z0-9 artinya huruf A,B,C,...Z , a,b,c,…,z , 0,1,2,3,..9
* Dari program yang dibuat Tr -dc berfungsi untuk membandingkan password random dan  akan menghapus selain dari A-Za-z0-9 sepanjang 28 karakter head -c 28 dan akan menyimpan datanya ke dalam $1.txt
### 2B
#!/bin/bash
filename=$(echo $1 | tr -dc A-Za-z)
head /dev/urandom | tr -dc A-Za-z0-9 | head -c 28 > $filename.txt

* Mengambil argumen dan mengubahnya ke dalam alphabet saja yang ditandai dengan (tr -dc A-Za-z) dan disimpan di dalam variabel filename
### 2C
* filename=$1 , mengambil argumen dan menyimpan di variabel filename
* n_filename=$(echo $filename | cut -f 1 -d '.') , mengambil isi dari var filename dan memotong isi filename sampai titik dan setelahnya kemudian disimpan di variable n_filename
* stat -c %w $filename artinya mengambil timestamp dari file yang telah dibuat , date '+%H' -r $filename artinya mengambil jamnya saja pada filename kemudian disimpan di variabel jam
* Akan melakukan looping saat kondisi memenuhi 'nilai jam lebih besar dari nol' dan akan menggeser hurufnya sesuai dengan jam pembuatan file 
*mv "$filename" "$n_filename.txt" artinya memindahkan isi dari filename ke n_filename


### 2D
* Pada proses deksripsi penjelasannya sama seperti proses enkripsi , perbedaannya hanya pada $(echo $n_filename | tr '[b-za-aB-ZA-A]' '[a-zA-Z]') yang artinya perubahan hurufnya diubah dari b menjadi a atau dari c diubah menjadi b.
## Soal 3
### 3A
* Pada Nomor 3A saya membuat variabel untuk nama file, nama direktori, hitungan download, dan nama file lanjutan seperti nama="pdkt_kusuma_"
dir="soal3/"
cnt=0
i=1
* Setelah itu gunakan logika while untuk mengulang download file sebanyak 28 kali seperti while [ $cnt -lt 28 ]
do
* Lalu gunakan logika if else untuk membuat file tetapi mengecek dulu apakah file tersebut ada. Jika ada maka variabel i bertambah, tp jika tidak ada maka download file dari "loremflickr.com/320/240/cat", mengganti namanya menjadi pdkt_kusuma_NO, tambah variabel cnt, dan membuat file lognya. Seperti if [ -f "$dir$nama$i" ]
	then
		(( i++ ))
	else
		wget -a $dir"wget.log" -O "$dir$nama$i" "loremflickr.com/320/240/cat"
		(( cnt++ ))
	fi
### 3B
* Awalnya saya menggunakan cron 5 6/8 * * 0-5 bash /home/ikul/Sisop/Praktikum1/soal3/soal3.sh tetapi crontab saya error
* Akhirnya saya menggunakan cron 5 6,14,22 * * 0-5 bash /home/ikul/Sisop/Praktikum1/soal3/soal3.sh
### 3C
* Pertama saya membuat variabel untuk nama file awal, nama file duplikat, nama file kenangan, direktori awal, direktori duplicate, direktori kenangan, format, hitungan ngirim, hitungan nama file lanjutan, hitungan duplikat, dan hitungan kenangan
* Lalu hapus file md5list karena akan dibuat nanti
* Lalu membuat logika for untuk mengecek pada tabel kenangan apakah ada yang duplikat dengan cara menyimpan md5 nya ke dalam txt untuk dibandingkan seperti for ff in "$dirk$namak"*;
do
	if [ -f "$ff$format" ]
	then
		echo $ff
		sum=$(md5sum -b $ff | awk '{print $1;}')
		echo $sum >> soal3/md5list.txt
	fi
done
* Lalu gunakan for lagi untuk mengecek semua foto yang bernama pdkt_kusuma_NO seperti for f in "$dir$nama"*;
do
* Lalu gunakan logika if untuk membandingkan satu-satu md5 nya dengan md5list.txt yang sudah dibuat
* Jika ada yang sama maka dipindahkan ke folder duplikat seperti if grep -Fxq "$sum" soal3/md5list.txt
		then
			while [ -f "$dird$namad$d" ] 
			do
				((d++))
			done
			mv $f $dird$namad$d
* Jika tidak ada yang sama maka dipindahkan ke folder kenangan seperti else
			echo $sum >> soal3/md5list.txt
			while [ -f "$dirk$namak$k" ] 
			do
				((k++))
			done
			mv $f $dirk$namak$k
* Lalu backup file wget.log menjadi wget.log.bak seperti mv soal3/wget.log soal3/wget.log.bak
