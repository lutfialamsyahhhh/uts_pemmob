// lib/pages/kontak_page.dart
import 'package:flutter/material.dart';
// 1. Import model dan data statis kita
import 'package:uts_pemmob/models/contact_model.dart';

class KontakPage extends StatelessWidget {
  const KontakPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 2. AppBar (Bar Judul)
      // Kita letakkan AppBar di sini agar setiap halaman punya judulnya sendiri
      appBar: AppBar(
        title: const Text("Daftar Kontak"),
        // Properti ini membuat AppBar terlihat modern
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 0,
      ),

      // 3. ListView.builder (Membuat Daftar)
      // Ini adalah cara paling efisien untuk membuat daftar panjang
      body: ListView.builder(
        // Beri tahu ListView berapa total item yang akan ditampilkan
        // Kita ambil dari panjang (length) list 'dummyContacts'
        itemCount: dummyContacts.length,

        // 'itemBuilder' adalah fungsi yang "membangun"
        // setiap item di dalam daftar
        itemBuilder: (BuildContext context, int index) {
          // Ambil data kontak satu per satu berdasarkan 'index'-nya
          final Contact contact = dummyContacts[index];

          // 4. ListTile (Layout "Circle Image & Teks")
          // Ini adalah widget Material 3 yang modern dan minimalis,
          // sempurna untuk Poin (d).
          return ListTile(
            // 'leading' adalah widget di sebelah kiri
            leading: CircleAvatar(
              //
              backgroundImage: AssetImage(contact.imageUrl),
              radius: 25, // Ukuran circle image
            ),

            // 'title' untuk teks utama (Nama)
            title: Text(
              contact.name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),

            // 'subtitle' untuk teks di bawah (Telepon)
            subtitle: Text(contact.phone),

            // 'trailing' adalah widget di sebelah kanan (opsional)
            trailing: const Icon(Icons.chevron_right),

            // Aksi saat item di-klik
            onTap: () {
              // Nanti Anda bisa tambahkan aksi, misal:
              // print("Menampilkan detail untuk ${contact.name}");
            },
          );
        },
      ),
    );
  }
}
