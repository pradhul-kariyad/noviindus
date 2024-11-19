// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noviindus/colors/colors.dart';

class MyButton extends StatelessWidget {
  final void Function()? onTap;
  final String name;
  const MyButton({super.key, this.onTap, required this.name});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: 330.w,
          height: 43.h,
          decoration: BoxDecoration(
            color: green,
            borderRadius: BorderRadius.circular(14.sp),
          ),
          child: Center(
              child: Text(
            name,
            style: TextStyle(
                fontSize: 12.sp,
                color: white,
                fontFamily: 'Poppinss',
                fontWeight: FontWeight.bold),
          )),
        ),
      ),
    );
  }
}
