// ignore_for_file: file_names
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class PdfViewerScreen extends StatelessWidget {
  final File pdfFile;

  const PdfViewerScreen({super.key, required this.pdfFile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("View PDF"),
      ),
      body: PDFView(
        filePath: pdfFile.path,
        enableSwipe: true,
        swipeHorizontal: false,
        autoSpacing: true,
        pageSnap: true,
        fitPolicy: FitPolicy.BOTH,
        onError: (error) {
          debugPrint('Error displaying PDF: $error');
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Error displaying PDF: $error"),
            backgroundColor: Colors.red,
          ));
        },
        onPageChanged: (page, total) {
          debugPrint('Page $page of $total');
        },
      ),
    );
  }
}
