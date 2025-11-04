// lib/pages/splash_screen.dart
import 'dart:async'; // Diperlukan untuk 'Timer'
import 'package:flutter/material.dart';
import 'package:uts_pemmob/pages/dashboard_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // --- Logika Timer Anda (Sudah Sempurna, Tidak Diubah) ---
  @override
  void initState() {
    super.initState();
    startSplashScreenTimer();
  }

  startSplashScreenTimer() {
    const duration = Duration(seconds: 5); // Sesuai Poin (a)
    return Timer(duration, () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const DashboardScreen()),
      );
    });
  }
  // --- Akhir Logika Timer ---

  @override
  Widget build(BuildContext context) {
    // Ambil tema untuk styling
    final theme = Theme.of(context);

    return Scaffold(
      // --- DESAIN DIPERBARUI ---
      // 1. Menggunakan scaffoldBackgroundColor (indigo[50] dari tema)
      //    agar transisi ke dashboard (yang warnanya sama) terlihat mulus.
      backgroundColor: theme.scaffoldBackgroundColor,

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // --- 1. FOTO ANDA ---
            CircleAvatar(
              radius: 80,
              // 2. Menambahkan warna latar (placeholder) dari tema
              backgroundColor: theme.colorScheme.surfaceContainerHighest,
              backgroundImage: const AssetImage(
                'assets/images/profile_photo.jpg',
              ),
            ),
            const SizedBox(height: 24),

            // --- 2. JUDUL APLIKASI ---
            Text(
              "Aplikasi UTS PemMob", // Ganti ini dengan judul Anda
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                // Memastikan warna teks utama
                color: theme.colorScheme.onSurface,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),

            // --- 3. NIM ANDA ---
            Text(
              "152023059", // Ganti dengan NIM Anda
              style: theme.textTheme.titleMedium?.copyWith(
                // 3. Memberi warna teks sekunder yang elegan
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),

            // --- 4. NAMA ANDA ---
            Text(
              "Muhammad Lutfi Alamsyah", // Ganti dengan Nama Anda
              style: theme.textTheme.titleMedium?.copyWith(
                // 4. Memberi warna teks sekunder yang elegan
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 48),

            // --- 5. INDIKATOR LOADING (DESAIN DIPERBARUI) ---
            CircularProgressIndicator(
              // 5. Memberi warna primary dari tema (indigo)
              color: theme.colorScheme.primary,
            ),
          ],
        ),
      ),
    );
  }
}
