// ignore_for_file: file_names
import 'package:flutter/material.dart';

class HomeRowProvider extends ChangeNotifier {
  String _selectedText = "Date";

  String get selectedText => _selectedText;

  void updateDate(String newDate) {
    _selectedText = newDate;
    notifyListeners();
  }
}

class DateProvider extends ChangeNotifier {
  String _selectedDate = '';

  String get selectedDate => _selectedDate;

  void updateDate(String date) {
    _selectedDate = date;
    notifyListeners();
  }
}
