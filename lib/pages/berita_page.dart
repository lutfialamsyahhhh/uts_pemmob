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
    return Scaffold(
      // Pasang AppBar di sini agar judulnya spesifik
      appBar: AppBar(
        // Judul dari gambar PDF Anda [cite: 40]
        title: const Text("Favourites."),
      ),

      // 3. Gunakan ListView.builder untuk membuat daftar
      body: ListView.builder(
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
    );
  }
}
