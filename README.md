                                          " SoalShift_modul1_A05 "

LAPORAN MODUL1 Kelompok A5
Nama : Chaniyah Zulfa M (05111740000115)
       Faqih Fathan I.  (05111740000175)
       
     LAPORAN 1 SISOP 2019
1.)) Anda diminta tolong oleh teman anda untuk mengembalikan filenya yang telah
dienkripsi oleh seseorang menggunakan bash script, file yang dimaksud adalah
nature.zip. Karena terlalu mudah kalian memberikan syarat akan membuka seluruh
file tersebut jika pukul 14:14 pada tanggal 14 Februari atau hari tersebut adalah hari
jumat pada bulan Februari.
Hint: Base64, Hexdump
Jawab =
```
       #!/bin/bash

       unzip /home/chaniyahzm/Downloads/nature.zip -d /home/chaniyahzm/Downloads
       mkdir /home/chaniyahzm/Downloads/hasil1

       a=0

       for file in /home/chaniyahzm/Downloads/nature/*.jpg
       do
               base64 -d $file | xxd -r > /home/chaniyahzm/Downloads/hasil1/$a.jpg
               a=$(($a + 1))
       Done
```

Pada crontab , buka crontab -e, ketikkan :
```
       14 14 14 2 * /bin/bash /home/chaniyahzm/Downloads/soal1.sh
       14 14 * 2 5 /bin/bash /home/chaniyahzm/Downloads/soal1.sh
```
 Penjelasan :Pertama, unzip nature.zip lalu buat folder hasil1 untuk menampung file2 didalam nature yang akan di decrypt. Lalu untuk mendecrypt suatu file, lakukan base64 untuk membuka enkripsi, karena hasil decrypt masih dalam bentuk heksa, lalu lakukan perintah ‘xxd -r’ untuk mereverse agar menjadi biner dan bisa terbaca oleh komputer. Setelah terbaca dikomputer, maka file2 didalam folder nature akan terdecrypt didalam folder hasil1.
 Lalu lakukan perintah ‘crontab -e’ untuk mengakses pada waktu tertentu seperti pada soal

2.)) Anda merupakan pegawai magang pada sebuah perusahaan retail, dan anda diminta
untuk memberikan laporan berdasarkan file WA_Sales_Products_2012-14.csv.
Laporan yang diminta berupa:
       a. Tentukan negara dengan penjualan(quantity) terbanyak pada tahun 2012.
```
    #a
       echo "---no 2a--"
       awk -F , '{if($7=='2012') i[$1]+=$10} END {for(jwb in i) {print jwb}}' /home/chaniyahzm/Downloads/WA_Sales_Products_2012-14.csv |     sort -nr | head -1
```
Penjelasan :
Ambil pada kolom ke 7 yaitu kolom tahun diambil tahun 2012, lalu setiap country akan dihitung quantity nya. Di sort berdasarkan quantitynya lalu fungsi ‘head-1’ adalah mengambil hasil/row teratas
       b. Tentukan tiga product line yang memberikan penjualan(quantity)terbanyak pada soal poin a.
 ```
    #b
       echo "--no2b--"
       awk -F , '{if($7=='2012' && $1=="United States") i[$4]+=$10} END {for(jwb in i) {print i[jwb], jwb}}' /home/chaniyahzm/Downloads/WA_Sales_Products_2012-14.csv | sort -nr | awk 'NR<=3 {print $2,$3}'
```
Penjelasan :
Sama seperti soal a, bedanya kita mengambil product line pada kolom ke4 dan fungsi ‘awk NR<=3’ adalah untuk mengambil 3 produk line teratas setelah di sorting dan row teratas adalah produk line yang memiliki quantity terbanyak. ‘{print $2,$3}’ adalah data pertama dan kedua yang dipisah spasi pada kolom ke4(kolom product line)
       c. Tentukan tiga product yang memberikan penjualan(quantity) terbanyak berdasarkan tiga product line yang didapatkan pada soal poin b.
