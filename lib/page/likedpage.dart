import 'package:finder/class/bachelor.dart';
import 'package:finder/component/bachelorPreview.dart';
import 'package:flutter/material.dart';

class LikedPage extends StatefulWidget {
  const LikedPage({super.key, required this.likedBachelors});

  final List<Bachelor> likedBachelors;

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
          child: ListView(
        children: widget.likedBachelors.map((Bachelor bachelor) {
          return BachelorPreview(
              bachelor: bachelor, addLikedBachelor: addLikedBachelor);
        }).toList(),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        backgroundColor: Colors.pinkAccent,
        child: const Icon(Icons.favorite, color: Colors.white),
      ),
    );
  }
}
