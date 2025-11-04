// lib/pages/biodata_page.dart
import 'package:flutter/material.dart';

// 1. Ubah menjadi StatefulWidget
class BiodataPage extends StatefulWidget {
  const BiodataPage({super.key});

  @override
  State<BiodataPage> createState() => _BiodataPageState();
}

class _BiodataPageState extends State<BiodataPage> {
  // 2. Variabel State
  String? _jenisKelamin = 'Laki-laki';
  String? _programStudi = 'Informatika';
  final List<String> _prodiOptions = [
    'Informatika',
    'Sistem Informasi',
    'Teknik Elektro',
    'Teknik Mesin',
  ];
  DateTime? _tanggalLahir;

  // Controller untuk field tanggal
  final TextEditingController _tanggalController = TextEditingController();

  // 3. Fungsi untuk menampilkan Kalender (Logika ini sudah benar)
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

    // 4. Gunakan CustomScrollView (agar konsisten)
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Gunakan AppBar besar yang modern
          const SliverAppBar.large(title: Text("Biodata")),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // --- FOTO PROFILE & NAMA ---
                  Center(
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage: const AssetImage(
                        'assets/images/profile_photo.jpg',
                      ),
                      backgroundColor:
                          theme.colorScheme.surfaceContainerHighest,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: Text(
                      "Muhammad Lutfi Alamsyah", // ! GANTI Nama Anda
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Center(
                    child: Text(
                      "3411XXXX", // ! GANTI NIM Anda
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),

                  const Divider(height: 32, thickness: 1),

                  // --- INPUT TEKS ---
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Alamat",
                      hintText: "Masukkan alamat Anda...",
                      border: OutlineInputBorder(),
                    ),
                    maxLines: 3,
                  ),

                  const SizedBox(height: 24),

                  // --- RADIO BUTTON (PERBAIKAN FINAL & FUNGSIONAL) ---
                  Text("Jenis Kelamin", style: theme.textTheme.titleMedium),
                  // 1. HAPUS 'RadioGroup'. Gunakan 'Column' sederhana.
                  // Ini akan BERFUNGSI, meskipun menampilkan 4 'warning' deprecated.
                  Column(
                    children: [
                      RadioListTile<String>(
                        title: const Text('Laki-laki'),
                        value: 'Laki-laki',
                        groupValue:
                            _jenisKelamin, // <-- Ini akan diberi 'warning'
                        onChanged: (value) {
                          // <-- Ini akan diberi 'warning'
                          setState(() {
                            _jenisKelamin = value;
                          });
                        },
                        contentPadding: EdgeInsets.zero,
                      ),
                      RadioListTile<String>(
                        title: const Text('Perempuan'),
                        value: 'Perempuan',
                        groupValue:
                            _jenisKelamin, // <-- Ini akan diberi 'warning'
                        onChanged: (value) {
                          // <-- Ini akan diberi 'warning'
                          setState(() {
                            _jenisKelamin = value;
                          });
                        },
                        contentPadding: EdgeInsets.zero,
                      ),
                    ],
                  ),

                  // --- AKHIR PERBAIKAN RADIO BUTTON ---
                  const SizedBox(height: 24),

                  // --- DROPDOWN (PERBAIKAN KONSISTENSI) ---
                  DropdownButtonFormField<String>(
                    // 2. GANTI 'initialValue' MENJADI 'value'
                    value: _programStudi, // <-- Ini perbaikannya

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

                  // --- AKHIR PERBAIKAN DROPDOWN ---
                  const SizedBox(height: 24),

                  // --- CALENDAR (SEKARANG AKAN BERFUNGSI) ---
                  // Karena 'error' RadioGroup sudah hilang, 'onTap' ini akan hidup.
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

                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
