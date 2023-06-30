import 'package:finder/class/bachelor.dart';
import 'package:finder/component/bachelorPreview.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.go('/swipe');
        },
        backgroundColor: Colors.pinkAccent,
        child: const Icon(Icons.swipe, color: Colors.white),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.pinkAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
            backgroundColor: Colors.pinkAccent,
          ),
        ],
        currentIndex: 1,
        selectedItemColor: Colors.white,
        onTap: (int index) {
          if (index == 0) {
            context.go('/');
          }
        },
      ),
    );
  }
}
