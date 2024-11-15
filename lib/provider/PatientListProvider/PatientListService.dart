// ignore_for_file: file_names
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:noviindus/models/PatientListModel/PatientListModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PatientListService {
  Future<PatientListModel> getAll() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final token = pref.getString('token');
    final response = await http.get(
      Uri.parse('https://flutter-amr.noviindus.in/api/PatientList'),
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
        return PatientListModel.fromJson(data);
      } catch (e) {
        log('Error parsing response: $e');
        return PatientListModel();
      }
    }
    return PatientListModel();
  }
}
