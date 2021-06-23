import 'package:flutter/material.dart';

final kHintTextStyle = TextStyle(
  color: Colors.white54,
  fontFamily: 'OpenSans',
);

final kLabelStyle = TextStyle(
  color: Colors.white,
  // fontWeight: FontWeight.bold,
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
  minimumSize: Size(88, 36),
  elevation: 5.0,
  padding: EdgeInsets.all(15.0),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(30.0)),
  ),
);

final ButtonStyle raisedButtonStyle2 = ElevatedButton.styleFrom(
  primary: Colors.black,
  minimumSize: Size(88, 36),
  elevation: 5.0,
  padding: EdgeInsets.all(15.0),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(30.0)),
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
