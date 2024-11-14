// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noviindus/colors/colors.dart';

class SearchForm extends StatelessWidget {
  const SearchForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15.h, left: 15.w, right: 15.w),
      child: Row(
        children: [
          Stack(
            children: [
              SizedBox(
                // padding: EdgeInsets.symmetric(horizontal: 15.w),
                width: 230.w,
                child: TextFormField(
                  // validator: validator,
                  // obscureText: obscureText,
                  // controller: controller,
                  decoration: InputDecoration(
                    prefixIcon:
                        IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                    hintText: 'Search for treatments',
                    hintStyle: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'Poppins',
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w400),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.sp),
                        borderSide: BorderSide(color: textBorderColor)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: textBorderColor),
                        borderRadius: BorderRadius.circular(8.sp)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.sp),
                        borderSide: BorderSide(color: textBorderColor)),
                    fillColor: textFieldColor,
                    filled: true,
                  ),
                  style: TextStyle(
                      color: myBlack,
                      fontFamily: 'Poppins',
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Positioned(
                left: 10.w,
                top: 7.h,
                child: Container(
                  width: 30.w,
                  height: 30,
                  color: textFieldColor,
                  child: Image(
                    image: AssetImage('assets/images/circum_search.png'),
                    color: black,
                    width: 20.w,
                    height: 20.h,
                    // color: ,
                  ),
                ),
              ),
            ],
          ),
          InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.only(left: 10.w),
              width: 90.w,
              height: 39.h,
              decoration: BoxDecoration(
                color: green,
                borderRadius: BorderRadius.circular(8.sp),
              ),
              child: Center(
                child: Text(
                  'Search',
                  style: TextStyle(
                      color: white,
                      fontFamily: 'Poppins',
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
