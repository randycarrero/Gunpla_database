import 'package:flutter/material.dart';

final kHintTextStyle = TextStyle(
  fontFamily: 'OpenSans',
);

final kLabelStyle = TextStyle(
  fontFamily: 'OpenSans',
);

final kBoxDecorationStyle = BoxDecoration(
  color: Color(0xFF9E9E9E),
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);

final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
  primary: Color(0xFF9E9E9E),
  minimumSize: Size(300, 55),
  elevation: 5.0,
  padding: EdgeInsets.all(15.0),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(30.0)),
  ),
);

final ButtonStyle raisedButtonStyle2 = ElevatedButton.styleFrom(
  primary: Colors.amber[700],
  minimumSize: Size(300, 55),
  elevation: 5.0,
  padding: EdgeInsets.all(15.0),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(30.0)),
  ),
);

final ButtonStyle raisedButtonStyle3 = ElevatedButton.styleFrom(
  primary: Color(0xFFA90606),
  minimumSize: Size(150, 50),
  elevation: 5.0,
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
  ),
);

class MenuItem {
  final String text;
  final IconData icon;

  const MenuItem({
    this.text,
    this.icon,
  });
}
