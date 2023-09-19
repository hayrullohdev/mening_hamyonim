import 'package:flutter/material.dart';

class Expense {
  final String id;
  final String title;
  final DateTime date;
  final double amount;
  final IconData icon;

  Expense({
    required this.id,
    required this.title,
    required this.date,
    required this.amount,
    this.icon = Icons.ac_unit,
  });
}

class Expenses {
  final List<Expense> _items = [
    Expense(
      id: "e1",
      title: "Tarvuz",
      date: DateTime.now(),
      amount: 20000,
    ),
    Expense(
      id: "e2",
      title: "Krasovka",
      date: DateTime.now(),
      amount: 290000,
    ),
    Expense(
        id: "e3",
        title: "Flutter Darsi",
        date: DateTime.now(),
        amount: 2000000),
    Expense(
        id: "e4",
        title: "New York bilet",
        date: DateTime.now(),
        amount: 8000000),
  ];
  List<Expense> get items {
    return _items;
  }
}
