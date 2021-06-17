import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gunpla_database/app/constants.dart';
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
        body: isLoading == false
            ? AnnotatedRegion<SystemUiOverlayStyle>(
                value: SystemUiOverlayStyle.light,
                child: GestureDetector(
                  onTap: () => FocusScope.of(context).unfocus(),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        height: double.infinity,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0xFF616161),
                              Color(0xFF424242),
                              Color(0xFF303030),
                              Color(0xFF212121),
                            ],
                            stops: [0.1, 0.4, 0.7, 0.9],
                          ),
                        ),
                      ),
                      Container(
                        height: double.infinity,
                        child: SingleChildScrollView(
                          physics: AlwaysScrollableScrollPhysics(),
                          padding: EdgeInsets.symmetric(
                            horizontal: 40.0,
                            vertical: 120.0,
                          ),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'Reset Password',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'OpenSans',
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 30.0),
                                Text(
                                  'Email',
                                  style: kLabelStyle,
                                ),
                                SizedBox(height: 10.0),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  decoration: kBoxDecorationStyle,
                                  height: 60.0,
                                  child: TextField(
                                    controller: _email,
                                    keyboardType: TextInputType.emailAddress,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'OpenSans',
                                    ),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding:
                                          EdgeInsets.only(top: 14.0),
                                      prefixIcon: Icon(
                                        Icons.email,
                                        color: Colors.white,
                                      ),
                                      hintText: 'Enter your Email',
                                      hintStyle: kHintTextStyle,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 25.0),
                                  width: double.infinity,
                                  child: ElevatedButton(
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
                                                  builder: (context) =>
                                                      LoginScreen()),
                                              (route) => false);
                                        } else {
                                          setState(() {
                                            isLoading = false;
                                          });
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                                  content: Text(value)));
                                        }
                                      });
                                    },
                                    child: Text(
                                      'RESET',
                                      style: TextStyle(
                                        color: Colors.white,
                                        letterSpacing: 1.5,
                                        fontSize: 18.0,
                                        fontFamily: 'OpenSans',
                                      ),
                                    ),
                                    style: raisedButtonStyle,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                LoginScreen()));
                                  },
                                  child: RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Already have an account? ',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        TextSpan(
                                          text: 'Login',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ]),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ))
            : Center(
                child: CircularProgressIndicator(),
              ));
  }
}
