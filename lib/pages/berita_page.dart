// lib/pages/berita_page.dart
import 'package:flutter/material.dart';
// 1. Import model (untuk mengakses 'dummyNews')
import 'package:uts_pemmob/models/news_model.dart';
// 2. Import widget kartu kustom kita
import 'package:uts_pemmob/widgets/news_card.dart';

class BeritaPage extends StatelessWidget {
  const BeritaPage({super.key});

  @override
  Widget build(BuildContext context) {
    // --- DESAIN DIPERBARUI ---
    // Kita akan menggunakan CustomScrollView agar bisa memakai
    // SliverAppBar.large untuk efek judul besar yang modern.
    return Scaffold(
      // Kita tidak lagi menggunakan properti 'appBar' di sini.

      // 3. Gunakan CustomScrollView sebagai body
      body: CustomScrollView(
        slivers: [
          // 4. Ini adalah AppBar modern kita
          //    Judul akan besar saat di atas, dan mengecil saat di-scroll
          SliverAppBar.large(
            // Judul dari gambar PDF Anda [cite: 40]
            title: const Text("Favourites."),
          ),

          // 5. Ini adalah pengganti ListView.builder
          //    Logikanya 100% sama dengan kode Anda
          SliverList.builder(
            // Beri tahu ListView berapa banyak item yang harus dibuat
            itemCount: dummyNews.length,

            // Fungsi ini akan dipanggil untuk setiap item
            itemBuilder: (context, index) {
              // Ambil satu artikel berita dari daftar
              final article = dummyNews[index];

              // Kembalikan widget 'NewsCard' kustom kita
              // dengan data artikel tersebut
              return NewsCard(article: article);
            },
          ),
        ],
      ),
    );
  }
}
