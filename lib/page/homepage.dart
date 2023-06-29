import 'package:finder/class/bachelor.dart';
import 'package:finder/component/bachelorPreview.dart';
import 'package:finder/provider/bacherlorProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

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
              children: bachelorProvider.bachelors.map((Bachelor bachelor) {
                return BachelorPreview(bachelor: bachelor);
              }).toList(),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.go('/favorites');
        },
        backgroundColor: Colors.pinkAccent,
        child: const Icon(Icons.favorite, color: Colors.white),
      ),
    );
  }
}
