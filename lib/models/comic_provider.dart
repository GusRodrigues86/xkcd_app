import 'package:flutter/material.dart';
import 'package:xkcd/service/api_calls.dart';
import 'comic.dart';

class ComicProvider with ChangeNotifier {
  Future<Comic> _current;

  /// keeps track on initial build of the max value of the
  int _max;

  get current {
    // initial conidtion
    if (_current == null) {
      _current = fetchCurrent().then((value) {
        _max = value.num;
        return value;
      });
    }

    return _current;
  }

  void first() {
    _current = fetchFirst();
    notifyListeners();
  }

  void latest() {
    _current = fetchCurrent().then((value) {
      _max = value.num;
      return value;
    });
    notifyListeners();
  }

  void previous() async {
    int prev = 0;
    await _current.then((value) => prev = value.num - 1);
    if (prev < 1) {
      first();
    } else {
      _current = fetchById(id: prev);
      notifyListeners();
    }
  }

  void next() async {
    int next = 0;
    await _current.then((value) => next = value.num + 1);
    if (next > _max) {
      latest();
      return;
    }
    _current = fetchById(id: next);
    notifyListeners();
  }

  void random() {
    _current = fetchRandom(_max);
    notifyListeners();
  }
}
