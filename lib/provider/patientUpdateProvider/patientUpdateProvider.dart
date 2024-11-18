// ignore_for_file: use_build_context_synchronously, file_names, unused_import

import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noviindus/auth/LoginOrRegister/LogIn.dart';
import 'package:noviindus/colors/colors.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'dart:io';

class PatientUpdateProvider extends ChangeNotifier {
  bool isLoading = false;

  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  String formatAmount(double value) {
    return value == value.toInt()
        ? value.toInt().toString()
        : value.toStringAsFixed(2);
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

      if (token == null || token.isEmpty) {
        throw Exception("Authentication token not found.");
      }

      log('Token: $token');

      var request = http.MultipartRequest(
        'POST',
        Uri.parse('https://flutter-amr.noviindus.in/api/PatientUpdate'),
      );

      request.headers['Authorization'] = 'Bearer $token';
      log('Headers: ${request.headers}');

      request.fields['name'] = name;
      request.fields['excecutive'] = executive;
      request.fields['payment'] = payment;
      request.fields['phone'] = phone;
      request.fields['address'] = address;
      request.fields['total_amount'] = formatAmount(totalAmount);
      request.fields['discount_amount'] = formatAmount(discountAmount);
      request.fields['advance_amount'] = formatAmount(advanceAmount);
      request.fields['balance_amount'] = formatAmount(balanceAmount);
      request.fields['date_nd_time'] = dateAndTime;
      request.fields['id'] = id;
      request.fields['male'] = male.join(',');
      request.fields['female'] = female.join(',');
      request.fields['branch'] = branch;
      request.fields['treatments'] = treatments.join(',');

      log("Form-data: ${request.fields}");

      var response = await request.send();

      log('Response status code: ${response.statusCode}');
      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();
        log('Response body: $responseBody');

        _generatePDF(
            name,
            executive,
            payment,
            phone,
            address,
            totalAmount,
            discountAmount,
            advanceAmount,
            balanceAmount,
            dateAndTime,
            male,
            female,
            treatments);

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: green,
          content: Center(
            child: Text(
              "Created Successfully",
              style: TextStyle(
                  color: white, fontFamily: 'Poppins', fontSize: 12.sp),
            ),
          ),
        ));
      } else {
        final responseBody = await response.stream.bytesToString();
        log('Response body: $responseBody');

        if (responseBody.startsWith('<!DOCTYPE html>')) {
          log('Received HTML response instead of JSON. This might indicate a server-side issue.');
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: green,
            content: Center(
              child: Text(
                "Server error occurred. Please try again later.",
                style: TextStyle(
                    color: white, fontFamily: 'Poppins', fontSize: 12.sp),
              ),
            ),
          ));
        } else {
          var decodedResponse = jsonDecode(responseBody);
          String errorMessage = decodedResponse['error'] ?? 'Update failed.';
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: green,
            content: Center(
                child: Text(
              errorMessage,
              style: TextStyle(
                  color: white, fontFamily: 'Poppins', fontSize: 12.sp),
            )),
          ));
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
            style:
                TextStyle(color: white, fontFamily: 'Poppins', fontSize: 12.sp),
          ),
        ),
      ));
    } finally {
      setLoading(false);
    }
  }

  // Generate PDF for Patient Registration
  Future<void> _generatePDF(
    String name,
    String executive,
    String payment,
    String phone,
    String address,
    double totalAmount,
    double discountAmount,
    double advanceAmount,
    double balanceAmount,
    String dateAndTime,
    List<int> male,
    List<int> female,
    List<int> treatments,
  ) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(
            children: [
              pw.Text('Patient Registration Details',
                  style: pw.TextStyle(fontSize: 24)),
              pw.SizedBox(height: 20),
              pw.Text('Name: $name'),
              pw.Text('Executive: $executive'),
              pw.Text('Payment: $payment'),
              pw.Text('Phone: $phone'),
              pw.Text('Address: $address'),
              pw.Text('Total Amount: ${formatAmount(totalAmount)}'),
              pw.Text('Discount Amount: ${formatAmount(discountAmount)}'),
              pw.Text('Advance Amount: ${formatAmount(advanceAmount)}'),
              pw.Text('Balance Amount: ${formatAmount(balanceAmount)}'),
              pw.Text('Date and Time: $dateAndTime'),
              pw.Text('Male Treatments: ${male.join(', ')}'),
              pw.Text('Female Treatments: ${female.join(', ')}'),
              pw.Text('Treatments: ${treatments.join(', ')}'),
            ],
          );
        },
      ),
    );

    final output = await getTemporaryDirectory();
    final file = File('${output.path}/patient_registration.pdf');

    await file.writeAsBytes(await pdf.save());
    log("PDF generated at: ${file.path}");
  }
}
