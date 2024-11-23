// ignore_for_file: unused_import
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noviindus/auth/login/login_screen.dart';
import 'package:noviindus/pdf/my_pdf/my_pdf.dart';
import 'package:noviindus/provider/login_provider/login_provider.dart';
import 'package:noviindus/provider/patient_provider/patient_data_provider.dart';
import 'package:noviindus/provider/branch_provider/branch_data_provider.dart';
import 'package:noviindus/provider/home_row_provider/home_row_provider.dart';
import 'package:noviindus/provider/patient_count_provider/patient_count_provider.dart';
import 'package:noviindus/provider/patient_update_provider/patient_update_provider.dart';
import 'package:noviindus/provider/payment_option_provider/payment_option_provider.dart';
import 'package:noviindus/provider/treatment_data_provider/treatment_data_provider.dart';
import 'package:noviindus/view/pages/home/home_page.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool userId = prefs.getBool('userId') ?? false;
  runApp(MyApp(
    userId: userId,
  ));
}

class MyApp extends StatelessWidget {
  final bool userId;
  const MyApp({super.key, required this.userId});

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
        ChangeNotifierProvider(create: (context) {
          return HomeRowProvider();
        }),
        ChangeNotifierProvider(create: (context) {
          return DateProvider();
        }),
        ChangeNotifierProvider(create: (context) {
          return PaymentOptionProvider();
        }),
        ChangeNotifierProvider(create: (context) {
          return BranchDataProvider();
        }),
        ChangeNotifierProvider(create: (context) {
          return TreatmentDataProvider();
        }),
        ChangeNotifierProvider(create: (context) {
          return PatientCountProvider();
        }),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
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
        child: userId ? HomePage() : LoginScreen(),
      ),
    );
  }
}
