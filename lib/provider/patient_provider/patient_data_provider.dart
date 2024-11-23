// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:noviindus/models/patient_list_model/patient_list_model.dart';
import 'package:noviindus/provider/patient_provider/patient_service.dart';

class PatientListDataProvider extends ChangeNotifier {
  bool isLoading = true;
  PatientListModel patientList = PatientListModel();
  PatientListModel filteredPatientList = PatientListModel();
  String searchQuery = '';

  PatientListDataProvider() {
    fetchPatientList();
  }

  Future<void> fetchPatientList() async {
    isLoading = true;
    notifyListeners();

    try {
      final data = await PatientListService().getAll();
      patientList = data;
      filteredPatientList = PatientListModel(
        patient: List.from(data.patient ?? []),
      );
    } catch (e) {
      print('Error fetching patient list: $e');
      patientList = PatientListModel();
      filteredPatientList = PatientListModel();
    }

    isLoading = false;
    notifyListeners();
  }

  void searchPatients(String query) {
    searchQuery = query.toLowerCase();
    if (searchQuery.isEmpty) {
      filteredPatientList = PatientListModel(
        patient: List.from(patientList.patient ?? []),
      );
    } else {
      filteredPatientList.patient = patientList.patient
          ?.where((patient) =>
              patient.name?.toLowerCase().contains(searchQuery) == true)
          .toList();
    }
    notifyListeners();
  }
}
