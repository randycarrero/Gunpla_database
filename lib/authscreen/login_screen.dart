import 'package:flutter/material.dart';
import 'package:gunpla_database/authscreen/sign_up_screen.dart';
import 'package:gunpla_database/backend/auth_provider.dart';
import 'package:gunpla_database/home/home_screen.dart';

import 'reset_screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Login"),
        ),
        body: isLoading == false
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TextFormField(
                      controller: _email,
                      decoration: InputDecoration(hintText: "Email"),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: _password,
                      decoration: InputDecoration(hintText: "Password"),
                    ),
                    FlatButton(
                        color: Colors.blue,
                        onPressed: () {
                          setState(() {
                            isLoading = true;
                          });
                          AuthClass()
                              .signIN(
                                  email: _email.text.trim(),
                                  password: _password.text.trim())
                              .then((value) {
                            if (value == "Welcome") {
                              setState(() {
                                isLoading = false;
                              });
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeScreen()),
                                  (route) => false);
                            } else {
                              setState(() {
                                isLoading = false;
                              });
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(content: Text(value)));
                            }
                          });
                        },
                        child: Text("Log in ")),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpScreen()));
                      },
                      child: Text("Don't have an account? Register"),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ResetScreen()));
                      },
                      child: Text("Forgot Password? reset"),
                    )
                  ],
                ),
              )
            : Center(
                child: CircularProgressIndicator(),
              ));
  }
}
