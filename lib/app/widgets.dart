import 'package:flutter/material.dart';
import 'package:gunpla_database/app/constants.dart';
import 'package:gunpla_database/authscreen/reset_screen.dart';
import 'package:gunpla_database/authscreen/sign_up_screen.dart';
import 'package:gunpla_database/home/home_screen.dart';
import 'package:gunpla_database/backend/auth_provider.dart';
import 'package:gunpla_database/authscreen/login_screen.dart';

class BuildEmailTF extends StatefulWidget {
  BuildEmailTF({Key key}) : super(key: key);

  @override
  _BuildEmailTFState createState() => _BuildEmailTFState();
}

class _BuildEmailTFState extends State<BuildEmailTF> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
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
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.white,
              ),
              hintText: 'Enter your Email',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }
}

class BuildPasswordTF extends StatefulWidget {
  BuildPasswordTF({Key key}) : super(key: key);

  @override
  _BuildPasswordTFState createState() => _BuildPasswordTFState();
}

class _BuildPasswordTFState extends State<BuildPasswordTF> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            obscureText: true,
            style: TextStyle(
              color: Colors.white,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: 'Enter your Password',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }
}

class BuildForgotPasswordBtn extends StatefulWidget {
  BuildForgotPasswordBtn({Key key}) : super(key: key);

  @override
  _BuildForgotPasswordBtnState createState() => _BuildForgotPasswordBtnState();
}

class _BuildForgotPasswordBtnState extends State<BuildForgotPasswordBtn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ResetScreen()));
        },
        child: Text(
          'Forgot Password?',
          style: kLabelStyle,
        ),
      ),
    );
  }
}

final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
  primary: Color(0xFF9E9E9E),
  minimumSize: Size(88, 36),
  elevation: 5.0,
  padding: EdgeInsets.all(15.0),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(30.0)),
  ),
);

class BuildLoginBtn extends StatefulWidget {
  BuildLoginBtn({Key key}) : super(key: key);

  @override
  _BuildLoginBtnState createState() => _BuildLoginBtnState();
}

class _BuildLoginBtnState extends State<BuildLoginBtn> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: ElevatedButton(
        style: raisedButtonStyle,
        onPressed: () {
          setState(() {
            isLoading = true;
          });
          AuthClass()
              .signIN(
                  email: _email.text.trim(), password: _password.text.trim())
              .then((value) {
            if (value == "Welcome") {
              setState(() {
                isLoading = false;
              });
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
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
        child: Text(
          'LOGIN',
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }
}

class BuildSignUpBtn extends StatefulWidget {
  BuildSignUpBtn({Key key}) : super(key: key);

  @override
  _BuildSignUpBtnState createState() => _BuildSignUpBtnState();
}

class _BuildSignUpBtnState extends State<BuildSignUpBtn> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SignUpScreen()));
      },
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Don\'t have an Account? ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                // fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: 'Sign Up',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                // fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BuildResetBtn extends StatefulWidget {
  BuildResetBtn({Key key}) : super(key: key);

  @override
  _BuildResetBtnState createState() => _BuildResetBtnState();
}

class _BuildResetBtnState extends State<BuildResetBtn> {
  TextEditingController _email = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: ElevatedButton(
        style: raisedButtonStyle,
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
                  MaterialPageRoute(builder: (context) => LoginScreen()),
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
        child: Text(
          'RESET',
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }
}

class LoginBtn extends StatefulWidget {
  LoginBtn({Key key}) : super(key: key);

  @override
  _LoginBtnState createState() => _LoginBtnState();
}

class _LoginBtnState extends State<LoginBtn> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginScreen()));
      },
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Already have an account? ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
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
    );
  }
}
// Widget _buildSignInWithText() {
//   return Column(
//     children: <Widget>[
//       Text(
//         '- OR -',
//         style: TextStyle(
//           color: Colors.white,
//           fontWeight: FontWeight.w400,
//         ),
//       ),
//       SizedBox(height: 20.0),
//       Text(
//         'Sign in with',
//         style: kLabelStyle,
//       ),
//     ],
//   );
// }

// Widget _buildSocialBtn(Function onTap, AssetImage logo) {
//   return GestureDetector(
//     onTap: onTap,
//     child: Container(
//       height: 60.0,
//       width: 60.0,
//       decoration: BoxDecoration(
//         shape: BoxShape.circle,
//         color: Colors.white,
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black26,
//             offset: Offset(0, 2),
//             blurRadius: 6.0,
//           ),
//         ],
//         image: DecorationImage(
//           image: logo,
//         ),
//       ),
//     ),
//   );
// }

// Widget _buildSocialBtnRow() {
//   return Padding(
//     padding: EdgeInsets.symmetric(vertical: 30.0),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: <Widget>[
//         _buildSocialBtn(
//           () => print('Login with Facebook'),
//           AssetImage(
//             'assets/logos/facebook.jpg',
//           ),
//         ),
//         _buildSocialBtn(
//           () => print('Login with Google'),
//           AssetImage(
//             'assets/logos/google.jpg',
//           ),
//         ),
//       ],
//     ),
//   );
// }
