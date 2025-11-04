// lib/pages/dashboard_screen.dart
import 'package:flutter/material.dart';

// 1. Import semua halaman "Fragment" Anda
import 'package:uts_pemmob/pages/biodata_page.dart';
import 'package:uts_pemmob/pages/kontak_page.dart';
import 'package:uts_pemmob/pages/kalkulator_page.dart';
import 'package:uts_pemmob/pages/cuaca_page.dart';
import 'package:uts_pemmob/pages/berita_page.dart';

// 2. Gunakan StatefulWidget karena kita perlu mengelola 'state'
//    atau 'indeks' dari tab yang sedang aktif.
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  // 3. Variabel untuk menyimpan indeks tab yang sedang dipilih
  int _currentIndex = 0; // 0 = Biodata, 1 = Kontak, dst.

  // 4. Daftar halaman (Fragment) yang akan ditampilkan
  //    Urutannya HARUS SAMA dengan urutan BottomNavigationBarItem
  final List<Widget> _pages = [
    const BiodataPage(),
    const KontakPage(),
    const KalkulatorPage(),
    const CuacaPage(),
    const BeritaPage(),
  ];

  // 5. Fungsi yang dipanggil saat tab di-klik
  void _onTabTapped(int index) {
    // 'setState' memberi tahu Flutter untuk membangun ulang (rebuild)
    // widget ini dengan nilai '_currentIndex' yang baru.
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // 6. Scaffold adalah kerangka utama
    return Scaffold(
      // 7. PRO-TIP: Kita TIDAK pasang AppBar di sini.
      //    Kita pasang AppBar di 'setiap' halaman (seperti di Langkah 3.1)
      //    agar judul dan aksinya bisa berbeda-beda. Ini lebih profesional.

      // 8. Body akan berganti-ganti sesuai dengan '_currentIndex'
      //    Ini adalah implementasi "Konsep Fragment" yang diminta soal.
      body: _pages[_currentIndex],

      // 9. Bottom Navigation Bar (Menu di Bawah)
      bottomNavigationBar: BottomNavigationBar(
        // Beri tahu widget ini tab mana yang sedang aktif
        currentIndex: _currentIndex,

        // Panggil fungsi _onTabTapped saat tab di-klik
        onTap: _onTabTapped,

        // --- STYLING MODERN & MINIMALIS ---

        // Ini WAJIB untuk 5 item agar semua label terlihat.
        // Jika tidak, item ke-4 dan ke-5 akan "menghilang".
        type: BottomNavigationBarType.fixed,

        // Gunakan warna primer dari Tema Material 3 Anda (di main.dart)
        selectedItemColor: Theme.of(context).colorScheme.primary,

        // Buat item yang tidak aktif menjadi abu-abu
        unselectedItemColor: Colors.grey[600],

        // Sedikit memperkecil font agar terlihat rapi
        selectedFontSize: 12.0,
        unselectedFontSize: 12.0,

        // ------------------------------------

        // 10. Daftar menu (harus 5, sesuai soal)
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person), // Ikon saat aktif
            label: 'Biodata',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contacts_outlined),
            activeIcon: Icon(Icons.contacts),
            label: 'Kontak',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate_outlined),
            activeIcon: Icon(Icons.calculate),
            label: 'Kalkulator',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wb_sunny_outlined),
            activeIcon: Icon(Icons.wb_sunny),
            label: 'Cuaca',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article_outlined),
            activeIcon: Icon(Icons.article),
            label: 'Berita',
          ),
        ],
      ),
    );
  }
}
