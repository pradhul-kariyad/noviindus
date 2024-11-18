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
  String selectedDate = "";

  void updateDate(String date) {
    selectedDate = date;
    notifyListeners();
  }
}
