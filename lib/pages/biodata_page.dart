// lib/pages/biodata_page.dart
import 'package:flutter/material.dart';

class BiodataPage extends StatefulWidget {
  const BiodataPage({super.key});

  @override
  State<BiodataPage> createState() => _BiodataPageState();
}

class _BiodataPageState extends State<BiodataPage> {
  // --- Variabel State (Logika fungsional dari sebelumnya) ---
  String? _jenisKelamin = 'Laki-laki';
  String? _programStudi = 'Informatika';
  final List<String> _prodiOptions = [
    'Informatika',
    'Sistem Informasi',
    'Teknik Elektro',
    'Teknik Mesin',
  ];
  DateTime? _tanggalLahir;

  final TextEditingController _tanggalController = TextEditingController();

  // --- Fungsi Kalender (Logika fungsional dari sebelumnya) ---
  Future<void> _pilihTanggal(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _tanggalLahir ?? DateTime.now(),
      firstDate: DateTime(1980),
      lastDate: DateTime(2025),
    );

    if (picked != null && picked != _tanggalLahir) {
      setState(() {
        _tanggalLahir = picked;
        _tanggalController.text =
            "${_tanggalLahir!.day}/${_tanggalLahir!.month}/${_tanggalLahir!.year}";
      });
    }
  }

  @override
  void dispose() {
    _tanggalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Ambil tema untuk styling
    final theme = Theme.of(context);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // --- 1. AppBar (Sudah Bagus di Screenshot Anda) ---
          const SliverAppBar.large(title: Text("Biodata")),

          // --- 2. Wrapper untuk Konten ---
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.center, // Pusatkan profil
                children: [
                  // --- 3. PROFIL SECTION (Sudah Bagus) ---
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: const AssetImage(
                      'assets/images/profile_photo.jpg',
                    ),
                    backgroundColor: theme.colorScheme.surfaceContainerHighest,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Muhammad Lutfi Alamsyah", // ! GANTI Nama Anda
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "3411XXXX", // ! GANTI NIM Anda
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 24), // Jarak sebelum Card
                  // --- 4. PERBAIKAN LAYOUT: BUNGKUS FORM DENGAN CARD ---
                  Card(
                    // Gunakan Card.outlined agar konsisten dengan NewsCard
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(
                        // Gunakan warna garis tepi dari tema
                        color: theme.colorScheme.outlineVariant.withAlpha(128),
                      ),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Padding(
                      // Beri padding di DALAM Card
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // --- INPUT TEKS ALAMAT ---
                          TextFormField(
                            decoration: const InputDecoration(
                              labelText: "Alamat",
                              hintText: "Masukkan alamat Anda...",
                              border: OutlineInputBorder(),
                            ),
                            maxLines: 3,
                          ),

                          const SizedBox(height: 24), // Jarak antar field
                          // --- RADIO BUTTON JENIS KELAMIN ---
                          // (Ini adalah kode fungsional , abaikan 'warning' deprecated)
                          Text(
                            "Jenis Kelamin",
                            style: theme.textTheme.bodyLarge, // Label form
                          ),
                          Column(
                            children: [
                              RadioListTile<String>(
                                title: const Text('Laki-laki'),
                                value: 'Laki-laki',
                                groupValue: _jenisKelamin,
                                onChanged: (value) {
                                  setState(() {
                                    _jenisKelamin = value;
                                  });
                                },
                                contentPadding: EdgeInsets.zero,
                              ),
                              RadioListTile<String>(
                                title: const Text('Perempuan'),
                                value: 'Perempuan',
                                groupValue: _jenisKelamin,
                                onChanged: (value) {
                                  setState(() {
                                    _jenisKelamin = value;
                                  });
                                },
                                contentPadding: EdgeInsets.zero,
                              ),
                            ],
                          ),

                          // --- AKHIR RADIO BUTTON ---
                          const SizedBox(height: 16), // Jarak antar field
                          // --- DROPDOWN PROGRAM STUDI ---
                          // (Ini kode fungsional  dengan 'value' yang sudah benar)
                          DropdownButtonFormField<String>(
                            value: _programStudi,
                            decoration: const InputDecoration(
                              labelText: "Program Studi",
                              border: OutlineInputBorder(),
                            ),
                            items: _prodiOptions.map((String prodi) {
                              return DropdownMenuItem<String>(
                                value: prodi,
                                child: Text(prodi),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                _programStudi = newValue;
                              });
                            },
                          ),

                          // --- AKHIR DROPDOWN ---
                          const SizedBox(height: 24), // Jarak antar field
                          // --- CALENDAR TANGGAL LAHIR ---
                          // (Ini kode fungsional  yang memicu kalender)
                          TextFormField(
                            controller: _tanggalController,
                            readOnly: true,
                            decoration: const InputDecoration(
                              labelText: "Tanggal Lahir",
                              hintText: "Pilih tanggal...",
                              border: OutlineInputBorder(),
                              suffixIcon: Icon(Icons.calendar_today),
                            ),
                            onTap: () => _pilihTanggal(context),
                          ),
                          // --- AKHIR CALENDAR ---
                        ],
                      ),
                    ),
                  ),
                  // --- AKHIR DARI CARD ---
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
