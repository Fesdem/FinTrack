import 'package:financetrack/common/constants/colors.dart';
import 'package:financetrack/common/constants/text_styles.dart';
import 'package:financetrack/features/transaction/views/add_trans_screen.dart';
import 'package:financetrack/utils/month_list.dart';
import 'package:financetrack/utils/widgets/recent_trans_card.dart';
import 'package:financetrack/utils/widgets/summary_budget_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_date_pickers/flutter_date_pickers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home-screen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime _selectedDate = DateTime.now();
  bool _isOpenCalendar = false;

  void _navigateToTransScreen() {
    Navigator.pushNamed(context, AddTransScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    String monthName = monthNames[_selectedDate.month - 1];
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('FinanceTrack', style: AppTextStyle.sixStyle),
            InkWell(
              onTap: () {
                setState(() {
                  _isOpenCalendar = !_isOpenCalendar;
                });
              },
              child: Row(
                children: [
                  Text(
                    '$monthName ${_selectedDate.year}',
                    style: AppTextStyle.thirStyle,
                  ),
                  Icon(
                    _isOpenCalendar
                        ? Icons.arrow_drop_up_outlined
                        : Icons.arrow_drop_down_outlined,
                    color: _isOpenCalendar ? blueColor : feintBlueColor,
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          Badge(
            backgroundColor: redColor,
            child: Icon(Icons.notifications_none, color: Colors.black),
          ),
          SizedBox(width: 6.w),
          Image.asset(
            'assets/icons/profile_pic.png',
            width: 40.w,
            height: 40.h,
          ),
          SizedBox(width: 10.w),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                  : SizedBox(height: 4.h),
              summaryCard(),
              SizedBox(height: 24.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 238.w,
                    height: 48.h,
                    child: ElevatedButton(
                      onPressed: _navigateToTransScreen,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add, color: whiteColor),
                          Text(
                            'Add Transaction',
                            style: AppTextStyle.fourStyle,
                          ),
                        ],
                      ),
                    ),
                  ),

                  Image.asset(
                    'assets/icons/filter_ic.png',
                    width: 17.h,
                    height: 17.h,
                    color: darkBlueColor,
                  ),
                  Icon(Icons.search, color: darkBlueColor),
                ],
              ),
              SizedBox(height: 5.h),
              Row(
                children: [
                  Text('Active now:', style: AppTextStyle.tenStyle),
                  Image.asset(
                    'assets/icons/active_ic.png',
                    width: 60.h,
                    height: 60.h,
                  ),
                ],
              ),
              SizedBox(height: 5.h),
              RecentTransCard(),
            ],
          ),
        ),
      ),
    );
  }
}
