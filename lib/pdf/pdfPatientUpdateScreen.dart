// ignore_for_file: use_build_context_synchronously, file_names
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:noviindus/pdf/PdfHandler.dart';
import 'package:noviindus/pdf/pdfViewerScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PdfPatientUpdateScreen extends StatelessWidget {
  final String apiEndpoint = "https://flutter-amr.noviindus.in/api/GeneratePDF";

  const PdfPatientUpdateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Patient Update"),
        actions: [
          IconButton(
            icon: const Icon(Icons.picture_as_pdf),
            onPressed: () async {
              try {
                SharedPreferences pref = await SharedPreferences.getInstance();
                final token = pref.getString('token');

                if (token == null || token.isEmpty) {
                  throw Exception(
                      "Authentication token not found. Please log in again.");
                }

                final pdfFile =
                    await PdfHandler.fetchAndSavePdf(apiEndpoint, token);

                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return PdfViewerScreen(pdfFile: pdfFile);
                }));
              } catch (e) {
                String errorMessage = e is SocketException
                    ? "Network error. Please check your connection."
                    : e.toString();

                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Failed to load PDF: $errorMessage"),
                  backgroundColor: Colors.red,
                ));

                log("Failed to load PDF: $errorMessage");
              }
            },
          )
        ],
      ),
      body: const Center(
        child: Text(
          "Patient Update Screen",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
