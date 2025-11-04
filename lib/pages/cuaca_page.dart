// lib/pages/cuaca_page.dart
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CuacaPage extends StatelessWidget {
  const CuacaPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Ambil tema saat ini
    final theme = Theme.of(context);

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(
          top: 16.0,
          bottom: 16.0,
        ), // Padding vertikal
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // --- 1. JUDUL DAN LOKASI (Menggantikan AppBar) ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 32),
                  Text(
                    "Bandung, ID",
                    style: theme.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Hari ini, 4 Nov 2025",
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // --- 2. KARTU CUACA UTAMA (DESAIN DIPERBAIKI) ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Card(
                elevation: 0,
                // Mengganti warna primary (ungu pekat) dengan warna kontainer yang lebih lembut
                color: theme.colorScheme.surfaceContainerHighest,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24), // Sudut lebih besar
                ),
                clipBehavior: Clip.antiAlias,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 24.0,
                    bottom: 24.0,
                  ), // Padding vertikal lebih besar
                  child: Column(
                    children: [
                      // Lottie Animation
                      Lottie.asset(
                        'assets/animations/animasi_petir.json',
                        width: 180, // Sedikit lebih besar
                        height: 180,
                      ),

                      // Suhu Utama
                      Text(
                        "19°",
                        style: theme.textTheme.displayLarge?.copyWith(
                          fontSize: 88, // Suhu dibuat sangat besar
                          fontWeight: FontWeight.w300,
                          color: theme
                              .colorScheme
                              .primary, // Warna utama untuk suhu
                        ),
                      ),
                      Text("Hujan Petir", style: theme.textTheme.titleLarge),

                      const SizedBox(height: 32), // Jarak pemisah lebih besar
                      // --- INFO TAMBAHAN ---
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
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
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 32), // Jarak antar section
            // --- 3. PERKIRAAN HARIAN HORIZONTAL ---
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                "Perkiraan Jam",
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),

            SizedBox(
              height: 140,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
                  ),
                  PerkiraanJamCard(
                    jam: "17.00",
                    suhu: "21°",
                    icon: Icons.wb_cloudy,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32), // Jarak antar section
            // --- 4. INFORMASI TAMBAHAN: PERKIRAAN 7 HARI (Untuk mengisi 1 halaman) ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Perkiraan 7 Hari",
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 12),

            // Contoh daftar statis perkiraan 7 hari
            const PerkiraanHarianRow(
              day: "Rabu",
              icon: Icons.cloudy_snowing,
              tempMin: "18°",
              tempMax: "25°",
            ),
            const PerkiraanHarianRow(
              day: "Kamis",
              icon: Icons.thunderstorm_outlined,
              tempMin: "17°",
              tempMax: "22°",
            ),
            const PerkiraanHarianRow(
              day: "Jumat",
              icon: Icons.wb_sunny,
              tempMin: "20°",
              tempMax: "27°",
            ),
            const PerkiraanHarianRow(
              day: "Sabtu",
              icon: Icons.cloud_outlined,
              tempMin: "19°",
              tempMax: "24°",
            ),
            const PerkiraanHarianRow(
              day: "Minggu",
              icon: Icons.wb_sunny,
              tempMin: "21°",
              tempMax: "28°",
            ),
          ],
        ),
      ),
    );
  }
}

// --- WIDGET HELPER 1 (DATA INFO BAWAH KARTU) ---
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
    final theme = Theme.of(context);
    return Column(
      children: [
        Icon(
          icon,
          color: theme.colorScheme.onSurface,
          size: 28,
        ), // Warna disesuaikan
        const SizedBox(height: 8),
        Text(label, style: theme.textTheme.labelMedium),
        const SizedBox(height: 4),
        Text(
          value,
          style: theme.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

// --- WIDGET HELPER 2 (KARTU JAM HORIZONTAL) ---
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
    final theme = Theme.of(context);

    return Card(
      elevation: 0,
      color: theme.colorScheme.surfaceContainer, // Warna lebih gelap dari latar
      margin: const EdgeInsets.only(right: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        width: 80, // Sedikit lebih ramping
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              jam,
              style: theme.textTheme.labelLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Icon(icon, color: theme.colorScheme.primary, size: 32),
            Text(
              suhu,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// --- WIDGET HELPER BARU (PERKIRAAN HARIAN) ---
class PerkiraanHarianRow extends StatelessWidget {
  final String day;
  final IconData icon;
  final String tempMin;
  final String tempMax;

  const PerkiraanHarianRow({
    super.key,
    required this.day,
    required this.icon,
    required this.tempMin,
    required this.tempMax,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Gunakan ListTile di dalam Card.outlined agar bersih dan minimalis
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: theme.colorScheme.outlineVariant),
      ),
      child: ListTile(
        leading: Text(day, style: theme.textTheme.titleMedium),
        title: Center(
          child: Icon(icon, color: theme.colorScheme.primary, size: 24),
        ),
        trailing: SizedBox(
          width: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                tempMin,
                style: theme.textTheme.titleMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                tempMax,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
