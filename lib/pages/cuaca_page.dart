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
      // AppBar DIHAPUS untuk tampilan yang lebih imersif
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Beri 'padding' atas secara manual karena tidak ada AppBar
            const SizedBox(height: 48),

            // --- KARTU CUACA UTAMA ---
            Card(
              elevation: 0,
              color: theme.colorScheme.primary, // Warna utama dari tema
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              clipBehavior: Clip.antiAlias,
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    Text(
                      "Bandung, ID", // Data Statis
                      style: theme.textTheme.headlineSmall?.copyWith(
                        color: theme.colorScheme.onPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Animasi Lottie Anda
                    Lottie.asset(
                      'assets/animations/animasi_petir.json',
                      width: 150,
                      height: 150,
                    ),
                    const SizedBox(height: 16),

                    Text(
                      "19°", // Data Statis Suhu
                      style: theme.textTheme.displayLarge?.copyWith(
                        color: theme.colorScheme.onPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Hujan Petir", // Data Statis
                      style: theme.textTheme.titleLarge?.copyWith(
                        // --- INI PERBAIKAN PERTAMA ---
                        // Mengganti .withOpacity(0.8) dengan .withAlpha(204)
                        color: theme.colorScheme.onPrimary.withAlpha(204),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // --- INFO TAMBAHAN ---
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

            // --- PERKIRAAN HARIAN ---
            Text(
              "Perkiraan Hari Ini",
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),

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
                  ),
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

// --- WIDGET HELPER 1 (DESAIN DIPERBARUI) ---
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
    // Ambil tema untuk warna
    final theme = Theme.of(context);

    return Column(
      children: [
        Icon(icon, color: theme.colorScheme.onPrimary, size: 32),
        const SizedBox(height: 8),
        Text(
          label,
          // --- INI PERBAIKAN KEDUA ---
          // Mengganti .withOpacity(0.8) dengan .withAlpha(204)
          style: TextStyle(color: theme.colorScheme.onPrimary.withAlpha(204)),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            color: theme.colorScheme.onPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

// --- WIDGET HELPER 2 (DESAIN DIPERBARUI) ---
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
    // Ambil tema untuk warna & style
    final theme = Theme.of(context);

    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(right: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: theme.colorScheme.outlineVariant),
      ),
      child: Container(
        width: 100, // Lebar kartu
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              jam,
              style: theme.textTheme.labelLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Icon(icon, color: theme.colorScheme.primary, size: 36),
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
