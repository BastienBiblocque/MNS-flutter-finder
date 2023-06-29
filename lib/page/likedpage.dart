import 'package:finder/class/bachelor.dart';
import 'package:finder/component/bachelorPreview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/bacherlorProvider.dart';

class LikedPage extends StatefulWidget {
  const LikedPage({super.key});

  @override
  State<LikedPage> createState() => _MyLikedPageState();
}

class _MyLikedPageState extends State<LikedPage> {
  void addLikedBachelor(Bachelor bachelor) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Finder"),
      ),
      body: Center(
        child: Consumer<BachelorProvider>(
          builder: (context, bachelorProvider, _) {
            return ListView(
              children:
                  bachelorProvider.likedBachelors.map((Bachelor bachelor) {
                return BachelorPreview(bachelor: bachelor);
              }).toList(),
            );
          },
        ),
      ),
    );
  }
}
