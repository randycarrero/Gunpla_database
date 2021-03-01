import 'package:flutter/material.dart';
import 'package:gunpla_database/backend/backend.dart';

class GunplaListTile extends StatelessWidget {
  const GunplaListTile({
    Key key,
    @required this.gunpla,
    @required this.onTap,
  })  : assert(gunpla != null),
        super(key: key);
  final Gunpla gunpla;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(gunpla.name),
      subtitle: Text(gunpla.description),
    );
  }
}
