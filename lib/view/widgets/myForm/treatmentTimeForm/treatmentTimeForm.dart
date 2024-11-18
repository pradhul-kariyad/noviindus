// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noviindus/colors/colors.dart';

class TreatmentTimeForm extends StatelessWidget {
  final String? Function(String?)? validatorOne;
  final String? Function(String?)? validatorTwo;
  final TextEditingController? controllerOne;
  final TextEditingController? controllerTwo;

  const TreatmentTimeForm(
      {super.key,
      this.validatorOne,
      this.controllerOne,
      this.validatorTwo,
      this.controllerTwo});

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
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(right: 5.w),
                  child: DropdownButtonFormField<String>(
                    icon: Icon(
                      Icons.keyboard_arrow_down_sharp,
                      color: green,
                      size: 10.sp,
                    ),
                    validator: validatorOne,
                    decoration: InputDecoration(
                      hintText: 'Hour',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'Poppins',
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      alignLabelWithHint: true,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide(color: textBorderColor),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: textBorderColor),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide(color: textBorderColor),
                      ),
                      fillColor: textFieldColor,
                      filled: true,
                    ),
                    items: List.generate(24, (index) {
                      return DropdownMenuItem<String>(
                        value: index.toString(),
                        child: Text(
                          index.toString().padLeft(2, '0'),
                          style: TextStyle(
                            color: myBlack,
                            fontFamily: 'Poppins',
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      );
                    }),
                    onChanged: (value) {
                      controllerOne?.text = value ?? '';
                    },
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 5.w),
                  child: DropdownButtonFormField<String>(
                    icon: Icon(
                      Icons.keyboard_arrow_down_sharp,
                      color: green,
                      size: 10.sp,
                    ),
                    validator: validatorTwo,
                    decoration: InputDecoration(
                      hintText: 'Minutes',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'Poppins',
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      alignLabelWithHint: true,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide(color: textBorderColor),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: textBorderColor),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide(color: textBorderColor),
                      ),
                      fillColor: textFieldColor,
                      filled: true,
                    ),
                    items: List.generate(60, (index) {
                      return DropdownMenuItem<String>(
                        value: index.toString(),
                        child: Text(
                          index.toString().padLeft(2, '0'),
                          style: TextStyle(
                            color: myBlack,
                            fontFamily: 'Poppins',
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      );
                    }),
                    onChanged: (value) {
                      controllerTwo?.text = value ?? '';
                    },
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
