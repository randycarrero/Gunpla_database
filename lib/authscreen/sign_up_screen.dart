import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gunpla_database/app/widgets.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
                                'Register',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'OpenSans',
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 30.0),
                              BuildEmailTF(),
                              SizedBox(
                                height: 30.0,
                              ),
                              BuildPasswordTF(),
                              BuildForgotPasswordBtn(),
                              BuildLoginBtn(),
                              BuildSignUpBtn(),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            : Center(
                child: CircularProgressIndicator(),
              ));
  }
}
