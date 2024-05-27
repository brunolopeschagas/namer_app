import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:namer_app/model/names.dart';

class MyAppState extends ChangeNotifier {
  var currentName = Name(firstName: '', lastName: '');
  var favoritesNames = <Name>[];
  var allNames = <Name>[];

  void getNext() {
    var current = WordPair.random();
    currentName = Name(firstName: current.first, lastName: current.second);
    allNames.add(currentName);
    notifyListeners();
  }

  void toggleFavorite() {
    if (favoritesNames.contains(currentName)) {
      favoritesNames.remove(currentName);
    } else {
      favoritesNames.add(currentName);
    }
    notifyListeners();
  }

  void deleteFavorite(Name name) {
    favoritesNames.remove(name);
    notifyListeners();
  }

  void removeFromAllList(Name name) {
    allNames.remove(name);
    notifyListeners();
  }
}
