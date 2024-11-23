// ignore_for_file: avoid_print, unused_import, file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noviindus/provider/patient_count_provider/patient_count_provider.dart';
import 'package:noviindus/provider/treatment_data_provider/treatment_data_provider.dart';
import 'package:noviindus/view/pages/register_page/register_page.dart';
import 'package:provider/provider.dart';
import 'package:noviindus/colors/colors.dart';
import 'package:noviindus/view/widgets/my_button/my_button.dart';

class EditGender extends StatefulWidget {
  const EditGender({super.key});

  @override
  State<EditGender> createState() => _EditGenderState();
}

class _EditGenderState extends State<EditGender> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<TreatmentDataProvider>(context, listen: false)
          .loadTreatmentsFromApi();
    });
  }

  @override
  Widget build(BuildContext context) {
    final TreatmentDataProvider treatmentProvider =
        Provider.of<TreatmentDataProvider>(context);
    final PatientCountProvider patientCountProvider =
        Provider.of<PatientCountProvider>(context);

    return Scaffold(
      backgroundColor: white.withOpacity(0.5),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 200.h),
          Center(
            child: Container(
              width: 290.w,
              height: 310.h,
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(12.sp),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 20.w,
                      right: 15.w,
                      bottom: 3.h,
                      top: 20.h,
                    ),
                    child: Text(
                      'Choose Treatment',
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
                    child: TextFormField(
                      readOnly: true,
                      onTap: () {
                        _showTreatmentSelector(context);
                      },
                      decoration: InputDecoration(
                        hintText: treatmentProvider.selectedTreatment?.name ??
                            'Choose preferred treatment',
                        hintStyle: TextStyle(
                          color: treatmentProvider.selectedTreatment != null
                              ? myBlack
                              : Colors.grey,
                          fontFamily: 'Poppins',
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: BorderSide(color: textBorderColor),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
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
                  Padding(
                    padding: EdgeInsets.only(
                        left: 20.w, right: 15.w, bottom: 3.h, top: 20.h),
                    child: Text(
                      'Add Patients',
                      style: TextStyle(
                          color: myBlack,
                          fontFamily: 'Poppins',
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  _buildCounterRow(
                    context,
                    title: 'Male',
                    count: patientCountProvider.maleCount,
                    onIncrement: patientCountProvider.incrementMale,
                    onDecrement: patientCountProvider.decrementMale,
                  ),
                  SizedBox(height: 10.h),
                  _buildCounterRow(
                    context,
                    title: 'Female',
                    count: patientCountProvider.femaleCount,
                    onIncrement: patientCountProvider.incrementFemale,
                    onDecrement: patientCountProvider.decrementFemale,
                  ),
                  SizedBox(height: 28.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: MyButton(
                      name: 'Save',
                      onTap: () {
                        final treatmentProvider =
                            Provider.of<TreatmentDataProvider>(context,
                                listen: false);
                        final selectedTreatment =
                            treatmentProvider.selectedTreatment;
                        if (selectedTreatment == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                backgroundColor: green,
                                content: Center(
                                  child: Text(
                                    'Please select a treatment',
                                    style: TextStyle(
                                        color: white,
                                        fontFamily: 'Poppins',
                                        fontSize: 12.sp),
                                  ),
                                )),
                          );
                          return;
                        }
                        if (treatmentProvider.selectedTreatment != null) {
                          Navigator.pop(context);
                          print(
                              'Selected Treatment: ${treatmentProvider.selectedTreatment?.name}');
                          print(
                              'Male Count: ${patientCountProvider.maleCount}');
                          print(
                              'Female Count: ${patientCountProvider.femaleCount}');
                        } else {
                          print('No treatment selected');
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCounterRow(
    BuildContext context, {
    required String title,
    required int count,
    required VoidCallback onIncrement,
    required VoidCallback onDecrement,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Row(
        children: [
          Container(
            width: 100.w,
            height: 40.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.sp),
                color: textFieldColor,
                border: Border.all(width: 1.w, color: textBorderColor)),
            child: Padding(
              padding: EdgeInsets.all(13.sp),
              child: Text(
                title,
                style: TextStyle(
                  color: myBlack,
                  fontFamily: 'Poppins',
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          SizedBox(width: 15.w),
          CircleAvatar(
            radius: 22.sp,
            backgroundColor: green,
            child: IconButton(
              icon: Icon(Icons.remove, color: white, size: 26.sp),
              onPressed: onDecrement,
            ),
          ),
          SizedBox(width: 5.w),
          Container(
            width: 45.w,
            height: 38.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.sp),
              color: white,
              border: Border.all(width: 1.w, color: textBorderColor),
            ),
            child: Center(
              child: Text(
                '$count',
                style: TextStyle(
                  color: myBlack,
                  fontFamily: 'Poppins',
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          SizedBox(width: 5.w),
          CircleAvatar(
            radius: 22.sp,
            backgroundColor: green,
            child: IconButton(
              icon: Icon(Icons.add, color: white, size: 26.sp),
              onPressed: onIncrement,
            ),
          ),
        ],
      ),
    );
  }

  void _showTreatmentSelector(BuildContext context) {
    final treatmentProvider =
        Provider.of<TreatmentDataProvider>(context, listen: false);

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.sp)),
      ),
      builder: (_) {
        return Consumer<TreatmentDataProvider>(
          builder: (context, value, _) {
            if (value.isLoading) {
              return Center(
                  child: CircularProgressIndicator(
                strokeAlign: -5,
                color: green,
              ));
            }
            if (value.treatments.isEmpty) {
              return Center(child: Text('No treatments available.'));
            }
            return ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
              itemCount: value.treatments.length,
              itemBuilder: (context, index) {
                final treatment = value.treatments[index];
                return ListTile(
                  title: Text(
                    treatment.name ?? 'Unnamed Treatment',
                    style: TextStyle(
                      color: myBlack,
                      fontFamily: 'Poppins',
                      fontSize: 14.sp,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    treatmentProvider.selectTreatment(treatment);
                  },
                );
              },
            );
          },
        );
      },
    );
  }
}
