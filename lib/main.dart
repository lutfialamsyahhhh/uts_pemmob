import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // 1. Import Google Fonts
import 'pages/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Porta',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,

        // 2. Menggunakan seedColor yang lebih elegan, misal: Indigo
        // Ini akan secara otomatis menghasilkan skema warna yang konsisten
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
          brightness: Brightness.light, // Anda bisa paksa mode terang
        ),

        // 3. Mengatur font default untuk seluruh aplikasi
        // Ini adalah kunci tampilan modern
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),

        // 4. Memberi sedikit warna pada latar belakang utama
        // agar Card/Widget terlihat "mengambang"
        scaffoldBackgroundColor: Colors.indigo[50], // Warna netral
      ),

      // Jika Anda ingin tema gelap otomatis yang elegan:
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo, // Gunakan seed yang sama
          brightness: Brightness.dark, // Paksa mode gelap
        ),
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme.apply(
            bodyColor: Colors.white,
            displayColor: Colors.white,
          ),
        ),
      ),
      themeMode: ThemeMode.system, // Otomatis sesuai pengaturan HP

      home: const SplashScreen(),
    );
  }
}
