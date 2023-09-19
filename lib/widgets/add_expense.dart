import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({super.key});

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  DateTime? selectedDate;

  void showNewExpenseCalendar(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime.now(),
      helpText: "XARAJAT KUNINI TANLANG!",
      cancelText: "BEKOR QILISH",
      confirmText: "TANLASH",
    ).then(
      (value) {
        if (value != null) {
          setState(() {
            selectedDate = value;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
          top: 16,
          left: 16,
          right: 16,
          bottom: MediaQuery.of(context).viewInsets.bottom > 0
              ? MediaQuery.of(context).viewInsets.bottom + 16
              : 100,
        ),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(
                labelText: "Xarajat nomi",
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: "Xarajat miqdori",
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                selectedDate == null
                    ? const Text("Xarajat kuni tanlanmadi!")
                    : Text(
                        "Xarajat kuni: ${DateFormat("dd MMMM, y").format(selectedDate!)}"),
                TextButton(
                  onPressed: () {
                    showNewExpenseCalendar(context);
                  },
                  child: const Text("KUNNI TANLASH"),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("BEKOR QILISH"),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("KIRITISH"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
