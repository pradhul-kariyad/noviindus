// ignore_for_file: file_names, unused_import
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:noviindus/models/branchListModel/branchListModel.dart';
import 'package:noviindus/models/patientListModel/patientListModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BranchListService {
  Future<BranchListModel> getAll() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final token = pref.getString('token');
    final response = await http.get(
      Uri.parse('https://flutter-amr.noviindus.in/api/BranchList'),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
      },
    );

    log('API Response Body: ${response.body}');
    log('API Response Status: ${response.statusCode}');

    if (response.statusCode == 200) {
      try {
        final data = json.decode(response.body);
        log('Parsed Data: $data');
        return BranchListModel.fromJson(data);
      } catch (e) {
        log('Error parsing response: $e');
        return BranchListModel();
      }
    }
    return BranchListModel();
  }
}
