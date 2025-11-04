// lib/main.dart
import 'package:flutter/material.dart';
// 1. Kita akan segera membuat file 'splash_screen.dart' ini.
//    Garis merah di bawahnya normal untuk saat ini.
import 'pages/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Judul aplikasi Anda
      title: 'UTS Pemrograman Mobile',

      // Menghilangkan banner "DEBUG" yang mengganggu di pojok kanan atas
      debugShowCheckedModeBanner: false,

      // Ini adalah kunci untuk tampilan modern (elegan & minimalis)
      theme: ThemeData(
        // 2. Mengaktifkan Material 3 secara eksplisit
        useMaterial3: true,

        // 3. Tentukan palet warna utama Anda di sini.
        //    'seedColor' akan secara otomatis menghasilkan skema warna
        //    (terang & gelap) yang konsisten.
        colorScheme: ColorScheme.fromSeed(
          // Ganti 'Colors.blue' dengan warna dasar kampus Anda (Itenas)
          // atau warna minimalis favorit (misal: Colors.indigo)
          seedColor: Colors.blue,

          // Anda bisa paksa mode terang/gelap di sini jika mau
          // brightness: Brightness.light,
        ),
      ),

      // 4. Kita memberi tahu aplikasi bahwa halaman pertama (home)
      //    yang harus dibuka adalah SplashScreen
      home: const SplashScreen(),
    );
  }
}
