import 'package:ant_icons/ant_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gunpla_database/backend/backend.dart';
import 'package:provider/provider.dart';

class GunplaDetailsScreen extends StatelessWidget {
  final Gunpla gunpla;

  const GunplaDetailsScreen({
    Key key,
    @required this.gunpla,
  })  : assert(gunpla != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(gunpla.name),
        actions: [
          StreamBuilder<List<String>>(
              stream: context.read<Backend>().favoritedGunplas,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                final favoritedGunplas = snapshot.data;
                final isGunplasFavorited = favoritedGunplas.contains(gunpla.id);
                return IconButton(
                  onPressed: () {
                    context.read<Backend>().setFavoritedGunpla(
                          id: '${gunpla.id}',
                          favorited: !isGunplasFavorited,
                        );
                  },
                  icon: isGunplasFavorited
                      ? const Icon(
                          AntIcons.heart,
                          color: Colors.redAccent,
                        )
                      : const Icon(AntIcons.heart_outline),
                );
              }),
        ],
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
            title: Text(gunpla.scale.toString()),
            subtitle: const Text('Available Scale'),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(AntIcons.colum_height),
            title: Text(gunpla.grade.toString()),
            subtitle: const Text('Available Grade'),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(CupertinoIcons.star_fill),
            title: Text(gunpla.exclusive.toString()),
            subtitle: const Text('Exclusive'),
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
  final Gunpla gunpla;

  const _ImageHeader({
    Key key,
    @required this.gunpla,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Hero(
        tag: 'hero-${gunpla.id.toString()}-image',
        child: Image.network(
          gunpla.image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
