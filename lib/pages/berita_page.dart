import 'package:flutter/material.dart';
import 'package:uts_pemmob/models/news_model.dart';
import 'package:uts_pemmob/widgets/news_card.dart';

class BeritaPage extends StatelessWidget {
  const BeritaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(title: const Text("Favorit")),

          SliverList.builder(
            itemCount: dummyNews.length,

            itemBuilder: (context, index) {
              final article = dummyNews[index];

              return NewsCard(article: article);
            },
          ),
        ],
      ),
    );
  }
}
