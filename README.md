# Proyek UTS Pemrograman Mobile
[cite_start]**Institut Teknologi Nasional (Itenas) Bandung** [cite: 2]  
[cite_start]**Mata Kuliah:** Pemrograman Mobile (IF) [cite: 9, 10]  
[cite_start]**Dosen:** Galih Ashari R., S.Si., MT [cite: 11]

---

### 👨‍🎓 Identitas Mahasiswa
* **Nama:** Muhammad Lutfi Alamsyah
* **NIM:** 152023059
* [cite_start]**Kelas:** [Isi Kelas Anda, misal: AA/BB] [cite: 11]

### 📝 Deskripsi Proyek
[cite_start]Ini adalah proyek aplikasi mobile yang dikembangkan untuk memenuhi Ujian Tengah Semester (UTS) Ganjil 2024/2025[cite: 8]. Aplikasi ini dibangun menggunakan Flutter dengan desain Material 3 yang modern, elegan, dan minimalis.

Aplikasi ini mencakup fungsionalitas dasar yang diwajibkan oleh soal, seperti *splash screen*, navigasi, dan beberapa halaman fitur statis.

### ✨ Fitur Aplikasi
Aplikasi ini terdiri dari beberapa halaman utama:

1.  [cite_start]**Splash Screen:** Halaman pembuka yang tampil selama 5 detik, menampilkan foto, nama, dan NIM[cite: 14].
2.  [cite_start]**Dashboard:** Halaman utama dengan 5 menu yang diakses melalui **Bottom Navigation Bar**[cite: 15]. [cite_start]Semua halaman menu diimplementasikan sebagai *Fragment* (Widgets)[cite: 16].
3.  [cite_start]**Halaman Biodata:** Menampilkan profil statis beserta *form* input yang fungsional, mencakup `TextFormField`, `RadioListTile`, `DropdownButtonFormField`, dan `DatePicker` (Kalender)[cite: 18].
4.  [cite_start]**Halaman Kontak:** Menampilkan daftar 15+ kontak statis menggunakan pola berulang (`SliverList.builder` dan `ContactListTile`)[cite: 20, 21].
5.  [cite_start]**Halaman Kalkulator:** Kalkulator sederhana yang fungsional untuk operasi tambah, kurang, kali, bagi, kuadrat, dan akar kuadrat[cite: 32].
6.  [cite_start]**Halaman Cuaca:** Halaman UI statis yang menampilkan kondisi cuaca dengan desain modern dan animasi Lottie (`animasi_petir.json`)[cite: 33].
7.  [cite_start]**Halaman Berita:** Menampilkan daftar berita statis menggunakan pola berulang (`SliverList.builder` dan `NewsCard`), konsisten dengan Halaman Kontak[cite: 38].

---

## 📸 Tangkapan Layar Aplikasi
[cite_start]Berikut adalah tangkapan layar (screenshot) dari semua halaman yang telah dikembangkan, sesuai dengan petunjuk pengerjaan.

### 1. Splash Screen & Navigasi Dashboard
[Sisipkan Screenshot Splash Screen di sini]
<br>
[Sisipkan Screenshot Halaman Dashboard (salah satu menu aktif) di sini]
*(Deskripsi: Splash screen 5 detik dan halaman utama dengan Bottom Navigation Bar.)*

### 2. Halaman Biodata
[Sisipkan Screenshot Halaman Biodata (scroll ke atas) di sini]
<br>
[Sisipkan Screenshot Halaman Biodata (scroll ke bawah, tampilkan form) di sini]
[cite_start]*(Deskripsi: Halaman profil dan form input untuk alamat, jenis kelamin, prodi, dan tanggal lahir.)* [cite: 18]

### 3. Halaman Kontak
[Sisipkan Screenshot Halaman Kontak (tampilkan daftar) di sini]
[cite_start]*(Deskripsi: Halaman daftar kontak dengan judul besar (SliverAppBar) dan layout Circle Image + Teks.)* [cite: 20]

### 4. Halaman Berita
[Sisipkan Screenshot Halaman Berita (tampilkan daftar) di sini]
[cite_start]*(Deskripsi: Halaman daftar berita dengan layout Card (Outlined) yang konsisten.)* [cite: 38]

### 5. Halaman Kalkulator
[Sisipkan Screenshot Halaman Kalkulator di sini]
[cite_start]*(Deskripsi: Halaman kalkulator sederhana dengan desain tombol yang konsisten dengan tema.)* [cite: 32]

### 6. Halaman Cuaca
[Sisipkan Screenshot Halaman Cuaca (tampilkan kartu utama dan perkiraan) di sini]
[cite_start]*(Deskripsi: Halaman UI cuaca statis yang menampilkan kartu utama dan daftar perkiraan per jam.)* [cite: 33]

---

### 🛠️ Teknologi yang Digunakan
* **Framework:** Flutter
* **Bahasa:** Dart
* **Desain:** Material 3 (dengan tema global `ColorScheme.fromSeed`)
* **Animasi:** `lottie` (untuk animasi cuaca)
* **Font:** `google_fonts` (Poppins)
