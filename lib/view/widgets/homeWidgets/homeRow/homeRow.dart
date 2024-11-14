// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noviindus/colors/colors.dart';

class HomeRow extends StatelessWidget {
  const HomeRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 20.h, bottom: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Sort by :',
            style: TextStyle(
                color: myBlack,
                fontFamily: 'Poppins',
                fontSize: 13.sp,
                fontWeight: FontWeight.w500),
          ),
          Container(
            width: 150.w,
            height: 34.h,
            decoration: BoxDecoration(
              border: Border.all(width: 1.w, color: textBorderColor),
              // color: black,
              borderRadius: BorderRadius.circular(20.sp),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Date',
                    style: TextStyle(
                        color: myBlack,
                        fontFamily: 'Poppins',
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down_sharp,
                    color: green,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
