// ignore_for_file: file_names

import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class PdfHandler {
  // Fetch PDF and save it locally
  static Future<File> fetchAndSavePdf(String url, String token) async {
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {'Authorization': 'Bearer $token'},
      ).timeout(const Duration(seconds: 10)); // Add timeout

      if (response.statusCode == 200) {
        final bytes = response.bodyBytes;
        final tempDir = await getTemporaryDirectory();
        final pdfFile = File('${tempDir.path}/generated.pdf');
        await pdfFile.writeAsBytes(bytes);
        return pdfFile;
      } else {
        // Log and throw error for non-200 status codes
        throw Exception(
            'Failed to fetch PDF. Status Code: ${response.statusCode}, Body: ${response.body}');
      }
    } on SocketException {
      throw Exception('Network error. Please check your connection.');
    } on TimeoutException {
      throw Exception('Request timed out. Please try again later.');
    } catch (e) {
      throw Exception('An unexpected error occurred: $e');
    }
  }
}
