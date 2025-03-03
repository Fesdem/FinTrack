import 'package:financetrack/common/constants/colors.dart';
import 'package:financetrack/common/constants/text_styles.dart';
import 'package:financetrack/features/transaction/controller/trans_controller.dart';
import 'package:financetrack/features/views/main_page.dart';
import 'package:financetrack/utils/month_list.dart';
import 'package:financetrack/utils/show_snack_bar.dart';
import 'package:financetrack/utils/trans_status_list.dart';
import 'package:financetrack/utils/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_date_pickers/flutter_date_pickers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddTransScreen extends ConsumerStatefulWidget {
  static const routeName = '/add-trans-screen';

  const AddTransScreen({super.key});

  @override
  ConsumerState<AddTransScreen> createState() => _AddTransScreenState();
}

class _AddTransScreenState extends ConsumerState<AddTransScreen> {
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  int _value = 0;
  int _categoryValue = 0;
  DateTime _selectedDate = DateTime.now();
  bool _isOpenCalendar = false;

  void _add({required String status, String? category}) {
    Widget destination = const MainPage();
    DateTime date = DateTime.now();

    try {
      
      if (_amountController.text.isNotEmpty) {
        double amount = double.parse(_amountController.text);
        if (_value == 0) {
          if (_categoryValue != 0) {
            ref
                .read(transControllerProvider)
                .saveTransaction(
                  context: context,
                  status: status,
                  amount: amount,
                  category: category!,
                  date: date,
                  destination: destination,
                );
          } else {
            showSnackBar(
              context: context,
              status: Status.error,
              message: 'Select a category!',
            );
          }
        } else {
          ref
              .read(transControllerProvider)
              .saveTransaction(
                context: context,
                status: 'Income',
                amount: amount,
                category: 'Income',
                date: date,
                destination: destination,
              );
        }
      } else {
        showSnackBar(
          context: context,
          status: Status.error,
          message: 'Amount must be provided!',
        );
      }
    } catch (e) {
      showSnackBar(
        context: context,
        status: Status.error,
        message: 'An error occured. Try again later!',
      );
    } finally {
      
    }
  }

  void _changeTranStatusToIncome() {
    setState(() {
      _value = 1;
    });
  }

