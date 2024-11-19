// ignore_for_file: avoid_print, file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noviindus/colors/colors.dart';
import 'package:noviindus/provider/paymentOptionProvider/paymentOptionProvider.dart';
import 'package:provider/provider.dart';

class PaymentOptionRow extends StatelessWidget {
  const PaymentOptionRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 5.h, bottom: 2.h),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              context
                  .read<PaymentOptionProvider>()
                  .updateSelectedOption('Cash');
              print('Cash');
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
                backgroundColor:
                    context.watch<PaymentOptionProvider>().selectedOption ==
                            'Cash'
                        ? green
                        : white,
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
              context
                  .read<PaymentOptionProvider>()
                  .updateSelectedOption('Card');
              print('Card');
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
                backgroundColor:
                    context.watch<PaymentOptionProvider>().selectedOption ==
                            'Card'
                        ? green
                        : white,
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
              context.read<PaymentOptionProvider>().updateSelectedOption('UPI');
              print('UPI');
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
                backgroundColor:
                    context.watch<PaymentOptionProvider>().selectedOption ==
                            'UPI'
                        ? green
                        : white,
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
