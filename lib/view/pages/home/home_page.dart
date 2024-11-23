// ignore_for_file: file_names, unused_import, avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noviindus/colors/colors.dart';
import 'package:noviindus/provider/patient_provider/patient_data_provider.dart';
import 'package:noviindus/view/pages/register_page/register_page.dart';
import 'package:noviindus/view/widgets/home_widgets/home_container/home_container.dart';
import 'package:noviindus/view/widgets/home_widgets/home_row/home_row.dart';
import 'package:noviindus/view/widgets/my_button/my_button.dart';
import 'package:noviindus/view/widgets/my_icons/my_icons.dart';
import 'package:noviindus/view/widgets/search_form/search_form.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: MyIcons(
          backTap: () {
            print('Back button');
          },
          bellTap: () {
            print('Bell button');
          },
        ),
        backgroundColor: white,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Consumer<PatientListDataProvider>(
          builder: (BuildContext context, patientDataProvider, Widget? child) {
            return RefreshIndicator(
              color: green,
              backgroundColor: white,
              onRefresh: () async {
                await patientDataProvider.fetchPatientList();
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SearchForm(),
                  HomeRow(),
                  Divider(
                    color: textBorderColor,
                  ),
                  Stack(
                    children: [
                      SizedBox(
                        // color: green,
                        height: 418.h,
                        width: MediaQuery.of(context).size.width,
                        child: HomeContainer(),
                      ),
                      Positioned(
                        left: 15.w,
                        bottom: 0.h,
                        child: MyButton(
                            onTap: () {
                              print('Register Now');
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return RegisterPage();
                              }));
                            },
                            name: 'Register Now'),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
