import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  bool _flutter = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Setting')),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Card(
              child: SwitchListTile(
                title: Text(
                  'Light Mode?',
                  style: TextStyle(fontSize: 20),
                ),
                value: _flutter,
                activeColor: Colors.amber[700],
                inactiveTrackColor: Colors.grey,
                onChanged: (bool value) {
                  setState(() {
                    _flutter = value;
                  });
                },
                controlAffinity: ListTileControlAffinity.trailing,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
