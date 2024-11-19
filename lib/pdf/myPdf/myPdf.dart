// ignore_for_file: file_names, unused_import
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noviindus/auth/LoginOrRegister/LogIn.dart';
import 'package:noviindus/colors/colors.dart';
import 'package:noviindus/pdf/myPdf/imagePdfApi.dart';
import 'package:noviindus/pdf/myPdf/paragraphPdfApi.dart';
import 'package:noviindus/pdf/myPdf/saveAndOpenPdf.dart';
import 'package:noviindus/pdf/myPdf/simplePdfApi.dart';
import 'package:noviindus/pdf/myPdf/tablePdfApi.dart';

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
