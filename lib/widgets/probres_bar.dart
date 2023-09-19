import 'package:flutter/material.dart';

class Probressbar extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
            alignment: Alignment.centerLeft,
            width: double.infinity,
            height: 5,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(212, 219, 239, 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: FractionallySizedBox(
              heightFactor: 2,
              widthFactor: 0.5,
              child: Container(
                width: double.infinity,
                height: 5,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.blue,
                      Colors.blue,
                      Colors.blue.shade200,
                      Colors.blue,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.blue,
                      blurRadius: 10,
                      spreadRadius: -3,
                    )
                  ],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          );
  }
}