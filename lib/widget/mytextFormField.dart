import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
//  const MyTextFormField({ Key? key }) : super(key: key);

  final String? Function(String?) validator;
  final String name;

  MyTextFormField({required this.name, required this.validator});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: name,
        // hintStyle: const TextStyle(color: Colors.black)
      ),
    );
  }
}
