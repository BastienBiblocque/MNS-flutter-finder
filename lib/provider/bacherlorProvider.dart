import 'package:finder/class/bachelor.dart';
import 'package:finder/service/generateBachelor.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BachelorProvider extends ChangeNotifier {
  final List<Bachelor> _likedBachelors = [];
  final List<Bachelor> _bachelors = BachelorService().getBachelors();

  List<Bachelor> get likedBachelors => List.unmodifiable(_likedBachelors);
  List<Bachelor> get bachelors => List.unmodifiable(_bachelors);

  void likeBachelor(Bachelor bachelor) {
    if (!likedBachelors.contains(bachelor)) {
      _likedBachelors.add(bachelor);
    }
    notifyListeners();
  }

  void toggleLike(Bachelor bachelor) {
    if (likedBachelors.contains(bachelor)) {
      _likedBachelors.remove(bachelor);
    } else {
      _likedBachelors.add(bachelor);
    }
    notifyListeners();
  }

  bool isLiked(Bachelor bachelor) {
    print(likedBachelors);
    return likedBachelors.contains(bachelor);
  }
}
