import 'package:flutter/material.dart';
import 'package:uts_pemmob/models/contact_model.dart';
import 'package:uts_pemmob/widgets/contact_list_tile.dart';

class KontakPage extends StatelessWidget {
  const KontakPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(title: const Text("Daftar Kontak")),

          SliverList.builder(
            itemCount: dummyContacts.length,

            itemBuilder: (BuildContext context, int index) {
              final Contact contact = dummyContacts[index];

              return ContactListTile(contact: contact);
            },
          ),
        ],
      ),
    );
  }
}
