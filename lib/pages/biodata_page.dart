// lib/pages/biodata_page.dart
import 'package:flutter/material.dart';

// 1. Ubah menjadi StatefulWidget
class BiodataPage extends StatefulWidget {
  const BiodataPage({super.key});

  @override
  State<BiodataPage> createState() => _BiodataPageState();
}

class _BiodataPageState extends State<BiodataPage> {
  // 2. Variabel State untuk menyimpan nilai input
  // Variabel untuk Radio Button (Jenis Kelamin)
  String? _jenisKelamin = 'Laki-laki'; // Nilai default

  // Variabel untuk Dropdown (Program Studi)
  String? _programStudi = 'Informatika'; // Nilai default
  final List<String> _prodiOptions = [
    'Informatika',
    'Sistem Informasi',
    'Teknik Elektro',
    'Teknik Mesin',
  ];

  // Variabel untuk Calendar (DatePicker)
  DateTime? _tanggalLahir;

  // 3. Fungsi untuk menampilkan Kalender [Poin c]
  Future<void> _pilihTanggal(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _tanggalLahir ?? DateTime.now(), // Tanggal awal
      firstDate: DateTime(1980), // Batas tanggal awal
      lastDate: DateTime(2025), // Batas tanggal akhir
    );
    // 'setState' untuk memperbarui UI dengan tanggal yang baru dipilih
    if (picked != null && picked != _tanggalLahir) {
      setState(() {
        _tanggalLahir = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Biodata")),
      // 4. Gunakan SingleChildScrollView
      // Ini PENTING agar halaman bisa di-scroll saat keyboard muncul
      // dan menghindari 'Bottom Overflow' error.
      body: SingleChildScrollView(
        // Beri padding agar tidak terlalu mepet ke tepi layar
        padding: const EdgeInsets.all(16.0),
        // Susun semua widget secara vertikal
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Rata kiri
          children: [
            // --- FOTO PROFILE & NAMA [Poin c] ---
            Center(
              child: CircleAvatar(
                radius: 60,
                // ! GANTI dengan path foto Anda
                backgroundImage: const AssetImage(
                  'assets/images/profile_photo.jpg',
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Center(
              child: Text(
                "Muhammad Lutfi Alamsyah", // ! GANTI Nama Anda
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const Center(
              child: Text(
                "3411XXXX", // ! GANTI NIM Anda
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            ),

            const Divider(height: 32, thickness: 1), // Garis pemisah
            // --- INPUT TEKS (TextFormField) [Poin c] ---
            const Text(
              "Alamat",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextFormField(
              decoration: const InputDecoration(
                hintText: "Masukkan alamat Anda...",
                border: OutlineInputBorder(), // Tampilan modern
              ),
              maxLines: 3, // Untuk teks yang panjang
            ),

            const SizedBox(height: 24),

            // --- RADIO BUTTON (RadioListTile) [Poin c] ---
            const Text(
              "Jenis Kelamin",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            // --- KODE YANG DIPERBAIKI DIMULAI DI SINI ---
            RadioGroup<String>(
              // Properti 'groupValue' dan 'onChanged' tetap di sini
              groupValue: _jenisKelamin,
              onChanged: (value) {
                setState(() {
                  _jenisKelamin = value;
                });
              },

              // 1. Tambahkan 'child' yang wajib (Error 1 Fix)
              child: Column(
                // 2. Pindahkan 'children' ke dalam Column (Error 2 Fix)
                children: [
                  RadioListTile<String>(
                    title: const Text('Laki-laki'),
                    value: 'Laki-laki',
                  ),
                  RadioListTile<String>(
                    title: const Text('Perempuan'),
                    value: 'Perempuan',
                  ),
                ],
              ),
            ),

            // --- KODE YANG DIPERBAIKI BERAKHIR DI SINI ---
            const SizedBox(height: 24),

            // --- DROPDOWN (DropdownButtonFormField) [Poin c] ---
            const Text(
              "Program Studi",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            DropdownButtonFormField<String>(
              initialValue: _programStudi, // Nilai yang sedang terpilih
              decoration: const InputDecoration(border: OutlineInputBorder()),
              // 'items' adalah daftar pilihan
              items: _prodiOptions.map((String prodi) {
                return DropdownMenuItem<String>(
                  value: prodi,
                  child: Text(prodi),
                );
              }).toList(),
              // 'onChanged' dipanggil saat user memilih
              onChanged: (newValue) {
                setState(() {
                  _programStudi = newValue;
                });
              },
            ),

            const SizedBox(height: 24),

            // --- CALENDAR (showDatePicker) [Poin c] ---
            const Text(
              "Tanggal Lahir",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                // Tampilkan tanggal yang dipilih
                Expanded(
                  child: Text(
                    _tanggalLahir == null
                        ? "Belum dipilih"
                        // Format tanggal sederhana
                        : "${_tanggalLahir!.day}/${_tanggalLahir!.month}/${_tanggalLahir!.year}",
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                // Tombol untuk membuka kalender
                ElevatedButton(
                  onPressed: () => _pilihTanggal(context),
                  child: const Text('Pilih Tanggal'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
