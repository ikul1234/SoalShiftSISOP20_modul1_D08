# SoalShiftSISOP20_modul1_D08
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

### 2A
#!/bin/bash

head /dev/urandom | tr -dc A-Za-z0-9 | head -c 28 > "$1.txt"

Hasil dari program diatas menghasilkan password acak denngan 28 karakter hanya berisi huruf dan angka.
head/dev/urandom berfungsi untuk mnghasilkan password acak. 
A-Za-z0-9 artinya huruf A,B,C,...Z , a,b,c,…,z , 0,1,2,3,..9
Dari program yang dibuat Tr -dc berfungsi untuk membandingkan password random dan  akan menghapus selain dari A-Za-z0-9 sepanjang 28 karakter head -c 28 dan akan menyimpan datanya ke dalam $1.txt
