// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noviindus/models/branchListModel/branchListModel.dart';
import 'package:noviindus/provider/branchListProvider/branchListDataProvider.dart';
import 'package:provider/provider.dart';
import 'package:noviindus/colors/colors.dart';

class BranchForm extends StatelessWidget {
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  const BranchForm({super.key, this.validator, this.controller});

  @override
  Widget build(BuildContext context) {
    final branchProvider = Provider.of<BranchDataProvider>(context);

    // Ensure that the selected branch is part of the branch list
    Branches? selectedBranch = branchProvider.selectedBranch;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              EdgeInsets.only(left: 20.w, right: 15.w, bottom: 3.h, top: 15.h),
          child: Text(
            'Branch',
            style: TextStyle(
              color: myBlack,
              fontFamily: 'Poppins',
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        branchProvider.isLoading
            ? Center(
                child: CircularProgressIndicator(
                  color: green,
                  strokeAlign: -5,
                ),
              )
            : Container(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: DropdownButtonFormField<Branches>(
                  value: selectedBranch,
                  hint: Text(
                    'Select the branch',
                    style: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'Poppins',
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400),
                  ),
                  icon: Icon(
                    Icons.keyboard_arrow_down_sharp,
                    color: green,
                    size: 28.sp,
                  ),
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide(color: textBorderColor),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide(color: textBorderColor),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide(color: textBorderColor),
                    ),
                    fillColor: textFieldColor,
                    filled: true,
                  ),
                  style: TextStyle(
                    color: myBlack,
                    fontFamily: 'Poppins',
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  items: branchProvider.branches.isNotEmpty
                      ? branchProvider.branches.map((Branches branch) {
                          return DropdownMenuItem<Branches>(
                            value: branch,
                            child: Text(branch.name.toString()),
                          );
                        }).toList()
                      : [
                          DropdownMenuItem<Branches>(
                            value: null,
                            child: Text('No branches available'),
                          ),
                        ],
                  onChanged: (Branches? newBranch) {
                    if (newBranch != null) {
                      branchProvider.selectBranch(newBranch);
                    }
                  },
                ),
              ),
      ],
    );
  }
}
