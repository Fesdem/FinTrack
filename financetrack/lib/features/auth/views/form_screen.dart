// ignore_for_file: use_build_context_synchronously

import 'package:financetrack/common/constants/colors.dart';
import 'package:financetrack/common/constants/text_styles.dart';
import 'package:financetrack/features/auth/controller/auth_controller.dart';
import 'package:financetrack/features/views/main_page.dart';
import 'package:financetrack/utils/show_snack_bar.dart';
import 'package:financetrack/utils/widgets/header.dart';
import 'package:financetrack/utils/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FormScreen extends ConsumerStatefulWidget {
  static const routeName = '/form-screen';
  final String email;

  const FormScreen({super.key, required this.email});

  @override
  ConsumerState<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends ConsumerState<FormScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _firName;
  String? _lasName;
  String? _userName;

  void _submit() async {
    try {
      if (_formKey.currentState!.validate()) {
        showCircleLoader(message: 'Saving Form...');
        FocusScope.of(context).unfocus();
        _formKey.currentState!.save();
        await ref
            .read(authControllerProvider)
            .saveUserDataToFirebase(
              context: context,
              userName: _userName!,
              firstName: _firName!,
              lastName: _lasName!,
              destination: const MainPage(),
            );
      }
    } catch (e) {
      showSnackBar(
        context: context,
        status: Status.error,
        message: 'An error occured. Try again later!',
      );
    } finally {
      // hideLoader();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8.h),
              header(),
              SizedBox(height: 46.h),
              Text('Fill the form to proceed!', style: AppTextStyle.fourtStyle),
              SizedBox(height: 27.h),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('First Name', style: AppTextStyle.twelStyle),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Enter your first Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Provide your First Name';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _firName = value!;
                      },
                    ),
                    SizedBox(height: 8.h),
                    Text('Last Name', style: AppTextStyle.twelStyle),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Enter your last Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Provide your Last Name';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _lasName = value!;
                      },
                    ),
                    SizedBox(height: 8.h),
                    Text('User Name', style: AppTextStyle.twelStyle),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Enter your username',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Provide your User Name';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _userName = value!;
                      },
                    ),
                    SizedBox(height: 8.h),
                    Text('Email', style: AppTextStyle.twelStyle),
                    TextField(
                      readOnly: true,
                      controller: TextEditingController(text: widget.email),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                    ),
                    SizedBox(height: 8.h),
                  ],
                ),
              ),
              SizedBox(height: 28.h),
              SizedBox(
                width: double.infinity,
                height: 56.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                  onPressed: _submit,
                  child: Text('Submit Form', style: AppTextStyle.eigStyle),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
