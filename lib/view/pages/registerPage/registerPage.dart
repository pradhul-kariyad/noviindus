// ignore_for_file: avoid_print, no_leading_underscores_for_local_identifiers, file_names, unused_local_variable, curly_braces_in_flow_control_structures, unused_import, unnecessary_null_comparison
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noviindus/colors/colors.dart';
import 'package:noviindus/provider/branchListProvider/branchListDataProvider.dart';
import 'package:noviindus/provider/homeRowProvider/homeRowProvider.dart';
import 'package:noviindus/provider/patientCountProvider/patientCountProvider.dart';
import 'package:noviindus/provider/patientUpdateProvider/patientUpdateProvider.dart';
import 'package:noviindus/provider/treatmentDataProvider/treatmentDataProvider.dart.dart';
import 'package:noviindus/view/pages/home/homePage.dart';
import 'package:noviindus/view/widgets/myForm/chooseTreatmentForm/chooseTreatmentForm.dart';
import 'package:noviindus/view/widgets/registerWidgets/paymentOptionRow/paymentOptionRow.dart';
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
import 'package:noviindus/view/widgets/registerWidgets/registerContainer/registerContainer.dart';
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
    final TextEditingController _treatmentDateController =
        TextEditingController();
    final TextEditingController _treatmentTimeControllerOne =
        TextEditingController();
    final TextEditingController _treatmentTimeControllerTwo =
        TextEditingController();
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
                      showImagePickerOption(
                        context,
                        incrementMale: () {
                          patientCountProvider.incrementMale();
                        },
                        decrementMale: () {
                          patientCountProvider.decrementMale();
                        },
                        incrementFemale: () {
                          patientCountProvider.incrementFemale();
                        },
                        decrementFemale: () {
                          patientCountProvider.decrementFemale();
                        },
                        onSave: (maleCount, femaleCount) {
                          patientCountProvider.updateCounts(
                              maleCount, femaleCount);
                        },
                        maleCount: patientCountProvider.maleCount,
                        femaleCount: patientCountProvider.femaleCount,
                      );
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
                      showImagePickerOption(
                        context,
                        maleCount: patientCountProvider.maleCount,
                        femaleCount: patientCountProvider.femaleCount,
                        incrementMale: () {
                          patientCountProvider.incrementMale();
                        },
                        decrementMale: () {
                          patientCountProvider.decrementMale();
                        },
                        incrementFemale: () {
                          patientCountProvider.incrementFemale();
                        },
                        decrementFemale: () {
                          patientCountProvider.decrementFemale();
                        },
                        onSave: (maleCount, femaleCount) {
                          patientCountProvider.updateCounts(
                              maleCount, femaleCount);
                        },
                      );
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
              Consumer<PatientCountProvider>(
                builder: (BuildContext context, patientCountProvider,
                    Widget? child) {
                  return Consumer<DateProvider>(
                    builder:
                        (BuildContext context, dateProvider, Widget? child) {
                      return Consumer<PatientUpdateProvider>(
                        builder: (BuildContext context, patientUpdateProvider,
                            Widget? child) {
                          final selectedDate = dateProvider.selectedDate;
                          return MyButton(
                            name: 'Save',
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                final selectedBranch =
                                    branchProvider.selectedBranch;
                                if (selectedBranch == null) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content:
                                            Text('Please select a branch')),
                                  );
                                  return;
                                }
                                // Retrieve selected treatments
                                final treatmentProvider =
                                    Provider.of<TreatmentDataProvider>(context,
                                        listen: false);
                                final selectedTreatment =
                                    treatmentProvider.selectedTreatment;
                                if (selectedTreatment == null) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content:
                                            Text('Please select a treatment')),
                                  );
                                  return;
                                }

                                String selectedDate =
                                    _treatmentDateController.text;
                                String selectedHour =
                                    _treatmentTimeControllerOne.text;
                                String selectedMinute =
                                    _treatmentTimeControllerTwo.text;
                                String dateAndTime =
                                    '$selectedDate $selectedHour:$selectedMinute';
                                patientUpdateProvider.updatePatient(
                                  name: _nameController.text,
                                  executive: "Default Executive",
                                  payment: "Card",
                                  phone: _whatsAppController.text,
                                  address: _addressController.text,
                                  totalAmount:
                                      _getIntValue(_totalAmountController.text),
                                  discountAmount: _getIntValue(
                                      _discountAmountController.text),
                                  advanceAmount: _getIntValue(
                                      _advanceAmountController.text),
                                  balanceAmount: _getIntValue(
                                      _balanceAmountController.text),
                                  dateAndTime: dateAndTime,
                                  id: "",
                                  male: [patientCountProvider.maleCount],
                                  female: [patientCountProvider.femaleCount],
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

void showImagePickerOption(
  BuildContext context, {
  required int maleCount,
  required int femaleCount,
  required void Function() incrementMale,
  required void Function() incrementFemale,
  required void Function() decrementMale,
  required void Function() decrementFemale,
  required Function(int maleCount, int femaleCount) onSave,
}) {
  showModalBottomSheet(
    backgroundColor: white.withOpacity(0.0),
    context: context,
    builder: (builder) {
      int localMaleCount = maleCount;
      int localFemaleCount = femaleCount;

      Widget buildCounterRow(
        String label,
        int count,
        VoidCallback decrement,
        VoidCallback increment,
      ) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Row(
            children: [
              _buildLabelContainer(label),
              SizedBox(width: 10.w),
              _buildCounterButton(decrement),
              _buildCounterDisplay(count),
              SizedBox(width: 5.w),
              _buildCounterButton(increment),
            ],
          ),
        );
      }

      return StatefulBuilder(
        builder: (context, setState) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 60.h),
                child: Center(
                  child: Container(
                    width: 300.w,
                    height: 290.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.sp),
                      color: white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ChooseTreatmentForm(),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 20.w,
                            right: 15.w,
                            bottom: 3.h,
                            top: 15.h,
                          ),
                          child: Text(
                            'Add Patients',
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
                            return buildCounterRow(
                              'Male',
                              localMaleCount,
                              () {
                                patientCountProvider.decrementMale();
                              },
                              () {
                                patientCountProvider.incrementMale();
                              },
                            );
                          },
                        ),
                        SizedBox(height: 10.h),
                        Consumer<PatientCountProvider>(
                          builder: (BuildContext context, patientCountProvider,
                              Widget? child) {
                            return buildCounterRow(
                              'Female',
                              localFemaleCount,
                              () {
                                patientCountProvider.decrementFemale();
                              },
                              () {
                                patientCountProvider.incrementFemale();
                              },
                            );
                          },
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 15.w, right: 15.w, top: 20.h),
                          child: Consumer<PatientCountProvider>(
                            builder:
                                (BuildContext context, value, Widget? child) {
                              return MyButton(
                                name: 'Save',
                                onTap: () {
                                  value.updateCounts(
                                      localMaleCount, localFemaleCount);
                                  onSave(localMaleCount, localFemaleCount);
                                  print("Save button");
                                },
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          );
        },
      );
    },
  );
}

