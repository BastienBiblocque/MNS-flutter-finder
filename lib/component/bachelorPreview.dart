import 'package:finder/class/bachelor.dart';
import 'package:finder/page/detailpage.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class BachelorPreview extends StatefulWidget {
  const BachelorPreview(
      {super.key, required this.bachelor, required this.addLikedBachelor});

  final Bachelor bachelor;

  final Function(Bachelor) addLikedBachelor;

  @override
  State<BachelorPreview> createState() => _BachelorPreviewState();
}

class _BachelorPreviewState extends State<BachelorPreview> {
  var rng = Random();

  Color generateColor() {
    return Colors.primaries[rng.nextInt(18)];
  }

  void goToDetailPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => DetailPage(
              bachelor: widget.bachelor,
              addLikedBachelor: widget.addLikedBachelor)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: goToDetailPage,
      title: Text(widget.bachelor.firstName),
      leading: Image.asset(widget.bachelor.avatar),
      textColor: Colors.black,
      tileColor: generateColor(),
      contentPadding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
    );
  }
}
