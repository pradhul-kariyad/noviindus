// ignore_for_file: avoid_print, no_leading_underscores_for_local_identifiers, file_names, unused_local_variable, curly_braces_in_flow_control_structures, unused_import, unnecessary_null_comparison
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noviindus/colors/colors.dart';
import 'package:noviindus/provider/branch_provider/branch_data_provider.dart';
import 'package:noviindus/provider/home_row_provider/home_row_provider.dart';
import 'package:noviindus/provider/patient_count_provider/patient_count_provider.dart';
import 'package:noviindus/provider/patient_update_provider/patient_update_provider.dart';
import 'package:noviindus/provider/payment_option_provider/payment_option_provider.dart';
import 'package:noviindus/provider/treatment_data_provider/treatment_data_provider.dart';
import 'package:noviindus/view/pages/home/home_page.dart';
import 'package:noviindus/view/widgets/edit_gender/edit_gender.dart';
import 'package:noviindus/view/widgets/register_widgets/payment_option_row/payment_option_row.dart';
import 'package:noviindus/view/widgets/my_form/location_form/location_form.dart';
import 'package:noviindus/view/widgets/my_button/add_button.dart';
import 'package:noviindus/view/widgets/my_button/my_button.dart';
import 'package:noviindus/view/widgets/my_form/treatment_date_form/treatment_date_form.dart';
import 'package:noviindus/view/widgets/my_form/address_form/address_form.dart';
import 'package:noviindus/view/widgets/my_form/advance_amount_form/advance_amount_form.dart';
import 'package:noviindus/view/widgets/my_form/balance_amount_form/balance_amount_form.dart';
import 'package:noviindus/view/widgets/my_form/branch_form/branch_form.dart';
import 'package:noviindus/view/widgets/my_form/discount_amount_form/discount_amount_form.dart';
import 'package:noviindus/view/widgets/my_form/total_amount_form/total_amount_form.dart';
import 'package:noviindus/view/widgets/my_form/treatment_time_form/treatment_time_form.dart';
import 'package:noviindus/view/widgets/my_icons/my_icons.dart';
import 'package:noviindus/view/widgets/my_form/name_form/name_form.dart';
import 'package:noviindus/view/widgets/my_form/whatsapp_form/whatsapp_form.dart';
import 'package:noviindus/view/widgets/register_widgets/register_container/register_container.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final _nameController = TextEditingController();
    final _whatsAppController = TextEditingController();
    final _addressController = TextEditingController();
    final _totalAmountController = TextEditingController();
    final _discountAmountController = TextEditingController();
    final _advanceAmountController = TextEditingController();
    final _balanceAmountController = TextEditingController();
    final _treatmentDateController = TextEditingController();
    final _treatmentTimeControllerOne = TextEditingController();
    final _treatmentTimeControllerTwo = TextEditingController();
    final _treatmentTimeController = TextEditingController();
    final branchProvider =
        Provider.of<BranchDataProvider>(context, listen: false);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      branchProvider.loadBranchesFromApi();
    });

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
                builder: (context) => const HomePage(),
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
              NameForm(
                controller: _nameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter your name';
                  }
                  return null;
                },
              ),
              WhatsAppForm(
                controller: _whatsAppController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter your whatsapp number';
                  }
                  return null;
                },
              ),
              AddressForm(
                  controller: _addressController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter your address';
                    }
                    return null;
                  }),
              LocationForm(validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Enter your location';
                }
                return null;
              }),
              BranchForm(
                  // controller: _branchController,
                  validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Enter your branch';
                }
                return null;
              }),
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
              Consumer<PatientCountProvider>(
                builder: (BuildContext context, patientCountProvider,
                    Widget? child) {
                  return RegisterContainer(
                    clearTap: () {
                      print('Clear button tapped');
                    },
                    editTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return EditGender();
                      }));
                    },
                    maleCount: patientCountProvider.maleCount,
                    femaleCount: patientCountProvider.femaleCount,
                  );
                },
              ),
              Consumer<PatientCountProvider>(
                builder: (BuildContext context,
                    PatientCountProvider patientCountProvider, Widget? child) {
                  return AddButton(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return EditGender();
                      }));
                      print('Add button tapped');
                    },
                  );
                },
              ),
              TotalAmountForm(
                  controller: _totalAmountController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter your total amount';
                    }
                    return null;
                  }),
              DiscountAmountForm(
                  controller: _discountAmountController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter your discount amount';
                    }
                    return null;
                  }),
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
              AdvanceAmountForm(
                  controller: _advanceAmountController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter your advance amount';
                    }
                    return null;
                  }),
              BalanceAmountForm(
                  controller: _balanceAmountController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter your balance amount';
                    }
                    return null;
                  }),
              TreatmentDateForm(
                controller: _treatmentDateController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter your treatment date';
                  }
                  return null;
                },
              ),
              TreatmentTimeForm(
                controllerOne: _treatmentTimeControllerOne,
                controllerTwo: _treatmentTimeControllerTwo,
                validatorOne: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter your hour';
                  }
                  return null;
                },
                validatorTwo: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter your minute';
                  }
                  return null;
                },
              ),
              SizedBox(height: 35.h),
              Consumer<PaymentOptionProvider>(
                builder: (BuildContext context, paymentOptionProvider,
                    Widget? child) {
                  final selectedPayment =
                      paymentOptionProvider.selectedOption.isEmpty
                          ? ''
                          : paymentOptionProvider.selectedOption;
                  return Consumer<PatientCountProvider>(
                    builder: (BuildContext context, patientCountProvider,
                        Widget? child) {
                      return Consumer<DateProvider>(
                        builder: (BuildContext context, dateProvider,
                            Widget? child) {
                          return Consumer<PatientUpdateProvider>(
                            builder: (BuildContext context,
                                patientUpdateProvider, Widget? child) {
                              final selectedDate = dateProvider.selectedDate;
                              return MyButton(
                                name: 'Save',
                                onTap: () {
                                  if (_formKey.currentState!.validate()) {
                                    _formKey.currentState!.save();
                                    print(
                                        "Date: ${_treatmentDateController.text}");
                                    print(
                                        "Hour: ${_treatmentTimeControllerOne.text}");
                                    print(
                                        "Minute: ${_treatmentTimeControllerTwo.text}");

                                    String dateAndTime =
                                        "${_treatmentDateController.text} ${_treatmentTimeControllerOne.text.padLeft(2, '0')}:${_treatmentTimeControllerTwo.text.padLeft(2, '0')}";

                                    final selectedBranch =
                                        branchProvider.selectedBranch;
                                    if (selectedBranch == null) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                            backgroundColor: green,
                                            content: Center(
                                              child: Text(
                                                'Please select a branch',
                                                style: TextStyle(
                                                    color: white,
                                                    fontFamily: 'Poppins',
                                                    fontSize: 12.sp),
                                              ),
                                            )),
                                      );
                                      return;
                                    }
                                    final treatmentProvider =
                                        Provider.of<TreatmentDataProvider>(
                                            context,
                                            listen: false);
                                    final selectedTreatment =
                                        treatmentProvider.selectedTreatment;
                                    if (selectedTreatment == null) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
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
                                    String selectedDate =
                                        _treatmentDateController.text;
                                    String selectedHour =
                                        _treatmentTimeControllerOne.text;
                                    String selectedMinute =
                                        _treatmentTimeControllerTwo.text;
                                    patientUpdateProvider.updatePatient(
                                      name: _nameController.text,
                                      executive: "Default Executive",
                                      payment: selectedPayment,
                                      phone: _whatsAppController.text,
                                      address: _addressController.text,
                                      totalAmount: _getIntValue(
                                          _totalAmountController.text),
                                      discountAmount: _getIntValue(
                                          _discountAmountController.text),
                                      advanceAmount: _getIntValue(
                                          _advanceAmountController.text),
                                      balanceAmount: _getIntValue(
                                          _balanceAmountController.text),
                                      dateAndTime: dateAndTime,
                                      id: "",
                                      male: [patientCountProvider.maleCount],
                                      female: [
                                        patientCountProvider.femaleCount
                                      ],
                                      branch: selectedBranch.id.toString(),
                                      treatments: selectedTreatment != null
                                          ? [selectedTreatment.id ?? 0]
                                          : [],
                                      context: context,
                                    );
                                  }
                                },
                              );
                            },
                          );
                        },
                      );
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

double _getIntValue(String value) {
  double parsedValue = double.tryParse(value.trim()) ?? 0;
  return parsedValue == parsedValue.toInt()
      ? parsedValue.toInt().toDouble()
      : parsedValue;
}
