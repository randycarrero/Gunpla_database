import 'package:flutter/material.dart';
import 'package:gunpla_database/app/constants.dart';

class MenuItems {
  static const List<MenuItem> itemsFirst = [
    itemProfile,
    itemSettings,
  ];
  static const List<MenuItem> itemsSecond = [
    itemSignout,
  ];

  static const itemProfile = MenuItem(
    text: 'Profile',
    icon: Icons.account_circle,
  );
  static const itemSettings = MenuItem(
    text: 'Settings',
    icon: Icons.settings,
  );
  static const itemSignout = MenuItem(
    text: 'Sign Out',
    icon: Icons.logout,
  );
}
