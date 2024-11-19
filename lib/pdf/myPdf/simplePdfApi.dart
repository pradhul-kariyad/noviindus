// ignore_for_file: file_names
import 'dart:io';
import 'package:noviindus/pdf/myPdf/saveAndOpenPdf.dart';
import 'package:pdf/widgets.dart';

class SimplePdfApi {
  static Future<File> generateSimpleTextPdf(String text, String text2) async {
    final pdf = Document();
    pdf.addPage(Page(build: (_) {
      return Center(
          child: Column(children: [
        Text(
          text,
          style: TextStyle(fontSize: 48),
        ),
        Text(
          text2,
          style: TextStyle(fontSize: 48),
        ),
      ]));
    }));
    return SaveAndOpenDocument.savePdf(name: 'simple_pgf', pdf: pdf);
  }
}
