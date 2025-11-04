// lib/models/contact_model.dart

// 1. Ini adalah "Blueprint" atau Class Model untuk satu kontak
// Ini mendefinisikan data apa saja yang dimiliki oleh sebuah kontak.
class Contact {
  final String name;
  final String phone;
  final String imageUrl; // Path ke gambar di folder assets/images/

  // Ini adalah constructor-nya
  Contact({required this.name, required this.phone, required this.imageUrl});
}

// 2. Ini adalah "Data Statis dari Variabel" yang diminta oleh Poin (d)
// Kita buat sebuah List (daftar) berisi 15+ objek Contact.

// ! GANTI 'assets/images/profile_photo.jpg' dengan path foto Anda
// ! GANTI 'assets/images/avatar_placeholder.png' dengan path gambar placeholder
//   (yang akan kita tambahkan di Langkah 4.2)

final List<Contact> dummyContacts = [
  Contact(
    name: "Muhammad Lutfi Alamsyah", // Ganti dengan nama Anda
    phone: "+62 812 3456 7890",
    imageUrl: "assets/images/profile_photo.jpg", // Foto Anda dari Splash Screen
  ),
  Contact(
    name: "Dosen Galih Ashari R.", // Ganti sesuai data
    phone: "+62 811 2233 4455",
    imageUrl: "assets/images/avatar_placeholder.png",
  ),
  Contact(
    name: "Budi Santoso",
    phone: "+62 812 1111 2222",
    imageUrl: "assets/images/avatar_placeholder.png",
  ),
  Contact(
    name: "Citra Lestari",
    phone: "+62 813 2222 3333",
    imageUrl: "assets/images/avatar_placeholder.png",
  ),
  Contact(
    name: "Dewi Anggraini",
    phone: "+62 814 3333 4444",
    imageUrl: "assets/images/avatar_placeholder.png",
  ),
  // --- Tugas Anda: Salin (Copy) blok 'Contact' di atas ---
  // --- dan buat lagi 10 kontak di bawah ini agar totalnya 15 ---
  Contact(
    name: "Eko Prasetyo",
    phone: "+62 815 4444 5555",
    imageUrl: "assets/images/avatar_placeholder.png",
  ),
  Contact(
    name: "Fajar Nugroho",
    phone: "+62 816 5555 6666",
    imageUrl: "assets/images/avatar_placeholder.png",
  ),
  // (Lanjutkan...)
  // ...
  // ...
  // ...
  // ...
  // ...
  // ...
  // ...
  // ...
  Contact(
    name: "Kontak ke-15",
    phone: "+62 819 9999 0000",
    imageUrl: "assets/images/avatar_placeholder.png",
  ),
];
