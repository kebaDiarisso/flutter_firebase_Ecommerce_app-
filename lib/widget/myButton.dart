import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  //final Function onPressed;
  final VoidCallback onPressed;
  final String name;
  MyButton({required this.name, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: double.infinity,
      child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blueGrey[400]),
          ),
          onPressed: onPressed,
        //onPressed:(){},
          child: Text(name)),
    );
  }
}
