import 'package:flutter/material.dart';
import 'package:uts_pemmob/models/contact_model.dart';

class ContactListTile extends StatelessWidget {
  final Contact contact;

  const ContactListTile({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      child: ListTile(
        tileColor: theme.colorScheme.surfaceContainer,

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),

        leading: CircleAvatar(
          radius: 25,
          backgroundImage: AssetImage(contact.imageUrl),
          onBackgroundImageError: (exception, stackTrace) {},
          backgroundColor: theme.colorScheme.surfaceContainerHighest,
        ),

        title: Text(
          contact.name,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),

        subtitle: Text(
          contact.phone,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),

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
