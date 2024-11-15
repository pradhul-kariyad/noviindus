// ignore_for_file: use_build_context_synchronously, file_names, unused_import
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:noviindus/colors/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class PatientUpdateProvider extends ChangeNotifier {
  bool isLoading = false;

  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future<void> updatePatient({
    required String name,
    required String executive,
    required String payment,
    required String phone,
    required String address,
    required double totalAmount,
    required double discountAmount,
    required double advanceAmount,
    required double balanceAmount,
    required String dateAndTime,
    required String id,
    required List<int> male,
    required List<int> female,
    required String branch,
    required List<int> treatments,
    required BuildContext context,
  }) async {
    try {
      setLoading(true);
      log("Sending PatientUpdate request...");

      SharedPreferences pref = await SharedPreferences.getInstance();
      final token = pref.getString('token');
      log("'Bearer $token'");

      if (token == null || token.isEmpty) {
        throw Exception("Authentication token not found.");
      }

      log('Token retrieved: $token');

      Map<String, dynamic> body = {
        'name': name,
        'excecutive': executive,
        'payment': payment,
        'phone': phone,
        'address': address,
        'total_amount': totalAmount.toString(),
        'discount_amount': discountAmount.toString(),
        'advance_amount': advanceAmount.toString(),
        'balance_amount': balanceAmount.toString(),
        'date_nd_time': dateAndTime,
        'id': id,
        'male': male.join(','),
        'female': female.join(','),
        'branch': branch,
        'treatments': treatments.join(','),
      };

      log("Request body: ${jsonEncode(body)}");

      var response = await http.post(
        Uri.parse('https://flutter-amr.noviindus.in/api/PatientUpdate'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(body),
      );

      log('Response status code: ${response.statusCode}');
      log('Response body: ${response.body}');

      setLoading(false);

      if (response.statusCode == 200) {
        log("PatientUpdate successful");
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: green,
            content: Center(
                child: Text(
              "Patient updated successfully!",
              style: TextStyle(color: white, fontFamily: 'Poppins'),
            ))));
      } else {
        if (response.body.startsWith('<!DOCTYPE html>')) {
          log('Received HTML response instead of JSON. This might indicate a server-side issue.');
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: green,
              content: Center(
                  child: Text(
                "Server error occurred. Please try again later.",
                style: TextStyle(color: white, fontFamily: 'Poppins'),
              ))));
        } else {
          var responseBody = jsonDecode(response.body);
          String errorMessage = responseBody['error'] ?? 'Update failed.';
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(backgroundColor: green, content: Text(errorMessage)));

          log("PatientUpdate failed: $errorMessage");
        }
      }
    } catch (e) {
      log('Error during PatientUpdate: $e');
      setLoading(false);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: green,
          content: Center(
              child: Text(
            "An error occurred. Please try again.",
            style: TextStyle(color: white, fontFamily: 'Poppins'),
          ))));
    }
  }
}
