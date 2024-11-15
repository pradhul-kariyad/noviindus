// ignore_for_file: avoid_print, file_names
import 'package:flutter/material.dart';
import 'package:noviindus/models/PatientListModel/PatientListModel.dart';
import 'package:noviindus/provider/PatientListProvider/PatientListService.dart';

class PatientListDataProvider extends ChangeNotifier {
  bool isLoading = true;
  PatientListModel patientList = PatientListModel();

  PatientListDataProvider() {
    fetchPatientList();
  }

  Future<void> fetchPatientList() async {
    isLoading = true;
    notifyListeners();

    try {
      final data = await PatientListService().getAll();
      patientList = data;
    } catch (e) {
      print('Error fetching patient list: $e');
      patientList = PatientListModel();
    }

    isLoading = false;
    notifyListeners();
  }
}
