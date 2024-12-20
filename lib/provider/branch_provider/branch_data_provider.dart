// ignore_for_file: file_names
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:noviindus/models/branch_list_model/branch_list_model.dart';
import 'package:noviindus/provider/branch_provider/branch_service.dart';

class BranchDataProvider extends ChangeNotifier {
  List<Branches> branches = [];
  Branches? selectedBranch;
  bool isLoading = false;

  Future<void> loadBranchesFromApi() async {
    isLoading = true;
    notifyListeners();

    try {
      BranchListService service = BranchListService();
      final branchListModel = await service.getAll();
      branches = branchListModel.branches ?? [];
      log('Branches loaded: $branches');
    } catch (e) {
      log('Error fetching branches: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void selectBranch(Branches branch) {
    selectedBranch = branch;
    notifyListeners();
  }
}
