// ignore_for_file: avoid_print, no_leading_underscores_for_local_identifiers, file_names
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noviindus/colors/colors.dart';
import 'package:noviindus/provider/patientUpdateProvider/patientUpdateProvider.dart';
import 'package:noviindus/view/pages/home/homePage.dart';
import 'package:noviindus/view/pages/registerPage/paymentOptionRow/paymentOptionRow.dart';
import 'package:noviindus/view/widgets/editGender/editGender.dart';
import 'package:noviindus/view/widgets/myForm/locationForm/locationForm.dart';
import 'package:noviindus/view/widgets/myButton/addButton.dart';
import 'package:noviindus/view/widgets/myButton/myButton.dart';
import 'package:noviindus/view/widgets/myForm/treatmentDateForm/treatmentDateForm.dart';
import 'package:noviindus/view/widgets/myForm/addressForm/addressForm.dart';
import 'package:noviindus/view/widgets/myForm/advanceAmountForm/advanceAmountForm.dart';
import 'package:noviindus/view/widgets/myForm/balanceAmountForm/balanceAmountForm.dart';
import 'package:noviindus/view/widgets/myForm/branchForm/branchForm.dart';
import 'package:noviindus/view/widgets/myForm/discountAmountForm/discountAmountForm.dart';
import 'package:noviindus/view/widgets/myForm/totalAmountForm/totalAmountForm.dart';
import 'package:noviindus/view/widgets/myForm/treatmentTimeForm/treatmentTimeForm.dart';
import 'package:noviindus/view/widgets/myIcons/myIcons.dart';
import 'package:noviindus/view/widgets/myForm/nameForm/nameForm.dart';
import 'package:noviindus/view/widgets/myForm/whatsAppForm/whatsAppForm.dart';
import 'package:noviindus/view/widgets/registerWidget/registerContainer/registerContainer.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final _nameController = TextEditingController();
    final _whatsAppController = TextEditingController();
    final _addressController = TextEditingController();
    final _branchController = TextEditingController();
    final _totalAmountController = TextEditingController();
    final _discountAmountController = TextEditingController();
    final _advanceAmountController = TextEditingController();
    final _balanceAmountController = TextEditingController();
    final _treatmentDateController = TextEditingController();
    final _treatmentTimeController = TextEditingController();

    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: white,
        title: MyIcons(
          backTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ),
            );
          },
          bellTap: () {
            print('Bell button tapped');
          },
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Form(
          key: _formKey,
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
                    fontSize: 20.sp,
                  ),
                ),
              ),
              const Divider(),
              NameForm(controller: _nameController),
              WhatsAppForm(controller: _whatsAppController),
              AddressForm(controller: _addressController),
              LocationForm(),
              BranchForm(controller: _branchController),
              Padding(
                padding: EdgeInsets.only(
                    left: 20.w, right: 15.w, bottom: 3.h, top: 15.h),
                child: Text(
                  'Treatments',
                  style: TextStyle(
                    color: myBlack,
                    fontFamily: 'Poppins',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              RegisterContainer(
                clearTap: () {
                  print('Clear button tapped');
                },
                editTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditGender(),
                    ),
                  );
                },
              ),
              AddButton(
                onTap: () {
                  print('Add button tapped');
                },
              ),
              TotalAmountForm(controller: _totalAmountController),
              DiscountAmountForm(controller: _discountAmountController),
              Padding(
                padding: EdgeInsets.only(
                    left: 20.w, right: 15.w, bottom: 3.h, top: 15.h),
                child: Text(
                  'Payment Option',
                  style: TextStyle(
                    color: myBlack,
                    fontFamily: 'Poppins',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              PaymentOptionRow(),
              AdvanceAmountForm(controller: _advanceAmountController),
              BalanceAmountForm(controller: _balanceAmountController),
              TreatmentDateForm(controller: _treatmentDateController),
              TreatmentTimeForm(controller: _treatmentTimeController),
              SizedBox(height: 35.h),
              Consumer<PatientUpdateProvider>(
                builder: (BuildContext context, patientUpdateProvider,
                    Widget? child) {
                  return MyButton(
                    name: 'Save',
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        patientUpdateProvider.updatePatient(
                          name: _nameController.text,
                          executive: "Default Executive",
                          payment: "Cash",
                          phone: _whatsAppController.text,
                          address: _addressController.text,
                          totalAmount: double.tryParse(
                                  _totalAmountController.text.trim()) ??
                              0.0,
                          discountAmount: double.tryParse(
                                  _discountAmountController.text.trim()) ??
                              0.0,
                          advanceAmount: double.tryParse(
                                  _advanceAmountController.text.trim()) ??
                              0.0,
                          balanceAmount: double.tryParse(
                                  _balanceAmountController.text.trim()) ??
                              0.0,
                          dateAndTime: _treatmentDateController.text,
                          id: "",
                          male: [1, 2, 3],
                          female: [4, 5, 6],
                          branch: _branchController.text,
                          treatments: [1, 2],
                          context: context,
                        );
                      }
                    },
                  );
                },
              ),
              SizedBox(height: 35.h),
            ],
          ),
        ),
      ),
    );
  }
}
