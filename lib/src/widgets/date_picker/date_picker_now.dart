import 'package:druto_seba_driver/src/services/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../modules/drawerPage/controller/dashboard_controller.dart';

class MonthYearPicker extends StatefulWidget {
  @override
  _MonthYearPickerState createState() => _MonthYearPickerState();
}

class _MonthYearPickerState extends State<MonthYearPicker> {
  final DashBoardController dashBoardController = Get.put(DashBoardController());
  late int _selectedMonth;
  late int _selectedYear;

  @override
  void initState() {
    super.initState();
    DateTime now = DateTime.now();
    _selectedMonth = now.month;
    _selectedYear = now.year;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Months",style: h2,),
            DropdownButton<int>(
              value: _selectedMonth,
              onChanged: (int? newValue) {
                if (newValue != null) {
                  setState(() {
                    _selectedMonth = newValue;
                  });
                }
              },
              items: List<DropdownMenuItem<int>>.generate(
                12,
                    (int index) {
                  return DropdownMenuItem<int>(
                    value: index + 1,
                    child: Text('${index + 1}'),
                  );
                },
              ),
            ),
          ],
        ),
        SizedBox(width: 16),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Year",style: h2,),
            DropdownButton<int>(
              value: _selectedYear,
              onChanged: (int? newValue) {
                if (newValue != null) {
                  setState(() {
                    _selectedYear = newValue;
                  });
                }
              },
              items: List<DropdownMenuItem<int>>.generate(
                10,
                    (int index) {
                  return DropdownMenuItem<int>(
                    value: DateTime.now().year + index,
                    child: Text('${DateTime.now().year + index}'),
                  );
                },
              ),
            ),
          ],
        ),
        SizedBox(width: 16),
        ElevatedButton(
          onPressed: () {
            // Create DateTime with the selected month, year, and a fixed day (e.g., 1st day of the month)
            DateTime selectedDate = DateTime(_selectedYear, _selectedMonth, 1);

            int month = selectedDate.month;
            int year = selectedDate.year;

            dashBoardController.dashboardDetails(month: month.toString(), year: year.toString());
            print("Month: $month");
            print("Year: $year");

            Get.back();

          },
          child: Text('ফিল্টার'),
        ),
      ],
    );
  }
}