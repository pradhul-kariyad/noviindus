// ignore_for_file: file_names, unused_import, avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noviindus/auth/LoginOrRegister/LoginOrRegister.dart';
import 'package:noviindus/colors/colors.dart';
import 'package:noviindus/view/widgets/homeWidgets/homeContainer/homeContainer.dart';
import 'package:noviindus/view/widgets/homeWidgets/homeRow/homeRow.dart';
import 'package:noviindus/view/widgets/myButton/myButton.dart';
import 'package:noviindus/view/widgets/myIcons/myIcons.dart';
import 'package:noviindus/view/widgets/searchForm/searchForm.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
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
                  child: MyButton(name: 'Register Now'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