```
           #c
       echo "--no2c--"
       echo "##Personal Accesories##"
       awk -F , '{if($7=='2012' && $1=="United States" && $4=="Personal Accessories") i[$6]+=$10} END {for(jwb in i) {print i[jwb], jwb}}' /home/chaniyahzm/Downloads/WA_Sales_Products_2012-14.csv | sort -nr | awk 'NR<=3 {print $2,$3,$4}'

       echo "##Camping Equipment##"
       awk -F , '{if($7=='2012' && $1=="United States" && $4=="Camping Equipment") i[$6]+=$10} END {for(jwb in i) {print i[jwb], jwb}}' 
       /home/chaniyahzm/Downloads/WA_Sales_Products_2012-14.csv | sort -nr | awk 'NR<=3 {print $2,$3,$4}'

       echo "##Outdoor Protection##"
       awk -F , '{if($7=='2012' && $1=="United States" && $4=="Outdoor Protection") i[$6]+=$10} END {for(jwb in i) {print i[jwb], jwb}}' /home/chaniyahzm/Downloads/WA_Sales_Products_2012-14.csv | sort -nr | awk 'NR<=3 {print $2,$3,$4}'
```
Penjelasan :
Pada soal poin b, didapat produk line Personal Accesories, Camping Equipment, dan Outdoor Protection. Jadi pada soal poin c diambillah untuk setiap prodak line. Lalu ditambahkan quantity nya dimana quantity berada pada kolom 10. Lalu di sort dan diambil tiga teratas untuk setiap produk line pada nomor 2. ’{print $2,$3,$4}’ adalah data pertama,kedua,dan ketiga pada kolom ke6(produk)

3.)) Buatlah sebuah script bash yang dapat menghasilkan password secara acak sebanyak 12 karakter yang terdapat huruf besar, huruf kecil, dan angka. Password acak tersebut disimpan pada file berekstensi .txt dengan ketentuan pemberian nama
sebagai berikut:
a. Jika tidak ditemukan file password1.txt maka password acak tersebut disimpan pada file bernama password1.txt
b. Jika file password1.txt sudah ada maka password acak baru akan disimpan pada file bernama password2.txt dan begitu seterusnya.
c. Urutan nama file tidak boleh ada yang terlewatkan meski filenya dihapus.
d. Password yang dihasilkan tidak boleh sama.
Jawab =
```
       #!/bin/bash

       for ((i=1;i<5000;i++))
       do
               if [ ! -f password$i.txt ]
               then
                       head /dev/urandom | tr -dc a-zA-Z0-9 | head -c12 > password$i.txt
                       break
               fi
       Done
```
Penjelasan :
Langkah pertama adalah dengan mengecek folder terlebih dahulu apakah ada atau tidak file yang dimaksud, jika tidak ada, script akan mencetak password acak sebanyak 12 karakter terdiri dari huruf kecil, kapital dan angka dengan penamaan “password1.txt”. Jika file password1.txt sudah ada, maka password acak baru akan disimpan pada file bernama password2.txt dan begitu seterusnya.Script akan mencetak password acak secara berbeda dengan password acak yang sudah ada sebelumnya setiap kali kita menjalankanya.

4.)) Lakukan backup file syslog setiap jam dengan format nama file “jam:menit tanggal-bulan-tahun”. Isi dari file backup terenkripsi dengan konversi huruf (string manipulation) yang disesuaikan dengan jam dilakukannya backup misalkan sebagai berikut:
a. Huruf b adalah alfabet kedua, sedangkan saat ini waktu menunjukkan
pukul 12, sehingga huruf b diganti dengan huruf alfabet yang memiliki
urutan ke 12+2 = 14.
b. Hasilnya huruf b menjadi huruf n karena huruf n adalah huruf ke
empat belas, dan seterusnya.
c. setelah huruf z akan kembali ke huruf a
d. Backup file syslog setiap jam.
e. dan buatkan juga bash script untuk dekripsinya.

 Jawab:
 
   a) Jawaban terenkripsi
