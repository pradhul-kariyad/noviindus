// ignore_for_file: use_build_context_synchronously, file_names
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:noviindus/colors/colors.dart';
import 'package:noviindus/view/pages/home/homePage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginProvider extends ChangeNotifier {
  bool isLoading = false;

  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future<void> logIn(
      String username, String password, BuildContext context) async {
    try {
      setLoading(true);
      log("Sending login request...");

      var response = await http.post(
        Uri.parse('https://flutter-amr.noviindus.in/api/Login'),
        body: {
          'username': username,
          'password': password,
        },
      );

      log('Response status code: ${response.statusCode}');
      log('Response body: ${response.body}');

      setLoading(false);

      if (response.statusCode == 200) {
        log("Log-in successful");
        var result = jsonDecode(response.body);
        String? token = result['token'];

        if (token != null) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
          SharedPreferences pref = await SharedPreferences.getInstance();
          await pref.setString('token', token);
          await pref.setBool('userlogin', true);
          log('Token stored: $token');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: green,
              content: Center(
                child: Text(
                  "Welcome...",
                  style: TextStyle(color: white, fontFamily: 'Poppins'),
                ),
              ),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: green,
              content: Text("Invalid username or password"),
            ),
          );
        }
      } else {
        var responseBody = jsonDecode(response.body);
        String errorMessage = responseBody['error'] ?? 'Log-in failed...';
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: green,
            content: Text(errorMessage),
          ),
        );

        log("Log-in failed: $errorMessage");
      }
    } catch (e) {
      log('Error during Log-in: $e');
      setLoading(false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: green,
          content: Center(
            child: Text(
              "Welcome...",
              style: TextStyle(color: white, fontFamily: 'Poppins'),
            ),
          ),
        ),
      );
    }
  }
}
