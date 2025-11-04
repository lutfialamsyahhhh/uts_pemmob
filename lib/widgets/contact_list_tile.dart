// lib/widgets/contact_list_tile.dart
import 'package:flutter/material.dart';
import 'package:uts_pemmob/models/contact_model.dart'; // Import model kontak

// Ini adalah widget kustom untuk satu item kontak
class ContactListTile extends StatelessWidget {
  final Contact contact;

  const ContactListTile({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Kita gunakan ListTile, ini sudah pilihan yang sangat tepat
    return ListTile(
      // 'leading' untuk "Circle Image"
      leading: CircleAvatar(
        radius: 25, // Ukuran
        // Menggunakan path gambar dari objek kontak
        backgroundImage: AssetImage(contact.imageUrl),

        // Error handling jika gambar gagal dimuat
        onBackgroundImageError: (exception, stackTrace) {
          // (Anda bisa biarkan kosong atau tampilkan inisial nama)
        },
        // Memberi warna latar placeholder
        backgroundColor: theme.colorScheme.surfaceContainerHighest,
      ),

      // 'title' untuk "Teks" Nama
      title: Text(
        contact.name,
        // Menggunakan style dari tema agar konsisten
        style: theme.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),

      // 'subtitle' untuk "Teks" Telepon
      subtitle: Text(
        contact.phone,
        // Memberi warna yang lebih halus (elegan)
        style: theme.textTheme.bodyMedium?.copyWith(
          color: theme.colorScheme.onSurfaceVariant,
        ),
      ),

      // 'trailing' (opsional) untuk ikon di kanan
      trailing: Icon(
        Icons.chevron_right,
        // --- INI PERBAIKANNYA ---
        // Kita hapus .withOpacity(0.5)
        color: theme.colorScheme.onSurfaceVariant,
      ),

      onTap: () {
        // TODO: Tambahkan aksi saat kontak di-klik
        // (Peringatan 'TODO' ini aman untuk diabaikan)
      },
    );
  }
}
