import 'package:finder/class/bachelor.dart';
import 'package:finder/component/bachelorPreview.dart';
import 'package:finder/page/likedpage.dart';
import 'package:flutter/material.dart';
import 'package:finder/service/generateBachelor.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Bachelor> bachelors = [];

  List<Bachelor> likedBachelors = [];

  void addLikedBachelor(Bachelor bachelor) {
    setState(() {
      likedBachelors.add(bachelor);
    });
  }

  @override
  void initState() {
    bachelors = BachelorService().getBachelors();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Finder"),
      ),
      body: Center(
          child: ListView(
        children: bachelors.map((Bachelor bachelor) {
          return BachelorPreview(
              bachelor: bachelor, addLikedBachelor: addLikedBachelor);
        }).toList(),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LikedPage(likedBachelors: likedBachelors),
            ),
          );
        },
        backgroundColor: Colors.pinkAccent,
        child: const Icon(Icons.favorite, color: Colors.white),
      ),
    );
  }
}
