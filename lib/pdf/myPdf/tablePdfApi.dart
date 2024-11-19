// // ignore_for_file: file_names

// import 'dart:ffi';
// import 'dart:io';

// import 'package:noviindus/pdf/myPdf/saveAndOpenPdf.dart';
// import 'package:pdf/widgets.dart';

// class User {
//   final String name;
//   final Int age;

//   const User({
//     required this.name,
//     required this.age,
//   });
// }

// class TablePdfApi {
//   static Future<File> generateTablePdf() async {
//     final pdf = Document();
//     final headers = ['Name', 'Age'];
//     final users = [const User(name: 'name', age: 1)];

//     pdf.addPage(Page(build: (context) {
//       return TableHelper.fromTextArray(data: data, headers: headers);
//     }));
//     return SaveAndOpenDocument.savePdf(name: 'table pdf.pdf', pdf: pdf);
//   }
// }
