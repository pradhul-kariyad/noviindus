import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:noviindus/models/treatmentListModel/treatmentListModel.dart';
import 'package:noviindus/provider/treatmentDataProvider/treatmentListService.dart';

class TreatmentDataProvider extends ChangeNotifier {
  List<Treatments> treatments = [];
  Treatments? selectedTreatment;
  bool isLoading = false;

  Future<void> loadTreatmentsFromApi() async {
    if (treatments.isNotEmpty) return;

    isLoading = true;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });

    try {
      final treatmentService = TreatmentListService();
      final treatmentListModel = await treatmentService.getAll();
      treatments = treatmentListModel.treatments ?? [];
      log('Treatments fetched: ${treatments.length}');
    } catch (e) {
      log('Error fetching treatments: $e');
    } finally {
      isLoading = false;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        notifyListeners();
      });
    }
  }

  void selectTreatment(Treatments treatment) {
    selectedTreatment = treatment;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
  }
}
