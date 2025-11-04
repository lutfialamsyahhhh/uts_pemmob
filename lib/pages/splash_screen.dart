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
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // --- FOTO ANDA ---
            CircleAvatar(
              radius: 80,
              backgroundColor: theme.colorScheme.surfaceContainerHighest,
              backgroundImage: const AssetImage(
                'assets/images/profile_photo.jpg',
              ),
            ),

            // 1. Whitespace lebih besar antara Foto dan Teks
            const SizedBox(height: 32),

            // --- 2. JUDUL APLIKASI (Porta) ---
            Text(
              "Porta", // Judul Pilihan Anda
              // Menggunakan style yang lebih besar (misal: displaySmall)
              style: theme.textTheme.displaySmall?.copyWith(
                fontWeight: FontWeight.w600, // Sedikit lebih tebal
                color: theme.colorScheme.primary, // Memberi warna aksen tema
              ),
              textAlign: TextAlign.center,
            ),

            // 2. Whitespace kecil antara Judul dan NIM
            const SizedBox(height: 8),

            // --- 3. NIM ANDA ---
            Text(
              "152023059", // Ganti dengan NIM Anda
              // Menggunakan style yang lebih kecil
              style: theme.textTheme.titleMedium?.copyWith(
                color:
                    theme.colorScheme.onSurfaceVariant, // Warna abu-abu halus
                fontWeight: FontWeight.normal,
              ),
            ),

            // 3. Whitespace sangat kecil antara NIM dan Nama
            const SizedBox(height: 4),

            // --- 4. NAMA ANDA ---
            Text(
              "Muhammad Lutfi Alamsyah", // Ganti dengan Nama Anda
              // Menggunakan style yang sedikit lebih besar dan lebih tebal
              style: theme.textTheme.titleLarge?.copyWith(
                color: theme.colorScheme.onSurface,
                fontWeight: FontWeight.bold,
              ),
            ),

            // 4. Whitespace besar sebelum indikator loading
            const SizedBox(height: 64),

            // --- INDIKATOR LOADING ---
            CircularProgressIndicator(color: theme.colorScheme.primary),
          ],
        ),
      ),
    );
  }
}
