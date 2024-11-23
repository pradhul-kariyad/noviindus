// ignore_for_file: file_names, unused_import
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:noviindus/models/branch_list_model/branch_list_model.dart';
import 'package:noviindus/models/treatment_list_model/treatment_list_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TreatmentListService {
  Future<TreatmentListModel> getAll() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final token = pref.getString('token');
    final response = await http.get(
      Uri.parse('https://flutter-amr.noviindus.in/api/TreatmentList'),
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
        return TreatmentListModel.fromJson(data);
      } catch (e) {
        log('Error parsing response: $e');
        return TreatmentListModel();
      }
    }
    return TreatmentListModel();
  }
}