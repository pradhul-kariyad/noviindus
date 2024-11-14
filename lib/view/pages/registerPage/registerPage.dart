// ignore_for_file: file_names, avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noviindus/colors/colors.dart';
import 'package:noviindus/view/widgets/myForm/addressForm/addressForm.dart';
import 'package:noviindus/view/widgets/myForm/branchForm/branchForm.dart';
import 'package:noviindus/view/widgets/myForm/locationForm/locationForm.dart';
import 'package:noviindus/view/widgets/myIcons/myIcons.dart';
import 'package:noviindus/view/widgets/myForm/nameForm/nameForm.dart';
import 'package:noviindus/view/widgets/myForm/whatsAppForm/whatsAppForm.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        title: MyIcons(
          backTap: () {
            print('Back button');
          },
          bellTap: () {
            print('Bell button');
          },
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 2.h, left: 28.w, bottom: 5.h),
              child: Text(
                'Register',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: myBlack,
                    fontFamily: 'Poppins',
                    fontSize: 20.sp),
              ),
            ),
            Divider(),
            NameForm(),
            WhatsAppForm(),
            AddressForm(),
            LocationForm(),
            BranchForm(),
            Padding(
              padding: EdgeInsets.only(
                  left: 20.w, right: 15.w, bottom: 3.h, top: 15.h),
              child: Text(
                'Treatments',
                style: TextStyle(
                    color: myBlack,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin:
                      EdgeInsets.only(left: 15.w, right: 15.w, bottom: 15.h),
                  height: 100.h,
                  width: 330.w,
                  decoration: BoxDecoration(
                    color: containerColor,
                    borderRadius: BorderRadius.circular(10.sp),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.w, bottom: 2.h),
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
                          'Couple Combo package i..',
                          style: TextStyle(
                              color: black,
                              fontFamily: 'Poppins',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
