// ignore_for_file: unused_import
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noviindus/auth/LoginOrRegister/LoginOrRegister.dart';
import 'package:noviindus/provider/PatientListProvider/PatientListDataProvider.dart';
import 'package:noviindus/provider/auth/loginProvider.dart';
import 'package:noviindus/provider/patientUpdateProvider/patientUpdateProvider.dart';
import 'package:noviindus/view/pages/home/homePage.dart';
import 'package:noviindus/view/pages/registerPage/registerPage.dart';
import 'package:noviindus/view/screens/splaashScreen/splaashScreen.dart';
import 'package:noviindus/view/widgets/editGender/editGender.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          return LoginProvider();
        }),
        ChangeNotifierProvider(create: (context) {
          return PatientListDataProvider();
        }),
        ChangeNotifierProvider(create: (context) {
          return PatientUpdateProvider();
        }),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        // splitScreenMode: true,
        builder: (BuildContext context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Machine-Test',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
            ),
            home: child,
          );
        },
        child: const LoginOrRegister(),
      ),
    );
  }
}
