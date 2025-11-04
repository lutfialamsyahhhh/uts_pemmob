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
    // Ambil tema saat ini
    final theme = Theme.of(context);

    // --- DESAIN DIPERBARUI: MENGGUNAKAN OUTLINED CARD (MINIMALIS) ---
    return Card(
      // Atur margin agar ada jarak antar kartu
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),

      elevation: 0,
      clipBehavior: Clip.antiAlias, // Memotong sudut
      // 2. Menggunakan 'shape' dengan 'side' (garis tepi)
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          // --- INI PERBAIKANNYA ---
          // Kita hapus .withOpacity(0.5) karena 'outlineVariant'
          // sudah merupakan warna yang tepat dan halus.
          color: theme.colorScheme.outlineVariant,
          // ------------------------
        ),
      ),

      // Aksi saat di-klik
      child: InkWell(
        onTap: () {
          // TODO: Tambahkan aksi saat berita di-klik (Komentar ini aman)
        },
        child: Padding(
          // 3. Padding dipindahkan ke sini (di luar Row)
          padding: const EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- 1. GAMBAR (KIRI) ---
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  article.imageUrl,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,

                  // 5. Menambahkan errorBuilder untuk UI yang robust
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 100,
                      height: 100,
                      color: theme.colorScheme.surfaceContainerHighest,
                      child: Icon(
                        Icons.image_not_supported_outlined,
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    );
                  },
                ),
              ),

              // Jarak antara gambar dan teks
              const SizedBox(width: 12),

              // --- 2. TEKS (KANAN) ---
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // JUDUL
                    Text(
                      article.title,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),

                    // CUPLIKAN (SNIPPET)
                    Text(
                      article.snippet,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                      maxLines: 2,
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
                          style: theme.textTheme.labelMedium?.copyWith(
                            color: theme.colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // TANGGAL
                        Text(
                          article.date,
                          style: theme.textTheme.labelMedium?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
