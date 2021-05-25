import 'package:flutter/material.dart';

int _number = 0;
bool _left = true;
int _regno;

class Number with ChangeNotifier {
  int get number {
    return _number;
  }

  bool get didLeave {
    return _left;
  }

  void setregno(int regno) {
    _regno = regno;
    notifyListeners();
  }

  int get regno {
    return _regno;
  }

  void left() {
    _left = true;
    _regno = null;
    notifyListeners();
  }

  void entered() {
    _left = false;
    notifyListeners();
  }

  void increaseCount() {
    _number++;
    notifyListeners();
  }

  void decreaseCount() {
    if (_number == 0) {
      return;
    }
    _number--;
    notifyListeners();
  }
}
