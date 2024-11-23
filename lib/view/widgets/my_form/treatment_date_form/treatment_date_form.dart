// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noviindus/colors/colors.dart';
import 'package:noviindus/provider/home_row_provider/home_row_provider.dart';
import 'package:provider/provider.dart';

class TreatmentDateForm extends StatelessWidget {
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  const TreatmentDateForm({super.key, this.validator, this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              EdgeInsets.only(left: 20.w, right: 15.w, bottom: 3.h, top: 15.h),
          child: Text(
            'Treatment Date',
            style: TextStyle(
              color: myBlack,
              fontFamily: 'Poppins',
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Consumer<DateProvider>(
            builder: (context, dateProvider, child) {
              return TextFormField(
                controller: controller,
                readOnly: true,
                onTap: () {
                  _selectDate(context);
                },
                decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.calendar_today_outlined,
                    color: green,
                    size: 15.sp,
                  ),
                  hintText: dateProvider.selectedDate.isEmpty
                      ? 'Select Date'
                      : dateProvider.selectedDate,
                  hintStyle: TextStyle(
                    color: dateProvider.selectedDate.isEmpty
                        ? Colors.grey
                        : myBlack,
                    fontFamily: 'Poppins',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide(color: textBorderColor),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide(color: textBorderColor),
                  ),
                  fillColor: textFieldColor,
                  filled: true,
                ),
                style: TextStyle(
                  color: myBlack,
                  fontFamily: 'Poppins',
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: green,
              onPrimary: white,
              onSurface: black,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: green,
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      String formattedDate =
          "${picked.day.toString().padLeft(2, '0')}/${picked.month.toString().padLeft(2, '0')}/${picked.year}";
      controller?.text = formattedDate;
    }
  }
}