  void _changeTranStatusToExpense() {
    setState(() {
      _value = 0;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _amountController.dispose();
    _noteController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String monthName = monthNames[_selectedDate.month - 1];
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Transaction', style: AppTextStyle.sixStyle),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 4.h),
              Row(
                children: [
                  SizedBox(
                    width: 165.w,
                    height: 38.h,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            _value == 0 ? primaryColor : whiteColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.r),
                        ),
                      ),
                      onPressed: () {
                        _changeTranStatusToExpense();
                      },
                      child: Text(
                        'Expense',
                        style:
                            _value == 0
                                ? AppTextStyle.fourStyle
                                : AppTextStyle.twelStyle,
                      ),
                    ),
                  ),
                  SizedBox(width: 6.w),
                  SizedBox(
                    width: 165.w,
                    height: 38.h,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            _value == 1 ? primaryColor : whiteColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.r),
                        ),
                      ),
                      onPressed: () {
                        _changeTranStatusToIncome();
                      },
                      child: Text(
                        'Income',
                        style:
                            _value == 1
                                ? AppTextStyle.fourStyle
                                : AppTextStyle.twelStyle,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 32.h),
              Row(
                children: [
                  Text('₦', style: AppTextStyle.sevtStyle),
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.numberWithOptions(),
                      style: AppTextStyle.fourtStyle,
                      controller: _amountController,
                      decoration: InputDecoration(
                        hintText: '   0.00',
                        hintStyle: AppTextStyle.sevtStyle,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 27.h),
              _value == 1
                  ? const SizedBox()
                  : Text('Category', style: AppTextStyle.ninStyle),
              _value == 1 ? const SizedBox() : SizedBox(height: 16.h),
              _value == 0
                  ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {});
                          _categoryValue = 1;
                        },
                        child: Container(
                          height: 100,
                          width: 85.w,
                          decoration:
                              _categoryValue == 1
                                  ? BoxDecoration(
                                    border: Border.all(color: primaryColor),
                                    borderRadius: BorderRadius.circular(12.r),
                                  )
                                  : null,
                          child: _expenseCategory(
                            'assets/icons/shopping_ic.png',
                            'Shopping',
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _categoryValue = 2;
                          });
                        },
                        child: Container(
                          height: 100,
                          width: 85.w,
                          decoration:
                              _categoryValue == 2
                                  ? BoxDecoration(
                                    border: Border.all(color: primaryColor),
                                    borderRadius: BorderRadius.circular(12.r),
                                  )
                                  : null,
                          child: _expenseCategory(
                            'assets/icons/transport_ic.png',
                            'Transport',
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _categoryValue = 3;
                          });
                        },
                        child: Container(
                          height: 100,
                          width: 85.w,
                          decoration:
                              _categoryValue == 3
                                  ? BoxDecoration(
                                    border: Border.all(color: primaryColor),
                                    borderRadius: BorderRadius.circular(12.r),
                                  )
                                  : null,
                          child: _expenseCategory(
                            'assets/icons/food_ic.png',
                            'Food',
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _categoryValue = 4;
                          });
                        },
                        child: Container(
                          height: 100,
                          width: 85.w,
                          decoration:
                              _categoryValue == 4
                                  ? BoxDecoration(
                                    border: Border.all(color: primaryColor),
                                    borderRadius: BorderRadius.circular(12.r),
                                  )
                                  : null,
                          child: _expenseCategory(
                            'assets/icons/home_ic.png',
                            'Home',
                          ),
                        ),
                      ),
                    ],
                  )
                  : const SizedBox(),
              SizedBox(height: 16.h),
              _value == 0
                  ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {});
                          _categoryValue = 5;
                        },
                        child: Container(
                          height: 100,
                          width: 85.w,
                          decoration:
                              _categoryValue == 5
                                  ? BoxDecoration(
                                    border: Border.all(color: primaryColor),
                                    borderRadius: BorderRadius.circular(12.r),
                                  )
                                  : null,
                          child: _expenseCategory(
                            'assets/icons/bills_ic.png',
                            'Bills',
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _categoryValue = 6;
                          });
                        },
                        child: Container(
                          height: 100,
                          width: 85.w,
                          decoration:
                              _categoryValue == 6
                                  ? BoxDecoration(
                                    border: Border.all(color: primaryColor),
                                    borderRadius: BorderRadius.circular(12.r),
                                  )
                                  : null,
                          child: _expenseCategory(
                            'assets/icons/entertainment_ic.png',
                            'Entertainment',
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _categoryValue = 7;
                          });
                        },
                        child: Container(
                          height: 100,
                          width: 85.w,
                          decoration:
                              _categoryValue == 7
                                  ? BoxDecoration(
                                    border: Border.all(color: primaryColor),
                                    borderRadius: BorderRadius.circular(12.r),
                                  )
                                  : null,
                          child: _expenseCategory(
                            'assets/icons/health_ic.png',
                            'Health',
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _categoryValue = 8;
                          });
                        },
                        child: Container(
                          height: 100,
                          width: 85.w,
                          decoration:
                              _categoryValue == 8
                                  ? BoxDecoration(
                                    border: Border.all(color: primaryColor),
                                    borderRadius: BorderRadius.circular(12.r),
                                  )
                                  : null,
                          child: _expenseCategory(
                            'assets/icons/others_ic.png',
                            'Others',
                          ),
                        ),
                      ),
                    ],
                  )
                  : const SizedBox(),
              SizedBox(height: 31.h),
              Text('Date', style: AppTextStyle.ninStyle),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: TextEditingController(
                        text:
                            ' $monthName ${_selectedDate.day} ${_selectedDate.year}',
                      ),
                      readOnly: true,
                      decoration: InputDecoration(
                        prefix: Icon(Icons.calendar_month_outlined),
                        suffix: Icon(Icons.arrow_forward_ios_outlined),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _isOpenCalendar = !_isOpenCalendar;
                      });
                    },
                    child: Text('Change'),
                  ),
                ],
              ),
              _isOpenCalendar
                  ? DayPicker.single(
                    selectedDate: _selectedDate,
                    onChanged: (date) => setState(() => _selectedDate = date),
                    firstDate: DateTime(2020),
                    lastDate: DateTime(2030),
                    datePickerStyles: DatePickerRangeStyles(
                      selectedDateStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      selectedSingleDateDecoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                      dayHeaderStyle: DayHeaderStyle(
                        textStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      currentDateStyle: TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    datePickerLayoutSettings: DatePickerLayoutSettings(
                      maxDayPickerRowCount: 6,
                      showPrevMonthEnd: false,
                      showNextMonthStart: false,
                    ),
                    selectableDayPredicate: (date) => true,
                  )
                  : const SizedBox(),

              _isOpenCalendar
                  ? Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          _isOpenCalendar = false;
                        });
                      },
                      child: Text(
                        'Confirm Date',
                        style: AppTextStyle.fourStyle,
                      ),
                    ),
                  )
                  : const SizedBox(),
              SizedBox(height: 37.h),
              Text('Notes (Optional)', style: AppTextStyle.ninStyle),

              TextField(
                controller: _noteController,
                decoration: InputDecoration(hintText: 'Add note'),
              ),
              SizedBox(height: 32.h),
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
                  onPressed: () async {
                    _value == 0
                        ? _add(
                          status: statusCode[_value],
                          category: categoryCode[_categoryValue],
                        )
                        : _add(status: statusCode[_value]);
                  },

                  child: Text('Save Transaction', style: AppTextStyle.eigStyle),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _expenseCategory(String imageUrl, String title) {
  return Column(
    children: [
      SizedBox(height: 10),
      Image.asset(imageUrl, width: 48, height: 48),
      Text(title, style: AppTextStyle.eightStyle),
    ],
  );
}
