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

  void dislikeBachelor(Bachelor bachelor) {
    if (bachelors.contains(bachelor)) {
      _bachelors.remove(bachelor);
    }
  }

  void toggleLike(Bachelor bachelor) {
    if (likedBachelors.contains(bachelor)) {
      _likedBachelors.remove(bachelor);
    } else {
      _likedBachelors.add(bachelor);
    }
    notifyListeners();
  }

  List<Bachelor> getBachelorsFilterGender(Gender? gender) {
    if (gender == Gender.both) {
      return bachelors;
    }
    List<Bachelor> filterList = [];
    bachelors.forEach((element) {
      if (element.gender == gender) {
        filterList.add(element);
      }
    });
    return filterList;
  }

  bool isLiked(Bachelor bachelor) {
    return likedBachelors.contains(bachelor);
  }
}
