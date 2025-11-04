// lib/pages/splash_screen.dart

// 1. Import paket-paket yang diperlukan
import 'dart:async'; // Diperlukan untuk 'Timer'

import 'package:flutter/material.dart';
// Impor file dashboard (ini akan error untuk sementara, kita akan perbaiki di 2.4)
import 'package:uts_pemmob/pages/dashboard_screen.dart';

// 2. Buat StatefulWidget
// Kita butuh 'StatefulWidget' karena kita akan melakukan aksi (Timer)
// saat halaman dimuat (menggunakan initState).
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // 3. Logika Timer
  @override
  void initState() {
    super.initState();
    // Panggil fungsi timer saat widget ini pertama kali dibuat
    startSplashScreenTimer();
  }

  startSplashScreenTimer() {
    // Tentukan durasi 5 detik sesuai Poin (a)
    const duration = Duration(seconds: 5);

    // 'Timer' akan menjalankan fungsi 'callback' setelah durasi tercapai
    return Timer(duration, () {
      // Pindahkan pengguna ke Halaman Dashboard
      // Kita gunakan 'pushReplacement' agar pengguna tidak bisa menekan
      // tombol 'kembali' dan kembali ke Splash Screen.
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const DashboardScreen()),
      );
    });
  }

  // 4. Desain Tampilan (UI)
  @override
  Widget build(BuildContext context) {
    // 'Scaffold' adalah dasar untuk setiap halaman
    return Scaffold(
      // Kita gunakan warna latar belakang dari tema Material 3
      backgroundColor: Theme.of(context).colorScheme.surface,
      // 'Center' untuk menempatkan semua konten di tengah layar
      body: Center(
        // 'Column' untuk menyusun widget secara vertikal (atas ke bawah)
        child: Column(
          // Posisikan konten di tengah secara vertikal
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // --- KONTEN DIMINTA OLEH SOAL (Poin a)  ---

            // 1. FOTO ANDA
            CircleAvatar(
              // Atur ukuran 'wajah' foto
              radius: 80,
              // Ambil gambar dari folder 'assets/images'
              // ! PENTING: Ganti 'profile_photo.jpg' dengan nama file foto Anda!
              backgroundImage: const AssetImage(
                'assets/images/profile_photo.jpg',
              ),
            ),

            // Beri jarak vertikal
            const SizedBox(height: 24),

            // 2. JUDUL APLIKASI
            Text(
              "Aplikasi UTS PemMob", // Ganti ini dengan judul Anda
              // Gunakan styling modern dari tema Material 3
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 16),

            // 3. NIM ANDA
            Text(
              "152023059", // Ganti dengan NIM Anda
              style: Theme.of(context).textTheme.titleMedium,
            ),

            // 4. NAMA ANDA
            Text(
              "Muhammad Lutfi Alamsyah", // Ganti dengan Nama Anda
              style: Theme.of(context).textTheme.titleMedium,
            ),

            // --- Widget Tambahan (Bonus) ---
            const SizedBox(height: 48),

            // Tambahkan indikator loading agar pengguna tahu
            // sesuatu sedang terjadi selama 5 detik. Ini adalah UX yang baik.
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
