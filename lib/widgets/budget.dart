import 'package:flutter/material.dart';
import 'probres_bar.dart';

class Budget extends StatelessWidget {
  const Budget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: 444,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          color: Color.fromRGBO(239, 240, 250, 1),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(45),
            topRight: Radius.circular(45),
          )),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Text("Oylik byujet:"),
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.edit,
                      size: 18,
                    ),
                    label: const Text("1,000,000 so'm"),
                  ),
                ],
              ),
              const Text("4.9%"),
            ],
          ),
          Probressbar(),
        ],
      ),
    );
  }
}
