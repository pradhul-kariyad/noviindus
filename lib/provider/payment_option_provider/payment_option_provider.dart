// ignore_for_file: file_names
import 'package:flutter/material.dart';

class PaymentOptionProvider extends ChangeNotifier {
  String _selectedOption = '';

  String get selectedOption => _selectedOption;

  void updateSelectedOption(String option) {
    _selectedOption = option;
    notifyListeners();
  }
}
