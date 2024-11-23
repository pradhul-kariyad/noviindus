// ignore_for_file: file_names
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:noviindus/pdf/my_pdf/save_and_open_document.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

class ImagePdfApi {
  static Future<File> generateImagePdfApi() async {
    final pdf = Document();
    final image1 =
        (await rootBundle.load('assets/images/novi1.png')).buffer.asUint8List();
    final image2 =
        (await rootBundle.load('assets/images/novi1.png')).buffer.asUint8List();
    final pageTheme = PageTheme(
      pageFormat: PdfPageFormat.a4,
      buildBackground: (context) {
        if (context.pageNumber == 2) {
          return FullPage(
              ignoreMargins: true,
              child: Image(MemoryImage(image1), fit: BoxFit.cover));
        } else {
          return Container();
        }
      },
    );
    pdf.addPage(MultiPage(
        pageTheme: pageTheme,
        build: (context) {
          return [
            Image(MemoryImage(image1)),
            Center(
                child: Image(MemoryImage(image2),
                    width: pageTheme.pageFormat.availableWidth / 2,
                    height: 500,
                    alignment: Alignment.center)),
            ClipRRect(
              verticalRadius: 32,
              horizontalRadius: 32,
              child: Image(MemoryImage(image1)),
            )
          ];
        }));
    return SaveAndOpenDocument.savePdf(name: 'table_pdf.pdf', pdf: pdf);
  }
}
