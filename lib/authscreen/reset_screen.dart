import 'package:flutter/material.dart';
import 'package:gunpla_database/backend/auth_provider.dart';
import 'login_screen.dart';

class ResetScreen extends StatefulWidget {
  ResetScreen({Key key}) : super(key: key);

  @override
  _ResetScreenState createState() => _ResetScreenState();
}

class _ResetScreenState extends State<ResetScreen> {
  TextEditingController _email = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Reset"),
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
                    FlatButton(
                        color: Colors.blue,
                        onPressed: () {
                          setState(() {
                            isLoading = true;
                          });
                          AuthClass()
                              .resetPassword(
                            email: _email.text.trim(),
                          )
                              .then((value) {
                            if (value == "Email sent") {
                              setState(() {
                                isLoading = false;
                              });
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen()),
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
                        child: Text("Reset account")),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                      },
                      child: Text("Already have an account? Login"),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              )
            : Center(
                child: CircularProgressIndicator(),
              ));
  }
}
