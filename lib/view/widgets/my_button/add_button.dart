// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noviindus/colors/colors.dart';

class AddButton extends StatelessWidget {
  final void Function()? onTap;
  const AddButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h),
      child: Center(
        child: InkWell(
          onTap: onTap,
          child: Container(
            width: 330.w,
            height: 43.h,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 203, 218, 245),
              borderRadius: BorderRadius.circular(14.sp),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  offset: Offset(3, 1),
                  blurRadius: 6,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: Center(
                child: Text(
              '+ Add Treatments',
              style: TextStyle(
                  fontSize: 12.sp,
                  color: black,
                  fontFamily: 'Poppinss',
                  fontWeight: FontWeight.bold),
            )),
          ),
        ),
      ),
    );
  }
}
