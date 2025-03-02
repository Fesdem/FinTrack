import 'package:financetrack/common/constants/colors.dart';
import 'package:financetrack/common/constants/text_styles.dart';
import 'package:financetrack/features/home/views/home_screen.dart';
import 'package:financetrack/utils/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FormScreen extends StatefulWidget {
  static const routeName = '/form-screen';

  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  String? _firName;
  String? _lasName;
  String? _userName;

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      FocusScope.of(context).unfocus();
      _formKey.currentState!.save();
      // await ref.read(authControllerProvider).saveStaffFormToFirebase(
      //       context: context,
      //       userName: _userName!,
      //       firName: _firName!,
      //       lasName: _lasName!,
      //       deviceToken: token!,
      //       phoneNumber: int.parse(_phoneNo!),
      //     );
    }
  }

  void _navigateToHomeScreen() {
    Navigator.pushReplacementNamed(context, HomeScreen.routeName);
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
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
                        _firName = value!;
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
                        _firName = value!;
                      },
                    ),
                    SizedBox(height: 8.h),
                    Text('Email', style: AppTextStyle.twelStyle),
                    TextField(
                      readOnly: true,
                      controller: _emailController,
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
                  onPressed: _navigateToHomeScreen,
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
