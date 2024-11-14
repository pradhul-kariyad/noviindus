// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyIcons extends StatelessWidget {
  final void Function()? backTap;
  final void Function()? bellTap;

  const MyIcons({super.key, this.backTap, this.bellTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: backTap,
          child: Image(
            image: AssetImage('assets/images/majesticons_arrow-left.png'),
            // color: black,
            width: 28.w,
            height: 28.h,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 5.h),
          child: InkWell(
            onTap: bellTap,
            child: Image(
              image: AssetImage('assets/images/clarity_bell-line.png'),
              // color: black,
              width: 22.w,
              height: 22.h,
            ),
          ),
        ),
      ],
    );
  }
}
