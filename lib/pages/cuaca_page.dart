// lib/pages/cuaca_page.dart
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CuacaPage extends StatelessWidget {
  const CuacaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Prakiraan Cuaca")),
      // Gunakan SingleChildScrollView jika kontennya panjang
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // --- KARTU CUACA UTAMA (Sesuai Gambar [cite: 34-37]) ---
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              // 'clipBehavior' agar gradien tidak "bocor"
              clipBehavior: Clip.antiAlias,
              child: Container(
                // Hiasan Gradien Modern
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.blue.shade400, Colors.blue.shade700],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    const Text(
                      "Bandung, ID", // Data Statis
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 16),
                    // --- GAMBAR CUACA [Poin f] ---
                    // ! GANTI dengan path gambar cuaca Anda
                    Lottie.asset(
                      'assets/animations/animasi_petir.json', // <-- GANTI NAMA FILE
                      width: 150,
                      height: 150,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "19°", // Data Statis Suhu
                      style: const TextStyle(
                        fontSize: 64,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      "Hujan Petir", // Data Statis
                      style: TextStyle(fontSize: 20, color: Colors.white70),
                    ),
                    const SizedBox(height: 24),

                    // --- INFO TAMBAHAN (Suhu, Kelembapan, dll) [Poin f] ---
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InfoCuacaColumn(
                          icon: Icons.air,
                          label: "Angin",
                          value: "12 km/j",
                        ),
                        InfoCuacaColumn(
                          icon: Icons.water_drop,
                          label: "Kelembapan",
                          value: "80%",
                        ),
                        InfoCuacaColumn(
                          icon: Icons.compress,
                          label: "Tekanan",
                          value: "1012 hPa",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // --- PERKIRAAN HARIAN (Contoh Layout Tambahan) ---
            const Text(
              "Perkiraan Hari Ini",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            // 'SizedBox' untuk 'ListView' horizontal
            SizedBox(
              height: 140,
              child: ListView(
                scrollDirection: Axis.horizontal, // Scroll ke samping
                children: const [
                  PerkiraanJamCard(
                    jam: "13.00",
                    suhu: "23°",
                    icon: Icons.wb_sunny,
                  ),
                  PerkiraanJamCard(
                    jam: "14.00",
                    suhu: "24°",
                    icon: Icons.wb_cloudy,
                  ),
                  PerkiraanJamCard(
                    jam: "15.00",
                    suhu: "23°",
                    icon: Icons.wb_cloudy,
                  ),
                  PerkiraanJamCard(
                    jam: "16.00",
                    suhu: "22°",
                    icon: Icons.grain,
                  ), // 'grain' untuk hujan
                  PerkiraanJamCard(
                    jam: "17.00",
                    suhu: "21°",
                    icon: Icons.wb_cloudy,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// --- WIDGET HELPER ---
// Ini adalah praktik 'Pro' untuk memecah UI yang berulang

class InfoCuacaColumn extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  const InfoCuacaColumn({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.white, size: 32),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(color: Colors.white70)),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class PerkiraanJamCard extends StatelessWidget {
  final String jam;
  final String suhu;
  final IconData icon;
  const PerkiraanJamCard({
    super.key,
    required this.jam,
    required this.suhu,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(right: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        width: 100, // Lebar kartu
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(jam, style: const TextStyle(fontWeight: FontWeight.bold)),
            Icon(icon, color: Colors.blue.shade600, size: 36),
            Text(suhu, style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