```
     #!/bin/bash
hour=`date +"%H"`
name=`date +"%H:%M %d-%m-%y"`

kcl="abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz"
bsr="ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZ"

awk '{print}' /var/log/syslog | tr "${kcl:0:26}${bsr:0:26}" "${kcl:$hour:26}${bsr:$hour:26}" > "/home/chaniyahzm/hasil4_enk/$name"
```
   b) Jawaban terdecrypt
```
#!/bin/bash
echo "Input nama file yang ingin di decrypt = "
read inputtime
hour=${inputtime:0:2}

kcl="abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz"
bsr="ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZ"

awk '{print}' "/home/chaniyahzm/hasil4_enk/$inputtime" | tr "${kcl:$hour:26}${bsr:$hour:26}" "${kcl:0:26}${bsr:0:26}" | awk '{print}'
```
Pada crontab , buka crontab -e, ketikkan :
```
       0 * * * * /bin/bash /home/chaniyahzm/soal4_enk.sh
```
Penjelasan:
1)) simpan variabel alfabet kecil dan besar untuk menghindari case sensitive, dan diketik sebanyak 2 kali alfabet untuk menghindari worse case jika z ditambah jam 23,   lalu variable hour untuk jam yang di ambil bagiannya dari date pada linux, variabel name adalah tanggal,bulan,tahun yang diambil pada date. Lalu gunakan awk dan print isi dari syslog, lalu posisi awal adalah  "${kcl:0:26}${bsr:0:26}" untuk mengambil alfabet dari a-z/A-Z, lalu digeser sesuai hournya dan ditaruh hasilnya pada folder hasil4_enk, lalu jalankan crotab setiap jam dengan mengetikkan pada crontab -e seperti diatas

2)) pertama inputkan nama file yang telah diketahui saat menjalankan no 4 jawaban terenkripsi. Variabel hour untuk mengambil inputan 2 dari depan, yaitu jamnya. simpan variabel alfabet kecil dan besar untuk menghindari case sensitive, dan diketik sebanyak 2 kali alfabet untuk menghindari worse case jika z ditambah jam 23. Lalu pada awk, hasil enkripsi dari no4 tadi  yang telah digeser dikembalikan lagi pada asalnya, lalu di print.

5.)) Buatlah sebuah script bash untuk menyimpan record dalam syslog yang memenuhi
kriteria berikut:

a. Tidak mengandung string “sudo”, tetapi mengandung string “cron”,
serta buatlah pencarian stringnya tidak bersifat case sensitive,
sehingga huruf kapital atau tidak, tidak menjadi masalah.
b. Jumlah field (number of field) pada baris tersebut berjumlah kurang
dari 13.
c. Masukkan record tadi ke dalam file logs yang berada pada direktori
/home/[user]/modul1.

d. Jalankan script tadi setiap 6 menit dari menit ke 2 hingga 30, contoh
13:02, 13:08, 13:14, dst.
Jawab=
```
    #!/bin/bash

awk '/cron/ || /CRON/,!/sudo/' /var/log/syslog |awk 'NF < 13' > /home/faqih/modul1/syslog.log

Pada crontab , buka crontab -e, ketikkan :
2-30/6 * * * * bash /home/faqih/sisop/nomor5/script5.sh
```
Penjelasan :
Pada /var/log/syslog , menghilangkan sudo dan menghasilkan cron saja dengan perintah “awk '/cron/ || /CRON/,!/sudo/' /var/log/syslog” lalu “NF<13” untuk membuat kolom pada /var/log/syslog tersebut maksimal berjumlah 12. Lalu, semua hasil tersebut diletakkan pada folder modul1. Untuk menjalankan script setiap 6 menit dari menit ke 2 hingga 30 di handle dengan memasukkan perintah pada crontab -e
     
