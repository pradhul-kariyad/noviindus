// ignore_for_file: file_names, unused_import, avoid_print, no_leading_underscores_for_local_identifiers
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noviindus/colors/colors.dart';
import 'package:noviindus/main.dart';
import 'package:noviindus/provider/auth/loginProvider.dart';
import 'package:noviindus/view/pages/home/homePage.dart';
import 'package:noviindus/view/widgets/myForm/emailForm/emailForm.dart';
import 'package:noviindus/view/widgets/myButton/myButton.dart';
import 'package:noviindus/view/widgets/myForm/passwordForm/passwordForm.dart';
import 'package:provider/provider.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 168.h,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          'assets/images/logo_make_11_06_2023_115 1.png'),
                      fit: BoxFit.cover),
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: 30.h),
                  child: Image(
                    image: AssetImage('assets/images/Layer_1-2.png'),
                    width: 50.w,
                    height: 50.h,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.h, left: 15.w),
                child: Text(
                  'Login Or Register To Book\nYour Appointments',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: myBlack,
                      fontFamily: 'Poppins',
                      fontSize: 20.sp),
                ),
              ),
              EmailForm(
                controller: _emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  // String pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
                  // RegExp regExp = RegExp(pattern);
                  // if (!regExp.hasMatch(value)) {
                  //   return 'Enter a valid email';
                  // }
                  return null;
                },
              ),
              PasswordForm(
                controller: _passwordController,
                validator: (value) {
                  return value!.length < 6
                      ? 'Must be at least 6 character'
                      : null;
                },
                // onSaved: (value) {},
              ),
              SizedBox(
                height: 70.h,
              ),
              Consumer<LoginProvider>(
                builder: (BuildContext context, logInProvider, Widget? child) {
                  if (logInProvider.isLoading) {
                    return Center(
                        child: CircularProgressIndicator(
                      color: green,
                      strokeAlign: -4,
                    ));
                  }
                  return MyButton(
                    name: 'Login',
                    onTap: () {
                      print('LogIn');
                      if (_formKey.currentState!.validate()) {
                        logInProvider.logIn(_emailController.text.trim(),
                            _passwordController.text.trim(), context);
                      }
                    },
                  );
                },
              ),
              SizedBox(
                height: 90.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'By creating or logging into an account you are agreeing',
                    style: TextStyle(
                        color: black,
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w300,
                        fontFamily: 'Poppins'),
                  ),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'with our',
                    style: TextStyle(
                        color: black,
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w300,
                        fontFamily: 'Poppins'),
                  ),
                  SizedBox(
                    width: 3.w,
                  ),
                  Text(
                    'Terms and Conditions',
                    style: TextStyle(
                        color: blue,
                        fontSize: 11.sp,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins'),
                  ),
                  SizedBox(
                    width: 3.w,
                  ),
                  Text(
                    'and',
                    style: TextStyle(
                        color: black,
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w300,
                        fontFamily: 'Poppins'),
                  ),
                  SizedBox(
                    width: 3.w,
                  ),
                  Text(
                    'Privacy Policy.',
                    style: TextStyle(
                        color: blue,
                        fontSize: 11.sp,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
