import 'package:flutter/material.dart';
import 'package:myapp/login.dart';
import 'package:myapp/widget/changementScreens.dart';
import 'package:myapp/widget/myButton.dart';

import 'widget/mytextFormField.dart';
import 'widget/passwordFormField.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

RegExp regExp = RegExp(p);
bool obserText = true;

class _SignUpState extends State<SignUp> {
  void validation() {
    final FormState? _form = _formKey.currentState;
    if (_form!.validate()) {
      print("yes");
    } else {
      print("no");
    }
  }

  Widget _buildAllTextFormField() {
    return Container(
      height: 330,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MyTextFormField(
            name: "userName",
            validator: (value) {
              if (value == "") {
                return "Please Fill UserName";
              } else if (value!.length < 6) {
                return "UserName Is Too Short";
              }
              return "";
            },
          ),
          MyTextFormField(
            name: "Login",
            validator: (value) {
              if (value == "") {
                return "Please Fill Email";
              } else if (!regExp.hasMatch(value!)) {
                return "Email Is Invalid";
              }
              return "";
            },
          ),
          PasswordTextFormField(
            validator: (value) {
              if (value == "") {
                return "Please Fill Password";
              } else if (value!.length < 8) {
                return "Password Is Too Short";
              }
              return "";
            },
            // onTap: () {
            //   // FocusScope.of(context).unfocus();
            //   // setState(() {R
            //   //   obserText = !obserText;
            //   // });
            // },
            name: "Password",
            obserText: obserText,
            onTap: (String? context) {},
          ),
          MyTextFormField(
            name: "Phone Number",
            validator: (value) {
              if (value == "") {
                return "Please Fill Phone Number";
              } else if (value!.length < 9) {
                return "phone Number Must Be 9";
              }
              return "";
            },
          ),
        ],
      ),
    );
  }

  Widget _buildBottomPart() {
    return Container(
      height: 400,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      //color: Colors.blue,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildAllTextFormField(),
          ////button
          MyButton(
              name: "SignUp",
              onPressed: () {
                validation();
              }),
          ChangeScreen(
            name: "Login",
            whichAccount: "I Have Already An Account !",
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (ctx) =>  Login(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Form(
            key: _formKey,
            child: Container(
              child: Column(
                children: [
                  Container(
                    height: 220,
                    width: double.infinity,
                    // color: Colors.blue,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Text("Register",
                            style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                            )),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  _buildBottomPart(),
                ],
              ),
            ),
          ),
        ));
  }
}
