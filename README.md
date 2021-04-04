# soal-shift-sisop-modul-1-D09-2021

# Soal 1
Pada soal nomor 1 ini, soal meminta untuk membantu Ryujin membuat laporan harian untuk aplikasi internal perusahaan, *ticky*.
Laporan yang harus dibuat ada 2 yaitu, laporan **daftar peringkat pesan error** terbanyak yang dibuat oleh *ticky*, dan 
laporan **penggunaan user** pada aplikasi *ticky*. Perlu diketahui bahwa pengerjaan ini tidak boleh menggunakan `AWK`.

# 1a
Ryujin diminta untuk mengumpulkan informasi dari log aplikasi yang terdapat pada file **syslog.log**. 
Informasi yang diperlukan antara lain: jenis log(ERROR/INFO), pesan log, dan username pada setiap baris lognya.
Untuk mempermudah pekerjaan tersebut, di soal ini disuruh untuk membantu membuat Regex yang dapat mengambil informasi tersebut.

```
grep -o "[I|E].*" syslog.log
```

Untuk mengambil informasi tersebut digunakanlah command `grep` agar dapat mengambil kalimat tersebut di setiap linenya. 
Di command `grep` yang dipakai terdapat `-o`, command ini gunanya untuk memfilter kata yang mengandung string tersebut akan di grep.
Untuk informasi yang di tampilkan adalah jenis log(ERROR/INFO) yang terdapat pada `system.log`, maka dari itu untuk mengambil
kalimat tersebut, diambil kalimat yang mengandung huruf kapital "I" atau "E" maka dari itu setiap grep yang akan dilakukan

# Soal 2
Soal ini meminta peserta untuk melkakukan pengolahan data terhadap file yang telah diberikan yakni *Laporan-TokoShiSop.tsv*. Di antara lain adalah mencari **profit percentage terbesar**, mencari **nama customer pada transaksi tahun 2017 di Albuquerque**, dan selainnya.

# 2a
Peserta diminta mencari **Row ID** dan ***profit percentage*terbesar**. Jika hasil *profit percentage* terbesar lebih dari satu maka dapatkan Row ID yang paling besar. 

Pertama dimulai dengan inisialisasi *file separate* dengan command ` awk -F "\t" ` sehingga dapat membaca kolom dari file yang menjadi input. Pada ` BEGIN ` *stage*, inisialisasi variabel ` biggestID = 0 ` dan ` maxprofit=0` yang nantinya akan digunakan sebagai perbandingan awal untuk mencari nilai terbesar. Pada `body` stage, pembacaan terhadap file mulai dilakukan. Deklarasi variabel `id=$1` untuk membaca kolom *RowID* dalam file, variabel `profit=$21` untuk membaca kolom profit, dan `sales=$18` untuk membaca kolom sales. Perintah selanjutnya yakni `NR>1` untuk membaca file dimulai dari baris kedua file(RowID=1). Setelah itu lakukan perhitungan `costprice` dan `percentage` sesuai instruksi soal. Kemudian perintah selanjutnya yakni pada `if(maxprofit < percentage){...}` digunakan untuk mencari nilai profit percentage terbesar. Instruksi selanjutnya `else if(maxprofit == percentage){...}` digunakan jika situasi profit percentage terbesar lebih dari satu, maka dapatkan *RowID* terbesar. Pada `END` *block* digunakan untuk menampilkan hasil RowID dan profit percentage terbesar. 

# 2b
Mencari daftar nama customer di Albuquerque pada tahun 2017.

Pertama dimulai dengan inisialisasi *file separate* dengan command ` awk -F "\t" ` sehingga dapat membaca kolom dari file yang menjadi input. `BEGIN` *stage* digunakan untuk menampilkan teks sekali saja. Kemudian pada `body` *block* definisikan variabel `year= substr($3,7,2)`. Perintah `substr($3,7,2)` digunakan untuk membaca kolom ke-3 yakni *Date Order*, `7` untuk mendapatkan string mulai dari substring/elemen ke-7, serta `2` untuk mendapatkan dua elemen dimulai dari substring ke-7 itu. Sehingga nanti input yang dibaca/diassign ke variabel `year` adalah yang tahunnya 2017 saja. Variabel `city=$10` untuk membaca kolom nama kota. Perintah selanjutnya `if(city == "Albuquerque" && year == 17)` untuk membaca inputan yang berasal dari kota **Albuquerque** dan tahun `year` 2017 saja. Jika memenuhi, maka buat array `namakota[$7]` dimana indeksnya adalah nama customer tersebut, direpresentasikan dengan kolom ketujuh `$7`. Pada `END1` *block*, cukup lakukan looping `for( nama in namakota )` untuk menampilkan `nama` customernya.

# 2c

Diawali dengan `body` *block* untuk membaca file khususnya pada kolom jenis *consumer* yang terdapat dalam kolom kedelapan `$8`. Periksa setiap baris tersebut untuk **Consumer**,**Corporate, dan **Home Office**, lakukan perhitungan terhadap masing-masing jenis *consumer*. Jika sudah,maka pada tahap `END` *block* lakukan perbandingan terhadap ketiganya, yang direpresentasikan dengan variabel `customer`,`corp`, dan `home`. Cari nilai yang paling kecil, apabila ketemu, maka assign ke `minTrac` untuk jumlah transaksi terkecil dan `minSeg` untuk jenis *consumer* yang relevan. Lalu tinggal tampilkan hasilnya, yakni segmen customer dengan transaksi paling sedikit. 

# 2d

Pada `BEGIN` *block* lakukan inisialisasi variabel yang akan digunakan nanti saat `body` *block*. Saat masuk pembacaan file, yakni `body` *block*, lakukan pembacaan terhadap kolom ke-13 `$13` untuk menentukan pada *record* yang sekarang, berada pada region mana. Jika ketemu salah satu region, maka lakukan perhitungan profit, dengan inisialisasi array `<region>[index]=$21` mengingat ko;lom profit berada di kolom ke-21. Perhitungan total pada region tersebut dilakukan dengan perintah `sum<Region>= sum<Region> + <region>[index]` kemudian setelah itu increment indexnya. Setelah pembacaan file selesai, pada `END` *block* lakukan seperti nomor 2c, yakni bandingkan semua region, mana region dengan profit terkecil. Jika ketemu, assign nama region ke `minReg` dan assign total profitnya ke variabel `profit`. Kemudian tampilkan hasilnya.
