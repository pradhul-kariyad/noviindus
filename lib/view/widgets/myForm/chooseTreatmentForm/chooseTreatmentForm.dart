// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noviindus/colors/colors.dart';
import 'package:noviindus/models/treatmentListModel/treatmentListModel.dart';
import 'package:noviindus/provider/treatmentDataProvider/treatmentDataProvider.dart.dart';
import 'package:provider/provider.dart';

class ChooseTreatmentForm extends StatefulWidget {
  const ChooseTreatmentForm({super.key});

  @override
  _ChooseTreatmentFormState createState() => _ChooseTreatmentFormState();
}

class _ChooseTreatmentFormState extends State<ChooseTreatmentForm> {
  @override
  void initState() {
    super.initState();

    final treatmentProvider =
        Provider.of<TreatmentDataProvider>(context, listen: false);
    treatmentProvider.loadTreatmentsFromApi();
  }

  @override
  Widget build(BuildContext context) {
    final treatmentProvider = Provider.of<TreatmentDataProvider>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              EdgeInsets.only(left: 20.w, right: 15.w, bottom: 3.h, top: 15.h),
          child: Text(
            'Choose Treatment',
            style: TextStyle(
                color: myBlack,
                fontFamily: 'Poppins',
                fontSize: 12.sp,
                fontWeight: FontWeight.w500),
          ),
        ),
        treatmentProvider.isLoading
            ? Center(
                child: CircularProgressIndicator(
                  strokeAlign: -5,
                  color: green,
                ),
              )
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: SizedBox(
                  width: double.infinity, // Ensures it takes full width
                  child: DropdownButtonFormField<Treatments>(
                    value: treatmentProvider.selectedTreatment,
                    hint: Text(
                      'Choose preferred treatment',
                      style: TextStyle(
                          color: Colors.grey,
                          fontFamily: 'Poppins',
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400),
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
                    items: treatmentProvider.treatments
                        .map((Treatments treatment) {
                      return DropdownMenuItem<Treatments>(
                        value: treatment,
                        child: Text(treatment.name.toString()),
                      );
                    }).toList(),
                    onChanged: (Treatments? newTreatment) {
                      if (newTreatment != null) {
                        treatmentProvider.selectTreatment(newTreatment);
                      }
                    },
                  ),
                ),
              ),
      ],
    );
  }
}
