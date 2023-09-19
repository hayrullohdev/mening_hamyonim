import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:intl/intl.dart';

class Header extends StatelessWidget {
  final Function showCalendar;
  final DateTime selectedDate;
  final Function() previousMonth;
  final Function() nextMonth;
  const Header(
      this.showCalendar, this.selectedDate, this.previousMonth, this.nextMonth,
      {super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final islastDate = selectedDate.year == DateTime.now().year &&
        selectedDate.month == DateTime.now().month;
    // ignore: unused_local_variable
    final isFirstDate = selectedDate.year == 2022 && selectedDate.month == 1;

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          TextButton(
            onPressed: () {
              showCalendar(context);
            },
            child: Text(
              DateFormat("MMMM, y").format(selectedDate),
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: isFirstDate ? Colors.grey : Colors.blue,
                    ),
                    borderRadius: BorderRadius.circular(30)),
                child: IconButton(
                  onPressed: previousMonth,
                  icon: Icon(
                    Icons.arrow_left,
                    color: isFirstDate ? Colors.grey : Colors.blue,
                  ),
                ),
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "450,000",
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "so'm",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      height: 0.6,
                    ),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: islastDate ? Colors.grey : Colors.blue,
                    ),
                    borderRadius: BorderRadius.circular(30)),
                child: IconButton(
                  onPressed: nextMonth,
                  icon: Icon(
                    Icons.arrow_right,
                    color: islastDate ? Colors.grey : Colors.blue,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
