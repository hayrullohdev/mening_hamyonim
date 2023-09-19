import 'package:flutter/material.dart';
import 'package:mening_hamyonim/models/expense.dart';

import 'budget.dart';
import 'expens_list.dart';
// ignore: duplicate_import
import '../models/expense.dart';

class Body extends StatelessWidget {
  final List<Expense> expenses;
  const Body(this.expenses, {super.key});

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        Budget(),
        ExpensList(expenses),
      ],
    );
  }
}
