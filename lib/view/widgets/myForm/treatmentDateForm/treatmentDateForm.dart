// ignore_for_file: library_private_types_in_public_api, file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noviindus/colors/colors.dart';

class TreatmentDateForm extends StatefulWidget {
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  const TreatmentDateForm({super.key, this.validator, this.controller});

  @override
  _TreatmentDateFormState createState() => _TreatmentDateFormState();
}

class _TreatmentDateFormState extends State<TreatmentDateForm> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();

    _controller = widget.controller ?? TextEditingController();
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        _controller.text = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

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
          child: TextFormField(
            controller: _controller,
            readOnly: true, // Prevent manual typing.
            onTap: () => _selectDate(context),
            decoration: InputDecoration(
              suffixIcon: Icon(
                Icons.calendar_today_outlined,
                color: green,
                size: 15.sp,
              ),
              hintText: 'Select Date',
              hintStyle: TextStyle(
                color: Colors.grey,
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
          ),
        ),
      ],
    );
  }
}
