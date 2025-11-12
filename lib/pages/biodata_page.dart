import 'package:flutter/material.dart';

class BiodataPage extends StatefulWidget {
  const BiodataPage({super.key});

  @override
  State<BiodataPage> createState() => _BiodataPageState();
}

class _BiodataPageState extends State<BiodataPage> {
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
    final theme = Theme.of(context);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar.large(title: Text("Biodata")),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: const AssetImage(
                      'assets/images/profile_photo.jpg',
                    ),
                    backgroundColor: theme.colorScheme.surfaceContainerHighest,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Muhammad Lutfi Alamsyah",
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "152023059",
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(
                        color: theme.colorScheme.outlineVariant.withAlpha(128),
                      ),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            decoration: const InputDecoration(
                              labelText: "Alamat",
                              hintText: "Masukkan alamat Anda...",
                              border: OutlineInputBorder(),
                            ),
                            maxLines: 3,
                          ),

                          const SizedBox(height: 24),
                          Text(
                            "Jenis Kelamin",
                            style: theme.textTheme.bodyLarge,
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

                          const SizedBox(height: 16),
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

                          const SizedBox(height: 24),
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
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
