import 'package:flutter/material.dart';

import '../login.dart';

class ChangeScreen extends StatelessWidget {
  late final String name;
  late final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("I Have Hot Account !"),
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
          child: const Text(
            'Login',
            style: TextStyle(
                color: Colors.cyan, fontSize: 15, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
