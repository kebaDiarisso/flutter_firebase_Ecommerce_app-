import 'package:flutter/material.dart';

import '../login.dart';

class ChangeScreen extends StatelessWidget {
  late final String whichAccount;
  late final Function onTap;
  final String name;

ChangeScreen({required this.name, required this.onTap,required this.whichAccount});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(whichAccount),
        SizedBox(
          width: 10,
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (ctx) => const Login(),
              ),
            );
          },
          child:  Text(
            name,
            style: TextStyle(
                color: Colors.cyan, fontSize: 15, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}