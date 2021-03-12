import 'package:ant_icons/ant_icons.dart';
import 'package:flutter/material.dart';
import 'package:gunpla_database/backend/backend.dart';

class GunplaDetailsScreen extends StatelessWidget {
  const GunplaDetailsScreen({
    Key key,
    @required this.gunpla,
  })  : assert(gunpla != null),
        super(key: key);

  final Gunpla gunpla;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(gunpla.name),
      ),
      body: ListView(
        children: [
          if (gunpla.image.isNotEmpty) _ImageHeader(gunpla: gunpla),
          ListTile(
            title: Text(
              gunpla.name,
              style: textTheme.headline6,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              gunpla.series,
              style: textTheme.subtitle1,
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(AntIcons.column_width),
            title: Text('${gunpla.scale}'),
            subtitle: const Text('in Scale'),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(AntIcons.colum_height),
            title: Text('${gunpla.grade}'),
            subtitle: const Text(' Grade'),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              height: 56.0,
            ),
          ),
        ],
      ),
    );
  }
}

class _ImageHeader extends StatelessWidget {
  const _ImageHeader({
    Key key,
    @required this.gunpla,
  }) : super(key: key);

  final Gunpla gunpla;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Hero(
        tag: 'hero-${gunpla.id}-image',
        child: Image.network(
        gunpla.image,
        fit: BoxFit.cover,
      ),
    );
  }
}
