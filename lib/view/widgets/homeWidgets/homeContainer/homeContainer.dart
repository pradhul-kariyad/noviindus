// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noviindus/colors/colors.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: green,
      height: 300.h,
      child: ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.symmetric(vertical: 10.h),
        itemBuilder: (BuildContext context, int index) {
          return Center(
            child: Container(
              margin: EdgeInsets.only(left: 15.w, right: 15.w, bottom: 15.h),
              height: 130.h,
              width: 330.w,
              decoration: BoxDecoration(
                color: containerColor,
                borderRadius: BorderRadius.circular(10.sp),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(left: 20.w, top: 15.h, bottom: 2.h),
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
                          'Vikram Singh',
                          style: TextStyle(
                              color: black,
                              fontFamily: 'Poppins',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 40.w, bottom: 7.h),
                    child: Text(
                      'Couple Combo Package (Rejuven...',
                      style: TextStyle(
                          color: green,
                          fontFamily: 'Poppins',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 40.w, bottom: 4.h),
                    child: Row(
                      children: [
                        Image(
                          image: AssetImage('assets/images/uil_calender.png'),
                          width: 18.w,
                          height: 18.h,
                          color: red,
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(left: 5, top: 1.h, right: 20.w),
                          child: Text(
                            '31/01/2024',
                            style: TextStyle(
                                color: fontColor,
                                fontFamily: 'Poppins',
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Image(
                          image: AssetImage('assets/images/f7_person-2.png'),
                          width: 18.w,
                          height: 18.h,
                          color: red,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5, top: 1.h),
                          child: Text(
                            'Jithesh',
                            style: TextStyle(
                                color: fontColor,
                                fontFamily: 'Poppins',
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(color: textBorderColor),
                  Padding(
                    padding: EdgeInsets.only(left: 40.w, top: 3.h),
                    child: Row(
                      children: [
                        Text(
                          'View Booking details',
                          style: TextStyle(
                              color: black,
                              fontFamily: 'Poppins',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500),
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 18.sp,
                          color: green,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
