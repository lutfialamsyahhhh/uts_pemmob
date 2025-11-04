// lib/models/news_model.dart

// 1. Class Model (Blueprint)
// Ini mendefinisikan data apa saja yang akan dimiliki oleh satu artikel berita,
// berdasarkan gambar di PDF Anda.
class NewsArticle {
  final String title;
  final String snippet;
  final String source;
  final String date;
  final String imageUrl; // Path ke gambar di folder assets/images/

  NewsArticle({
    required this.title,
    required this.snippet,
    required this.source,
    required this.date,
    required this.imageUrl,
  });
}

final List<NewsArticle> dummyNews = [
  NewsArticle(
    title: "OpenAI announces platform for making custom ChatGPTs",
    snippet: "OpenAI has announced a new platform for creating custom A.I...",
    source: "The Verge",
    date: "2023-11-08", // (Saya ambil tanggal dari gambar)
    imageUrl:
        "assets/images/news_openai.png", // Akan kita tambahkan di Langkah 6.5
  ),
  NewsArticle(
    title: "The National Zoo's panda program is ending after more t...",
    snippet: "The three giant pandas humble around in their enclosure...",
    source: "CNN",
    date: "2023-11-07", // (Saya ambil tanggal dari gambar)
    imageUrl:
        "assets/images/news_panda.png", // Akan kita tambahkan di Langkah 6.5
  ),
  // Tambahkan beberapa berita lagi agar daftar terlihat penuh
  NewsArticle(
    title: "Flutter 3.xx Dirilis dengan Peningkatan Performa Grafis",
    snippet: "Rilis terbaru ini berfokus pada Impeller dan optimasi...",
    source: "Flutter Dev",
    date: "2023-11-06",
    imageUrl:
        "assets/images/news_flutter.png", // Akan kita tambahkan di Langkah 6.5
  ),
  NewsArticle(
    title: "Itenas Juara Lomba Jembatan Nasional 2023",
    snippet: "Tim dari Teknik Sipil Itenas berhasil meraih juara pertama...",
    source: "Itenas News",
    date: "2023-11-05",
    imageUrl: "assets/images/avatar_placeholder.png", // Bisa pakai placeholder
  ),
];
