import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:namer_app/model/names.dart';

class MyAppState extends ChangeNotifier {
  var currentName = Name(fisrtName: '', lastName: '');

  void getNext() {
    var current = WordPair.random();
    currentName = Name(fisrtName: current.first, lastName: current.second);
    notifyListeners();
  }

  var favorites = <Name>[];

  void toggleFavorite() {
    if (favorites.contains(currentName)) {
      favorites.remove(currentName);
    } else {
      favorites.add(currentName);
    }
    notifyListeners();
  }

  deleteFavorite(Name name) {
    favorites.remove(name);
    notifyListeners();
  }
}
