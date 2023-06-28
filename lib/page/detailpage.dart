import 'package:finder/class/bachelor.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage(
      {super.key, required this.bachelor, required this.addLikedBachelor});

  final Bachelor bachelor;

  final Function(Bachelor) addLikedBachelor;

  @override
  State<DetailPage> createState() => _MyDetailPageState();
}

class _MyDetailPageState extends State<DetailPage> {
  bool _isFavorited = false;

  switchFavorite() {
    setState(() {
      _isFavorited = !_isFavorited;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('${widget.bachelor.firstName} ${widget.bachelor.lastName}'),
      ),
      body: Center(
        child: Column(
          children: [
            Image(image: AssetImage(widget.bachelor.avatar)),
            Text("Description : ${widget.bachelor.description}"),
            IconButton(
              onPressed: () {
                switchFavorite();
                const snackBar = SnackBar(
                  content: Text('Vous avez liké ce profil'),
                );
                if (_isFavorited == true) {
                  widget.addLikedBachelor(widget.bachelor);
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
              icon: Icon(
                Icons.favorite,
                color: _isFavorited ? Colors.red : Colors.brown,
                size: 24.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
