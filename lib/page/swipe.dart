import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

import '../provider/bacherlorProvider.dart';

class SwipePage extends StatelessWidget {
  const SwipePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BachelorProvider>(builder: (context, bachelorsProvider, _) {
      final bachelors = bachelorsProvider.bachelors;

      return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Finder"),
        ),
        body: Center(
          child: CupertinoPageScaffold(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.75,
              child: AppinioSwiper(
                cardsCount: bachelors.length,
                onSwipe: (index, direction) => {
                  if (direction == AppinioSwiperDirection.right)
                    {
                      bachelorsProvider.likeBachelor(bachelors[index - 1]),
                    }
                  else if (direction == AppinioSwiperDirection.left)
                    {
                      bachelorsProvider.dislikeBachelor(bachelors[index - 1]),
                    }
                },
                cardsBuilder: (BuildContext context, int index) {
                  return Container(
                    alignment: Alignment.center,
                    // color: CupertinoColors.activeBlue,
                    decoration: const BoxDecoration(
                      color: CupertinoColors.activeBlue,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                            image: AssetImage(bachelors[index].avatar),
                            height: 200,
                            width: 200),
                        Text(
                          '${bachelors[index].firstName} ${bachelors[index].lastName}',
                          style: const TextStyle(
                            fontSize: 24,
                            decoration: TextDecoration.none,
                            color: CupertinoColors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                          child: Text(
                            '${bachelors[index].description}',
                            style: const TextStyle(
                              fontSize: 16,
                              decoration: TextDecoration.none,
                              color: CupertinoColors.white,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
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
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.go('/favorites');
          },
          backgroundColor: Colors.pinkAccent,
          child: const Icon(Icons.favorite, color: Colors.white),
        ),
      );
    });
  }
}
