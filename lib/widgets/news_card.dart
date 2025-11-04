// lib/widgets/news_card.dart
import 'package:flutter/material.dart';
import 'package:uts_pemmob/models/news_model.dart';

class NewsCard extends StatelessWidget {
  final NewsArticle article;

  const NewsCard({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      // Konsisten dengan Card.outlined yang minimalis
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 0,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: theme.colorScheme.outlineVariant),
      ),

      child: InkWell(
        onTap: () {
          // TODO: Tambahkan aksi saat berita di-klik
        },
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- 1. GAMBAR (UKURAN DIPERBAIKI) ---
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  article.imageUrl,
                  width: 90, // Dibuat sedikit lebih kecil
                  height: 90,
                  fit: BoxFit.cover,

                  // Perbaikan untuk Gambar Error/Placeholder
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 90, // Ukuran harus sama
                      height: 90,
                      color: theme.colorScheme.surfaceContainerHighest,
                      child: Center(
                        child: Icon(
                          Icons.image_not_supported_outlined,
                          // Ukuran ikon diperkecil agar tidak terlalu mendominasi
                          size: 32,
                          color: theme.colorScheme.onSurfaceVariant.withAlpha(
                            128,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(width: 12),

              // --- 2. TEKS (Whitespace & Tipografi Diperbaiki) ---
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // JUDUL UTAMA
                    Text(
                      article.title,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),

                    const SizedBox(height: 8), // Whitespace
                    // CUPLIKAN (SNIPPET)
                    Text(
                      article.snippet,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),

                    const SizedBox(
                      height: 12,
                    ), // Whitespace yang lebih besar sebelum footer
                    // SUMBER & TANGGAL (Footer)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // SUMBER
                        Text(
                          article.source,
                          style: theme.textTheme.labelMedium?.copyWith(
                            color: theme.colorScheme.primary, // Warna Aksen
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
