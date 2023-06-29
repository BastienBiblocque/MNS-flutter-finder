import 'package:finder/class/bachelor.dart';
import 'package:finder/provider/bacherlorProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.bachelor});

  final Bachelor bachelor;

  @override
  Widget build(BuildContext context) {
    return Consumer<BachelorProvider>(
      builder: (context, bachelorsProvider, _) {
        final isFavorited = bachelorsProvider.likedBachelors.contains(bachelor);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text('${bachelor.firstName} ${bachelor.lastName}'),
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Image(image: AssetImage(bachelor.avatar)),
                  Text("Description : ${bachelor.description}"),
                  IconButton(
                    onPressed: () {
                      bachelorsProvider.toggleLike(bachelor);
                      const snackBar = SnackBar(
                        content: Text('Vous avez liké ce profil'),
                      );
                      if (isFavorited == false) {
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                    icon: Icon(
                      Icons.favorite,
                      color: isFavorited ? Colors.red : Colors.brown,
                      size: 24.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
