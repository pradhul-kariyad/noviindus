// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noviindus/colors/colors.dart';
import 'package:noviindus/provider/PatientListProvider/PatientListDataProvider.dart';
import 'package:provider/provider.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PatientListDataProvider>(
      builder: (BuildContext context, patientDataProvider, Widget? child) {
        if (patientDataProvider.isLoading) {
          return Center(
              child: CircularProgressIndicator(
            color: green,
            strokeAlign: -5,
          ));
        }

        if (patientDataProvider.patientList.patient == null ||
            patientDataProvider.patientList.patient!.isEmpty) {
          return Center(child: Text("No patients available"));
        }

        return SizedBox(
          height: 300.h,
          child: ListView.builder(
            itemCount: patientDataProvider.patientList.patient!.length,
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.symmetric(vertical: 10.h),
            itemBuilder: (BuildContext context, int index) {
              final patient = patientDataProvider.patientList.patient![index];
              return Center(
                child: Container(
                  margin:
                      EdgeInsets.only(left: 15.w, right: 15.w, bottom: 15.h),
                  height: 130.h,
                  width: 330.w,
                  decoration: BoxDecoration(
                    color: containerColor,
                    borderRadius: BorderRadius.circular(10.sp),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.only(left: 20.w, top: 15.h, bottom: 2.h),
                        child: Row(
                          children: [
                            Text(
                              '${index + 1}.',
                              style: TextStyle(
                                color: black,
                                fontFamily: 'Poppins',
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 10.w),
                            Text(
                              patient.name?.isNotEmpty == true
                                  ? patient.name!
                                  : 'Unknown',
                              style: TextStyle(
                                color: black,
                                fontFamily: 'Poppins',
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 40.w, bottom: 7.h),
                        child: Text(
                          'Couple Combo Package (Rejuven...',
                          style: TextStyle(
                            color: green,
                            fontFamily: 'Poppins',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 40.w, bottom: 4.h),
                        child: Row(
                          children: [
                            Image(
                              image:
                                  AssetImage('assets/images/uil_calender.png'),
                              width: 18.w,
                              height: 18.h,
                              color: red,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 5,
                                top: 1.h,
                              ),
                              child: Text(
                                patient.dateNdTime ?? 'Date not available',
                                style: TextStyle(
                                  color: fontColor,
                                  fontFamily: 'Poppins',
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Image(
                              image:
                                  AssetImage('assets/images/f7_person-2.png'),
                              width: 18.w,
                              height: 18.h,
                              color: red,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 5, top: 1.h),
                              child: Text(
                                patient.phone ?? 'Unknown',
                                style: TextStyle(
                                  color: fontColor,
                                  fontFamily: 'Poppins',
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(color: textBorderColor),
                      Padding(
                        padding: EdgeInsets.only(left: 40.w, top: 3.h),
                        child: Row(
                          children: [
                            Text(
                              'View Booking details',
                              style: TextStyle(
                                color: black,
                                fontFamily: 'Poppins',
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Spacer(),
                            Icon(
                              Icons.arrow_forward_ios_outlined,
                              size: 18.sp,
                              color: green,
                            ),
                            SizedBox(
                              width: 16.w,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
