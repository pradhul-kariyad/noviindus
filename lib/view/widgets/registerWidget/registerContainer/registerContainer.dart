// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noviindus/colors/colors.dart';

class RegisterContainer extends StatefulWidget {
  final void Function()? clearTap;
  final void Function()? editTap;
  const RegisterContainer({
    super.key,
    this.clearTap,
    this.editTap,
  });

  @override
  State<RegisterContainer> createState() => _RegisterContainerState();
}

class _RegisterContainerState extends State<RegisterContainer> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.only(bottom: 13.h),
        width: 328.w,
        // height: 100.h,
        decoration: BoxDecoration(
          color: textFieldColor,
          borderRadius: BorderRadius.circular(10.sp),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20.w, top: 10.h, bottom: 2.h),
              child: Row(
                children: [
                  Text(
                    '1.',
                    style: TextStyle(
                        color: black,
                        fontFamily: 'Poppins',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 10.w),
                  Text(
                    'Couple Combo package i...',
                    style: TextStyle(
                        color: black,
                        fontFamily: 'Poppins',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 60.w,
                  ),
                  InkWell(
                    onTap: widget.clearTap,
                    child: Image(
                      image: AssetImage('assets/images/Vector (9).png'),
                      width: 22.w,
                      height: 22.h,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 38.w, top: 2.h),
              child: Row(
                children: [
                  Text(
                    'Male',
                    style: TextStyle(
                      color: green,
                      fontFamily: 'Poppins',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 6.w, right: 20.w),
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    height: 15.h,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1.w, color: textBorderColor),
                      borderRadius: BorderRadius.circular(3.sp),
                    ),
                    child: Text(
                      '287',
                      style: TextStyle(
                        color: green,
                        fontFamily: 'Poppins',
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Text(
                    'Female',
                    style: TextStyle(
                      color: green,
                      fontFamily: 'Poppins',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 6.w),
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    height: 15.h,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1.w, color: textBorderColor),
                      borderRadius: BorderRadius.circular(3.sp),
                    ),
                    child: Text(
                      '222',
                      style: TextStyle(
                        color: green,
                        fontFamily: 'Poppins',
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: widget.editTap,
                    child: Image(
                      image: AssetImage(
                          'assets/images/material-symbols_edit-outline.png'),
                      width: 22.w,
                      height: 22.h,
                      color: green,
                    ),
                  ),
                  SizedBox(
                    width: 9.w,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
