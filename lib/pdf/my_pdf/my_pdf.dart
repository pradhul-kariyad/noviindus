// ignore_for_file: file_names, unused_import
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noviindus/colors/colors.dart';
import 'package:noviindus/pdf/my_pdf/image_pdf_api.dart';
import 'package:noviindus/pdf/my_pdf/paragraph_pdf_api.dart';
import 'package:noviindus/pdf/my_pdf/save_and_open_document.dart';
import 'package:noviindus/pdf/my_pdf/simple_pdf_api.dart';
import 'package:noviindus/pdf/my_pdf/table_pdf_api.dart';

class Mypdf extends StatelessWidget {
  const Mypdf({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: blue,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 60.h,
            ),
            ElevatedButton(
                onPressed: () async {
                  final paragraph =
                      await PatientUpdatePdf.generateParagraphPdf();
                  SaveAndOpenDocument.openPdf(paragraph);
                },
                child: Text("Paragraph PDF")),
            SizedBox(
              height: 10.h,
            ),
            ElevatedButton(
                onPressed: () async {
                  final imagePdf = await ImagePdfApi.generateImagePdfApi();
                  SaveAndOpenDocument.openPdf(imagePdf);
                },
                child: Text("Image PDF")),
          ],
        ),
      ),
    );
  }
}
