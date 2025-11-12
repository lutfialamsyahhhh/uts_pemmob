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
    snippet:
        "OpenAI has announced a new platform for creating custom A.I tools...",
    source: "The Verge",
    date: "2025-11-08",
    imageUrl: "assets/images/chatgpt.jpg",
  ),
  NewsArticle(
    title: "The National Zoo's panda program is ending after more t...",
    snippet:
        "The three giant pandas humble around in their enclosure at the zoo...",
    source: "CNN",
    date: "2025-11-07",
    imageUrl: "assets/images/panda.jpg",
  ),
  NewsArticle(
    title: "Flutter 3.22 Dirilis dengan Peningkatan Performa Grafis",
    snippet:
        "Rilis terbaru ini berfokus pada Impeller dan optimasi rendering...",
    source: "Flutter Dev",
    date: "2025-11-06",
    imageUrl: "assets/images/flutter.jpg",
  ),
  NewsArticle(
    title: "Google Mengumumkan Gemini AI sebagai Pesaing GPT-4",
    snippet:
        "Model AI multimodal baru dari Google menjanjikan kemampuan yang lebih canggih dalam teks dan gambar.",
    source: "TechCrunch",
    date: "2025-11-04",
    imageUrl: "assets/images/gemini.jpg",
  ),
  NewsArticle(
    title: "Harga Kripto Melonjak Tinggi Menyambut Kebijakan Baru",
    snippet:
        "Pasar kripto menunjukkan pemulihan signifikan setelah pengumuman dari bank sentral Amerika.",
    source: "Bloomberg",
    date: "2025-11-03",
    imageUrl: "assets/images/kripto.jpg",
  ),
];
