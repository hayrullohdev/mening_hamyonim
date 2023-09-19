import 'package:flutter/material.dart';
import 'package:mening_hamyonim/models/expense.dart';
import 'package:mening_hamyonim/widgets/add_expense.dart';
import 'package:mening_hamyonim/widgets/body.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';
import './widgets/header.dart';
// ignore: unused_import
import './widgets/budget.dart';
// ignore: unused_import
import './widgets/expens_list.dart';
// ignore: duplicate_import
import './widgets/body.dart';
// ignore: duplicate_import
import '../models/expense.dart';
// ignore: duplicate_import
import './widgets/add_expense.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: const MyWallet(),
    );
  }
}

class MyWallet extends StatefulWidget {
  const MyWallet({super.key});

  @override
  State<MyWallet> createState() => _MyWalletState();
}

class _MyWalletState extends State<MyWallet> {
  Expenses expenseData = Expenses();
  DateTime selectedDate = DateTime.now();

  void showCalendar(BuildContext context) {
    showMonthPicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime.now(),
    ).then((value) {
      if (value != null) {
        setState(() {
          selectedDate = value;
        });
      }
    });
  }

  void previousMonth() {
    if (selectedDate.year == 2022 && selectedDate.month == 1) {
      return;
    }
    setState(() {
      selectedDate = DateTime(
        selectedDate.year,
        selectedDate.month - 1,
        selectedDate.day,
      );
    });
  }

  void nextMonth() {
    if (selectedDate.year == DateTime.now().year &&
        selectedDate.month == DateTime.now().month) {
      return;
    }
    setState(() {
      selectedDate = DateTime(
        selectedDate.year,
        selectedDate.month + 1,
        selectedDate.day,
      );
    });
  }

  void showAddExpenseWindow(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      isDismissible: false,
      context: context,
      builder: (context) {
        return const AddExpense();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Wallet"),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Header(showCalendar, selectedDate, previousMonth, nextMonth),
          Body(expenseData.items),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddExpenseWindow(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
