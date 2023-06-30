import 'package:finder/class/bachelor.dart';
import 'package:finder/component/bachelorPreview.dart';
import 'package:finder/provider/bacherlorProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void addLikedBachelor(Bachelor bachelor) {}

  Gender selectedGender = Gender.both;

  void changeGender(Gender gender) {
    setState(() {
      selectedGender = gender;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Finder"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: () {
              showModalBottomSheet<void>(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    height: 200,
                    color: Colors.pink,
                    child: Center(
                      child: GridView.count(
                        crossAxisCount: 3,
                        children: [
                          IconButton(
                            iconSize: 100,
                            icon: const Icon(
                              Icons.woman,
                            ),
                            onPressed: () {
                              changeGender(Gender.women);
                            },
                          ),
                          IconButton(
                            iconSize: 100,
                            icon: const Icon(
                              Icons.man,
                            ),
                            onPressed: () {
                              changeGender(Gender.men);
                            },
                          ),
                          IconButton(
                            iconSize: 100,
                            icon: const Icon(
                              Icons.wc,
                            ),
                            onPressed: () {
                              changeGender(Gender.both);
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          )
        ],
      ),
      body: Center(
        child: Consumer<BachelorProvider>(
          builder: (context, bachelorProvider, _) {
            return ListView(
              children: bachelorProvider
                  .getBachelorsFilterGender(selectedGender)
                  .map((Bachelor bachelor) {
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
        currentIndex: 0,
        selectedItemColor: Colors.white,
        onTap: (int index) {
          if (index == 1) {
            context.go('/favorites');
          }
        },
      ),
    );
  }
}
