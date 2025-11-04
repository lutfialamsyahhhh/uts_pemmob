// lib/widgets/news_card.dart
import 'package:flutter/material.dart';
import 'package:uts_pemmob/models/news_model.dart'; // Import model Anda

// Ini adalah widget untuk SATU kartu berita
class NewsCard extends StatelessWidget {
  // Widget ini menerima satu artikel berita sebagai input
  final NewsArticle article;

  const NewsCard({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    // Card adalah widget Material 3 yang modern (elegan, minimalis)
    return Card(
      // Atur margin agar ada jarak antar kartu
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 2, // Bayangan tipis
      clipBehavior: Clip.antiAlias, // Memotong gambar di sudut kartu
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),

      // Aksi saat di-klik (saat ini kosong)
      child: InkWell(
        onTap: () {},
        // Layout utama: Gambar di kiri, Teks di kanan
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- 1. GAMBAR (KIRI) ---
            SizedBox(
              width: 120, // Lebar gambar
              height: 120, // Tinggi gambar (1:1)
              child: Image.asset(
                article.imageUrl,
                fit: BoxFit.cover, // Memastikan gambar memenuhi kotak
              ),
            ),

            // --- 2. TEKS (KANAN) ---
            // 'Expanded' adalah KUNCI agar teks mengisi
            // sisa ruang dan tidak 'overflow'
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                // Tumpuk teks secara vertikal
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // JUDUL
                    Text(
                      article.title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2, // Batasi 2 baris
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),

                    // CUPLIKAN (SNIPPET)
                    Text(
                      article.snippet,
                      style: Theme.of(context).textTheme.bodySmall,
                      maxLines: 2, // Batasi 2 baris
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),

                    // SUMBER & TANGGAL
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // SUMBER
                        Text(
                          article.source,
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        // TANGGAL
                        Text(
                          article.date,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
