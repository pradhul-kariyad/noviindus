// ignore_for_file: avoid_print, library_private_types_in_public_api, file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noviindus/colors/colors.dart';

class PaymentOptionRow extends StatefulWidget {
  const PaymentOptionRow({super.key});

  @override
  _PaymentOptionRowState createState() => _PaymentOptionRowState();
}

class _PaymentOptionRowState extends State<PaymentOptionRow> {
  String selectedOption = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 5.h, bottom: 2.h),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                selectedOption = 'Cash';
                print('Cash');
              });
            },
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: textBorderColor,
                  width: 1.0,
                ),
              ),
              child: CircleAvatar(
                radius: 10.sp,
                backgroundColor: selectedOption == 'Cash' ? green : white,
              ),
            ),
          ),
          SizedBox(width: 5.w),
          Text(
            'Cash',
            style: TextStyle(
              color: black,
              fontFamily: 'Poppins',
              fontSize: 13.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(width: 70.w),
          InkWell(
            onTap: () {
              setState(() {
                print('Card');
                selectedOption = 'Card';
              });
            },
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: textBorderColor,
                  width: 1.0,
                ),
              ),
              child: CircleAvatar(
                radius: 10.sp,
                backgroundColor: selectedOption == 'Card' ? green : white,
              ),
            ),
          ),
          SizedBox(width: 5.w),
          Text(
            'Card',
            style: TextStyle(
              color: black,
              fontFamily: 'Poppins',
              fontSize: 13.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(width: 80.w),
          InkWell(
            onTap: () {
              setState(() {
                selectedOption = 'UPI';
                print('UPI');
              });
            },
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: textBorderColor,
                  width: 1.0,
                ),
              ),
              child: CircleAvatar(
                radius: 10.sp,
                backgroundColor: selectedOption == 'UPI' ? green : white,
              ),
            ),
          ),
          SizedBox(width: 5.w),
          Text(
            'UPI',
            style: TextStyle(
              color: black,
              fontFamily: 'Poppins',
              fontSize: 13.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
