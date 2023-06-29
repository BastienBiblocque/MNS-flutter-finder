import 'package:finder/class/bachelor.dart';
import 'package:finder/page/detailpage.dart';
import 'package:finder/provider/bacherlorProvider.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:provider/provider.dart';

class BachelorPreview extends StatefulWidget {
  const BachelorPreview({super.key, required this.bachelor});

  final Bachelor bachelor;
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
          builder: (context) => DetailPage(bachelor: widget.bachelor)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BachelorProvider>(
      builder: (context, bachelorProvider, _) {
        return ListTile(
          onTap: goToDetailPage,
          title: bachelorProvider.likedBachelors.contains(widget.bachelor)
              ? const Text('Favori')
              : Text(widget.bachelor.firstName),
          leading: Image.asset(widget.bachelor.avatar),
          textColor: Colors.black,
          tileColor: generateColor(),
          contentPadding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
        );
      },
    );
  }
}
