import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mening_hamyonim/models/expense.dart';
// ignore: duplicate_import
import '../models/expense.dart';

class ExpensList extends StatelessWidget {
  final List<Expense> expenses;
  const ExpensList(this.expenses, {super.key});
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Container(
        clipBehavior: Clip.hardEdge,
        height: 360,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(45),
            topRight: Radius.circular(45),
          ),
        ),
        child: ListView.builder(
          padding: const EdgeInsets.only(
            top: 10,
            right: 5,
          ),
          itemBuilder: (context, index) {
            return ListTile(
              leading: const CircleAvatar(
                backgroundColor: Colors.blue,
              ),
              title: Text(
                expenses[index].title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                DateFormat("dd MMMM, y").format(expenses[index].date),
                style: const TextStyle(
                  fontSize: 13,
                ),
              ),
              trailing: Text("${expenses[index].amount} so'm"),
            );
          },
          itemCount: expenses.length,
        ),
      ),
    );
  }
}
