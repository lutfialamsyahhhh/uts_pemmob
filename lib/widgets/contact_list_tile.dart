// lib/widgets/contact_list_tile.dart
import 'package:flutter/material.dart';
import 'package:uts_pemmob/models/contact_model.dart'; // Import model kontak

class ContactListTile extends StatelessWidget {
  final Contact contact;

  const ContactListTile({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // 1. Tambahkan Padding untuk memberi spasi di luar item
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      child: ListTile(
        // 2. Beri 'tileColor' agar menonjol dari latar belakang
        tileColor: theme.colorScheme.surfaceContainer,

        // 3. Beri 'shape' agar memiliki sudut membulat (modern)
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),

        // --- INI ADALAH BARIS YANG DIHAPUS ---
        // clipBehavior: Clip.antiAlias, // <-- BARIS INI DIHAPUS
        // ------------------------------------

        // --- KONTEN LISTTILE ANDA (TETAP SAMA) ---

        // 'leading' untuk "Circle Image"
        leading: CircleAvatar(
          radius: 25, // Ukuran
          backgroundImage: AssetImage(contact.imageUrl),
          onBackgroundImageError: (exception, stackTrace) {},
          backgroundColor: theme.colorScheme.surfaceContainerHighest,
        ),

        // 'title' untuk "Teks" Nama
        title: Text(
          contact.name,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),

        // 'subtitle' untuk "Teks" Telepon
        subtitle: Text(
          contact.phone,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),

        // 'trailing' (opsional) untuk ikon di kanan
        trailing: Icon(
          Icons.chevron_right,
          color: theme.colorScheme.onSurfaceVariant,
        ),

        onTap: () {
          // TODO: Tambahkan aksi saat kontak di-klik
          // (Peringatan 'TODO' ini aman untuk diabaikan)
        },
      ),
    );
  }
}
