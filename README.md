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
Di command `grep` yang dipakai terdapat `-o`, command ini gunanya untuk memfilter kata yang mengandung string tersebut akan di grep
