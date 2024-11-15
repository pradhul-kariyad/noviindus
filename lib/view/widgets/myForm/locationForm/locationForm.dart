// ignore_for_file: file_names, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noviindus/colors/colors.dart';

class LocationForm extends StatefulWidget {
  const LocationForm({super.key});

  @override
  _LocationFormState createState() => _LocationFormState();
}

class _LocationFormState extends State<LocationForm> {
  List<String> locations = [
    'Kannur',
    'Wayanad',
    'Kochi',
    'Kozhikode',
    'Alappuzha',
    'Idukki',
    'Kasaragod',
    'Kollam',
    'Kottayam',
    'Malappuram',
    'Palakkad',
    'Pathanamthitta',
    'Thiruvananthapuram',
    'Thrissur',
    ''
  ];
  String? selectedLocation;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              EdgeInsets.only(left: 20.w, right: 15.w, bottom: 3.h, top: 15.h),
          child: Text(
            'Location',
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
          child: DropdownButtonFormField<String>(
            value: selectedLocation,
            hint: Text(
              'Choose your location',
              style: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'Poppins',
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400),
            ),
            icon: Icon(
              Icons.keyboard_arrow_down_sharp,
              color: green,
              size: 28.sp,
            ),
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide(color: textBorderColor),
              ),
              border: OutlineInputBorder(
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
            items: locations.map((String location) {
              return DropdownMenuItem<String>(
                value: location,
                child: Text(location),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                selectedLocation = newValue;
              });
            },
          ),
        ),
      ],
    );
  }
}
