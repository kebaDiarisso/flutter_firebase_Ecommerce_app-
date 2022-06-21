import 'package:flutter/material.dart';
import 'package:myapp/signUp.dart';
import 'package:myapp/widget/changementScreens.dart';
import 'package:myapp/widget/myButton.dart';
import 'package:myapp/widget/mytextFormField.dart';
import 'package:myapp/widget/passwordFormField.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  

  @override
  State<Login> createState() => _LoginState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

RegExp regExp = RegExp(p);
bool obserText = true;

void validation() {
  final FormState? _form = _formKey.currentState;
  if (_form!.validate()) {
    print("yes");
  } else {
    print("no");
  }
}

class _LoginState extends State<Login> {
  Widget _buildAllpart() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      height: 300,
      width: double.infinity,
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
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
        MyButton(
            name: "Login",
            onPressed: () {
              validation();
            }),
        ChangeScreen(
            name: "SignUp",
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (ctx) => const SignUp(),
                ),
              );
            },
            whichAccount: "I Have Not Account!"),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: _formKey,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildAllpart(),
          ],
        ),
      ),
    ));
  }
}
