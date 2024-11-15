// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noviindus/colors/colors.dart';

class TreatmentTimeForm extends StatelessWidget {
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  const TreatmentTimeForm({super.key, this.validator, this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              EdgeInsets.only(left: 20.w, right: 15.w, bottom: 3.h, top: 15.h),
          child: Text(
            'Treatment Time',
            style: TextStyle(
                color: myBlack,
                fontFamily: 'Poppins',
                fontSize: 12.sp,
                fontWeight: FontWeight.w500),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(right: 5.w),
                  child: TextFormField(
                    validator: validator,
                    // obscureText: obscureText,
                    controller: controller,
                    decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.keyboard_arrow_down_sharp,
                        color: green,
                        size: 28.sp,
                      ),
                      hintText: 'Hour',
                      hintStyle: TextStyle(
                          color: Colors.grey,
                          fontFamily: 'Poppins',
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: BorderSide(color: textBorderColor)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: textBorderColor),
                          borderRadius: BorderRadius.circular(14)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: BorderSide(color: textBorderColor)),
                      fillColor: textFieldColor,
                      filled: true,
                    ),
                    style: TextStyle(
                        color: myBlack,
                        fontFamily: 'Poppins',
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 5.w),
                  child: TextFormField(
                    // validator: validator,
                    // obscureText: obscureText,
                    // controller: controller,
                    decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.keyboard_arrow_down_sharp,
                        color: green,
                        size: 28.sp,
                      ),
                      hintText: 'Minutes',
                      hintStyle: TextStyle(
                          color: Colors.grey,
                          fontFamily: 'Poppins',
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: BorderSide(color: textBorderColor)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: textBorderColor),
                          borderRadius: BorderRadius.circular(14)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: BorderSide(color: textBorderColor)),
                      fillColor: textFieldColor,
                      filled: true,
                    ),
                    style: TextStyle(
                        color: myBlack,
                        fontFamily: 'Poppins',
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
