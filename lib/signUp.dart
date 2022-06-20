import 'package:flutter/material.dart';
import 'package:myapp/login.dart';
import 'package:myapp/widget/myButton.dart';

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
                  Container(
                    height: 400,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    width: double.infinity,
                    //color: Colors.blue,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextFormField(
                          validator: (value) {
                            if (value == "") {
                              return "Please Fill UserName";
                            } else if (value!.length < 6) {
                              return "UserName Is Too Short";
                            }
                            return "";
                          },
                          decoration: const InputDecoration(
                            hintText: "UserName",
                            hintStyle: TextStyle(
                              color: Colors.black,
                            ),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value == "") {
                              return "Please Fill Email";
                            } else if (!regExp.hasMatch(value!)) {
                              return "Email Is Invalid";
                            }
                            return "";
                          },
                          decoration: const InputDecoration(
                            hintText: "Email",
                            hintStyle: TextStyle(
                              color: Colors.black,
                            ),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        TextFormField(
                          obscureText: obserText,
                          validator: (value) {
                            if (value == "") {
                              return "Please Fill Password";
                            } else if (value!.length < 8) {
                              return "Password Is Too Short";
                            }
                            return "";
                          },
                          decoration: InputDecoration(
                            hintText: "Password",
                            hintStyle: const TextStyle(
                              color: Colors.black,
                            ),
                            suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    obserText = !obserText;
                                  });
                                  FocusScope.of(context).unfocus();
                                },
                                child: Icon(
                                  obserText == true
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  // Icons.visibility,
                                  color: Colors.black,
                                )),
                            border: const OutlineInputBorder(),
                          ),
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value == "") {
                              return "Please Fill Phone Number";
                            } else if (value!.length < 9) {
                              return "phone Number Must Be 9";
                            }
                            return "";
                          },
                          decoration: const InputDecoration(
                            hintText: "Phone Number",
                            // icon: Icon(Icons.phone),
                            hintStyle: TextStyle(
                              color: Colors.black,
                            ),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        ////button
                        MyButton(name: "SignUp", onPressed: (){
                          validation();
                        }),
                        Row(
                          children: [
                            const Text("I Have Already An Account!"),
                            const SizedBox(
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
                                    color: Colors.cyan,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
