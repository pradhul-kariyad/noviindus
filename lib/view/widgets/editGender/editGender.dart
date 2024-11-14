// ignore_for_file: library_private_types_in_public_api, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noviindus/colors/colors.dart';
import 'package:noviindus/main.dart';
import 'package:noviindus/view/widgets/myButton/myButton.dart';
import 'package:noviindus/view/widgets/myForm/chooseTreatmentForm/chooseTreatmentForm.dart';

class EditGender extends StatefulWidget {
  const EditGender({super.key});

  @override
  _EditGenderState createState() => _EditGenderState();
}

class _EditGenderState extends State<EditGender> {
  int _maleCount = 0;
  int _femaleCount = 0;

  void _incrementMale() {
    setState(() {
      _maleCount++;
    });
  }

  void _decrementMale() {
    setState(() {
      if (_maleCount > 0) _maleCount--;
    });
  }

  void _incrementFemale() {
    setState(() {
      _femaleCount++;
    });
  }

  void _decrementFemale() {
    setState(() {
      if (_femaleCount > 0) _femaleCount--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: 210.h),
                child: Container(
                  width: 290.w,
                  height: 290.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.sp),
                    color: white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ChooseTreatmentForm(),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 20.w, right: 15.w, bottom: 3.h, top: 15.h),
                        child: Text(
                          'Add Patients',
                          style: TextStyle(
                              color: myBlack,
                              fontFamily: 'Poppins',
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      // Male Counter Row
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Container(
                                width: 110.w,
                                height: 39.h,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1.w, color: textBorderColor),
                                  color: textFieldColor,
                                  borderRadius: BorderRadius.circular(8.sp),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(top: 13, left: 10.w),
                                  child: Text(
                                    'Male',
                                    style: TextStyle(
                                        color: black,
                                        fontFamily: 'Poppins',
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 10.w),
                            InkWell(
                              onTap: _decrementMale,
                              child: CircleAvatar(
                                radius: 20.sp,
                                backgroundColor: green,
                                child: Icon(
                                  Icons.remove,
                                  color: white,
                                  size: 28.sp,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 5.w),
                              width: 50.w,
                              height: 39.h,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1.w, color: textBorderColor),
                                color: white,
                                borderRadius: BorderRadius.circular(8.sp),
                              ),
                              child: Center(
                                child: Text(
                                  '$_maleCount',
                                  style: TextStyle(
                                      color: black,
                                      fontFamily: 'Poppins',
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                            SizedBox(width: 5.w),
                            InkWell(
                              onTap: _incrementMale,
                              child: CircleAvatar(
                                radius: 20.sp,
                                backgroundColor: green,
                                child: Icon(
                                  Icons.add,
                                  color: white,
                                  size: 28.sp,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10.h),
                      // Female Counter Row
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Container(
                                width: 110.w,
                                height: 39.h,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1.w, color: textBorderColor),
                                  color: textFieldColor,
                                  borderRadius: BorderRadius.circular(8.sp),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(top: 13, left: 10.w),
                                  child: Text(
                                    'Female',
                                    style: TextStyle(
                                        color: black,
                                        fontFamily: 'Poppins',
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 10.w),
                            InkWell(
                              onTap: _decrementFemale,
                              child: CircleAvatar(
                                radius: 20.sp,
                                backgroundColor: green,
                                child: Icon(
                                  Icons.remove,
                                  color: white,
                                  size: 28.sp,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 5.w),
                              width: 50.w,
                              height: 39.h,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1.w, color: textBorderColor),
                                color: white,
                                borderRadius: BorderRadius.circular(8.sp),
                              ),
                              child: Center(
                                child: Text(
                                  '$_femaleCount',
                                  style: TextStyle(
                                      color: black,
                                      fontFamily: 'Poppins',
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                            SizedBox(width: 5.w),
                            InkWell(
                              onTap: _incrementFemale,
                              child: CircleAvatar(
                                radius: 20.sp,
                                backgroundColor: green,
                                child: Icon(
                                  Icons.add,
                                  color: white,
                                  size: 28.sp,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(left: 15.w, right: 15.w, top: 20.h),
                        child: MyButton(
                          name: 'Save',
                          onTap: () {
                            print("Save button");
                            // Return both male and female counts
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