Widget _buildLabelContainer(String label) {
  return Container(
    width: 110.w,
    height: 39.h,
    decoration: BoxDecoration(
      border: Border.all(width: 1.w, color: textBorderColor),
      color: textFieldColor,
      borderRadius: BorderRadius.circular(8.sp),
    ),
    child: Padding(
      padding: EdgeInsets.only(top: 13, left: 10.w),
      child: Text(
        label,
        style: TextStyle(
          color: black,
          fontFamily: 'Poppins',
          fontSize: 11.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
  );
}

Widget _buildCounterButton(VoidCallback onTap) {
  return InkWell(
    onTap: onTap,
    child: CircleAvatar(
      radius: 20.sp,
      backgroundColor: green,
      child: Icon(
        Icons.remove,
        color: white,
        size: 28.sp,
      ),
    ),
  );
}

Widget _buildCounterDisplay(int count) {
  return Container(
    margin: EdgeInsets.only(left: 5.w),
    width: 50.w,
    height: 39.h,
    decoration: BoxDecoration(
      border: Border.all(width: 1.w, color: textBorderColor),
      color: white,
      borderRadius: BorderRadius.circular(8.sp),
    ),
    child: Center(
      child: Text(
        '$count',
        style: TextStyle(
          color: black,
          fontFamily: 'Poppins',
          fontSize: 11.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
  );
}
