// ignore_for_file: file_names, avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noviindus/colors/colors.dart';
import 'package:noviindus/view/pages/registerPage/paymentOptionRow/paymentOptionRow.dart';
import 'package:noviindus/view/widgets/editGender/editGender.dart';
import 'package:noviindus/view/widgets/myButton/addButton.dart';
import 'package:noviindus/view/widgets/myButton/myButton.dart';
import 'package:noviindus/view/widgets/myForm/treatmentDateForm/treatmentDateForm.dart';
import 'package:noviindus/view/widgets/myForm/addressForm/addressForm.dart';
import 'package:noviindus/view/widgets/myForm/advanceAmountForm/advanceAmountForm.dart';
import 'package:noviindus/view/widgets/myForm/balanceAmountForm/balanceAmountForm.dart';
import 'package:noviindus/view/widgets/myForm/branchForm/branchForm.dart';
import 'package:noviindus/view/widgets/myForm/discountAmountForm/discountAmountForm.dart';
import 'package:noviindus/view/widgets/myForm/locationForm/locationForm.dart';
import 'package:noviindus/view/widgets/myForm/totalAmountForm/totalAmountForm.dart';
import 'package:noviindus/view/widgets/myForm/treatmentTimeForm/treatmentTimeForm.dart';
import 'package:noviindus/view/widgets/myIcons/myIcons.dart';
import 'package:noviindus/view/widgets/myForm/nameForm/nameForm.dart';
import 'package:noviindus/view/widgets/myForm/whatsAppForm/whatsAppForm.dart';
import 'package:noviindus/view/widgets/registerWidget/registerContainer/registerContainer.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        title: MyIcons(
          backTap: () {
            print('Back button');
          },
          bellTap: () {
            print('Bell button');
          },
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 2.h, left: 28.w, bottom: 5.h),
              child: Text(
                'Register',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: myBlack,
                    fontFamily: 'Poppins',
                    fontSize: 20.sp),
              ),
            ),
            Divider(),
            NameForm(),
            WhatsAppForm(),
            AddressForm(),
            LocationForm(),
            BranchForm(),
            Padding(
              padding: EdgeInsets.only(
                  left: 20.w, right: 15.w, bottom: 3.h, top: 15.h),
              child: Text(
                'Treatments',
                style: TextStyle(
                    color: myBlack,
                    fontFamily: 'Poppins',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500),
              ),
            ),
            RegisterContainer(
              clearTap: () {
                print('Clear button');
              },
              editTap: () {
                print('Edit button');
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return EditGender();
                }));
              },
            ),
            AddButton(
              onTap: () {
                print('Add button');
              },
            ),
            TotalAmountForm(),
            DiscountAmountForm(),
            Padding(
              padding: EdgeInsets.only(
                  left: 20.w, right: 15.w, bottom: 3.h, top: 15.h),
              child: Text(
                'Payment Option',
                style: TextStyle(
                    color: myBlack,
                    fontFamily: 'Poppins',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500),
              ),
            ),
            PaymentOptionRow(),
            AdvanceAmountForm(),
            BalanceAmountForm(),
            TreatmentDateForm(),
            TreatmentTimeForm(),
            SizedBox(
              height: 35.h,
            ),
            MyButton(
              name: 'Save',
              onTap: () {
                print('Save button');
              },
            ),
            SizedBox(
              height: 35.h,
            ),
          ],
        ),
      ),
    );
  }
}
