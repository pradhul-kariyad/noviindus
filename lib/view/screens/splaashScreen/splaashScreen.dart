// ignore_for_file: file_names, unused_import, use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noviindus/auth/LogIn/LogIn.dart';
import 'package:noviindus/main.dart';
import 'package:noviindus/view/pages/home/homePage.dart';

class SplaashScreen extends StatelessWidget {
  const SplaashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return const LogIn();
      }));
    });

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/novi1.png'), fit: BoxFit.cover),
        ),
      ),
    );
  }
}
