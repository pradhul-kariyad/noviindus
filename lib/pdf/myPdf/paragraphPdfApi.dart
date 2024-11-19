import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noviindus/pdf/myPdf/saveAndOpenPdf.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

class PatientUpdatePdf {
  static Future<File> generateParagraphPdf() async {
    final pdf = Document();
    final image1 = (await rootBundle.load('assets/images/Layer_1-2.png'))
        .buffer
        .asUint8List();

    pdf.addPage(MultiPage(
      pageFormat: PdfPageFormat.a4,
      build: (context) => [
        // Header Section
     Stack(
  children: [
    // Image Positioned on the Left
    Align(
      alignment: Alignment.topLeft,
      child: SizedBox(
        width: 160.w, // Adjusted width for scaling
        height: 140.h, // Adjusted height for scaling
        child: Image(
          MemoryImage(image1),
          fit: BoxFit.cover,
        ),
      ),
    ),
    // Text Section Positioned on the Right
    Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: EdgeInsets.only(top: 10.sp, right: 10.sp), // Added padding for cleaner layout
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'KUMARAKOM',
              style: TextStyle(
                color: PdfColors.black,
                fontSize: 16.sp, // Slightly larger and scaled font size
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5.sp), // Increased spacing for readability
            Text(
              'Cheepunkal P.O. Kumarakom, Kottayam, Kerala - 686563',
              style: TextStyle(
                color: PdfColors.black,
                fontSize: 12.sp, // Consistent and responsive font size
              ),
            ),
            SizedBox(height: 5.sp),
            Text(
              'e-mail: unknown@gmail.com',
              style: TextStyle(
                color: PdfColors.black,
                fontSize: 12.sp, // Same font size for consistency
              ),
            ),
            SizedBox(height: 5.sp),
            Text(
              'Mob: +91 9876543210 | +91 9786543210',
              style: TextStyle(
                color: PdfColors.black,
                fontSize: 12.sp, 
              ),
            ),
            SizedBox(height: 5.sp),
            Text(
              'GST No: 32AABCU9603R1ZW',
              style: TextStyle(
                color: PdfColors.black,
                fontSize: 12.sp,
              ),
            ),
          ],
        ),
      ),
    ),
  ],
),


        SizedBox(height: 20.sp),

        // Patient Details Section
        Table(
          children: [
            _buildRow('Patient Details', '', isHeader: true),
            _buildRow('Date', '31/01/2024'),
            _buildRow('Time', '12:12pm'),
            _buildRow('Name', 'Salih T'),
            _buildRow('Address', 'Nadakkave, Kozhikkode'),
            _buildRow('WhatsApp Number', '+91 987654321'),
            _buildRow('Treatment Date', '21/02/2024'),
            _buildRow('Treatment Time', '11:00 am'),
          ],
          columnWidths: {0: FlexColumnWidth(2), 1: FlexColumnWidth(4)},
        ),
        SizedBox(height: 20.sp),

        // Treatment Details Section
        Table(
          border: TableBorder.all(width: 0.5, color: PdfColors.grey),
          children: [
            TableRow(
              children: [
                _tableHeader('Treatment'),
                _tableHeader('Price'),
                _tableHeader('Male'),
                _tableHeader('Female'),
                _tableHeader('Total'),
              ],
            ),
            _buildTreatmentRow(
              'Panchakarma',
              '₹230',
              '4',
              '4',
              '₹2,540',
            ),
            _buildTreatmentRow(
              'Njavara Kizhi Treatment',
              '₹230',
              '4',
              '4',
              '₹2,540',
            ),
            _buildTreatmentRow(
              'Panchakarma',
              '₹230',
              '4',
              '6',
              '₹2,540',
            ),
          ],
        ),
        SizedBox(height: 10.sp),

        // Summary Section
        Table(
          columnWidths: {0: FlexColumnWidth(4), 1: FlexColumnWidth(2)},
          children: [
            _buildRow('Total Amount', '₹7,620', isSummary: true),
            _buildRow('Discount', '₹500', isSummary: true),
            _buildRow('Advance', '₹1,200', isSummary: true),
            _buildRow('Balance', '₹5,920', isSummary: true),
          ],
        ),
        SizedBox(height: 20.sp),

        // Footer
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(10.sp),
          child: Column(
            children: [
              Text(
                'Thank you for choosing us',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5.sp),
              Text(
                'Your well-being is our commitment, and we\'re honored\nyou\'ve entrusted us with your health journey',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12.sp,
                ),
              ),
            ],
          ),
        ),
      ],
    ));

    return SaveAndOpenDocument.savePdf(name: 'Patient Details.pdf', pdf: pdf);
  }

  static TableRow _buildRow(String label, String value,
      {bool isHeader = false, bool isSummary = false}) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight:
                  isHeader || isSummary ? FontWeight.bold : FontWeight.normal,
              color: isHeader ? PdfColors.blue : PdfColors.black,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            value,
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight:
                  isHeader || isSummary ? FontWeight.bold : FontWeight.normal,
              color: isHeader ? PdfColors.blue : PdfColors.black,
            ),
          ),
        ),
      ],
    );
  }

  static TableRow _buildTreatmentRow(
    String treatment,
    String price,
    String male,
    String female,
    String total,
  ) {
    return TableRow(
      children: [
        _tableCell(treatment),
        _tableCell(price),
        _tableCell(male),
        _tableCell(female),
        _tableCell(total),
      ],
    );
  }

  static Widget _tableHeader(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.bold,
          color: PdfColors.white,
        ),
      ),
    );
  }

  static Widget _tableCell(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 12.sp,
        ),
      ),
    );
  }
}
