// ignore_for_file: file_names
import 'package:flutter/material.dart';

class PatientCountProvider with ChangeNotifier {
  int _maleCount = 0;
  int _femaleCount = 0;

  int get maleCount => _maleCount;
  int get femaleCount => _femaleCount;

  void incrementMale() {
    _maleCount++;
    notifyListeners();
  }

  void decrementMale() {
    if (_maleCount > 0) {
      _maleCount--;
      notifyListeners();
    }
  }

  void incrementFemale() {
    _femaleCount++;
    notifyListeners();
  }

  void decrementFemale() {
    if (_femaleCount > 0) {
      _femaleCount--;
      notifyListeners();
    }
  }

  void updateCounts(int maleCount, int femaleCount) {
    _maleCount = maleCount;
    _femaleCount = femaleCount;
    notifyListeners();
  }
}
