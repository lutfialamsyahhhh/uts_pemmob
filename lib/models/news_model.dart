// lib/models/news_model.dart

// Class Model (Blueprint)
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

// Data Statis yang Diperbarui (Total 10 Artikel)
final List<NewsArticle> dummyNews = [
  NewsArticle(
    title: "OpenAI announces platform for making custom ChatGPTs",
    snippet:
        "OpenAI has announced a new platform for creating custom A.I tools...",
    source: "The Verge",
    date: "2023-11-08",
    imageUrl:
        "assets/images/dummyNews.jpg", // Menggunakan gambar placeholder Anda
  ),
  NewsArticle(
    title: "The National Zoo's panda program is ending after more t...",
    snippet:
        "The three giant pandas humble around in their enclosure at the zoo...",
    source: "CNN",
    date: "2023-11-07",
    imageUrl: "assets/images/dummyNews.jpg",
  ),
  NewsArticle(
    title: "Flutter 3.xx Dirilis dengan Peningkatan Performa Grafis",
    snippet:
        "Rilis terbaru ini berfokus pada Impeller dan optimasi rendering...",
    source: "Flutter Dev",
    date: "2023-11-06",
    imageUrl: "assets/images/dummyNews.jpg",
  ),
  NewsArticle(
    title: "Itenas Juara Lomba Jembatan Nasional 2023",
    snippet:
        "Tim dari Teknik Sipil Itenas berhasil meraih juara pertama di kompetisi jembatan nasional...",
    source: "Itenas News",
    date: "2023-11-05",
    imageUrl: "assets/images/dummyNews.jpg",
  ),
  // --- Tambahan Artikel Agar Halaman Penuh ---
  NewsArticle(
    title: "Google Mengumumkan Gemini AI sebagai Pesaing GPT-4",
    snippet:
        "Model AI multimodal baru dari Google menjanjikan kemampuan yang lebih canggih dalam teks dan gambar.",
    source: "TechCrunch",
    date: "2023-11-04",
    imageUrl: "assets/images/dummyNews.jpg",
  ),
  NewsArticle(
    title: "Harga Kripto Melonjak Tinggi Menyambut Kebijakan Baru",
    snippet:
        "Pasar kripto menunjukkan pemulihan signifikan setelah pengumuman dari bank sentral Amerika.",
    source: "Bloomberg",
    date: "2023-11-03",
    imageUrl: "assets/images/dummyNews.jpg",
  ),
  NewsArticle(
    title: "Tren Aplikasi Mobile 2024: Fokus pada Kinerja dan AI",
    snippet:
        "Para pengembang diprediksi akan lebih memprioritaskan kinerja aplikasi daripada fitur baru di tahun mendatang.",
    source: "DevTrends",
    date: "2023-11-02",
    imageUrl: "assets/images/dummyNews.jpg",
  ),
  NewsArticle(
    title: "Penggunaan Material 3 Meningkat di Komunitas Flutter Global",
    snippet:
        "Adopsi Material 3 semakin meluas, didorong oleh fitur tema dinamis dan desain yang elegan.",
    source: "Dart News",
    date: "2023-11-01",
    imageUrl: "assets/images/dummyNews.jpg",
  ),
  NewsArticle(
    title: "Perkembangan Esports di Bandung: Liga Kampus Dimulai",
    snippet:
        "Kompetisi esports antar kampus di Bandung resmi dibuka, melibatkan lebih dari 20 perguruan tinggi.",
    source: "Bandung Info",
    date: "2023-10-31",
    imageUrl: "assets/images/dummyNews.jpg",
  ),
  NewsArticle(
    title: "Pemanasan Global: Suhu Rata-rata Mencapai Titik Tertinggi",
    snippet:
        "Data terbaru menunjukkan bahwa bulan lalu merupakan yang terpanas dalam catatan sejarah, memicu peringatan iklim.",
    source: "Nature World",
    date: "2023-10-30",
    imageUrl: "assets/images/dummyNews.jpg",
  ),
];
