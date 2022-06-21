import 'package:flutter/material.dart';
import 'package:myapp/login.dart';
import 'package:myapp/signUp.dart';

void main() {
  runApp(const MyApp());
} //tuto 3 6m53

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
  
        primarySwatch: Colors.blue,
      ),
      home: Login(),
    );
  }
}