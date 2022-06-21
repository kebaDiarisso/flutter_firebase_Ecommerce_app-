import 'package:flutter/material.dart';

class PasswordTextFormField extends StatelessWidget {
  final bool obserText;
  final String? Function(String?) validator;
  final String name;
  final Function(String?) onTap;
  PasswordTextFormField({
    required this.validator,
    required this.onTap,
    required this.name,
    required this.obserText,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
       validator: validator,
      obscureText: obserText,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: name,
        suffixIcon: GestureDetector(
          onTap: onTap(toString()),
          child: Icon(
            obserText == true ? Icons.visibility : Icons.visibility_off,
            color: Colors.black,
          ),
        ),
        hintStyle: TextStyle(color: Colors.black),
      ),
    );
  }
}