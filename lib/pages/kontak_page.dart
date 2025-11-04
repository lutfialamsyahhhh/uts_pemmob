// lib/pages/kontak_page.dart
import 'package:flutter/material.dart';
// 1. Import model (untuk data dummy)
import 'package:uts_pemmob/models/contact_model.dart';
// 2. Import WIDGET KARTU kustom kita yang baru
import 'package:uts_pemmob/widgets/contact_list_tile.dart';

class KontakPage extends StatelessWidget {
  const KontakPage({super.key});

  @override
  Widget build(BuildContext context) {
    // --- DESAIN DIPERBARUI ---
    // Menggunakan CustomScrollView agar serasi dengan halaman Berita
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // 3. Menggunakan AppBar besar yang modern
          SliverAppBar.large(title: const Text("Daftar Kontak")),

          // 4. Menggunakan SliverList.builder (pengganti ListView.builder)
          SliverList.builder(
            // Ambil jumlah item dari list 'dummyContacts'
            itemCount: dummyContacts.length,

            // Fungsi yang membangun setiap item
            itemBuilder: (BuildContext context, int index) {
              // Ambil data kontak satu per satu
              final Contact contact = dummyContacts[index];

              // 5. Kembalikan WIDGET KUSTOM 'ContactListTile'
              //    Ini membuat kode Anda sangat bersih dan rapi
              return ContactListTile(contact: contact);
            },
          ),
        ],
      ),
    );
  }
}
