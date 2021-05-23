import 'package:ant_icons/ant_icons.dart';
import 'package:flutter/material.dart';
import 'package:gunpla_database/backend/backend.dart';
import 'package:provider/provider.dart';

class GunplaListTile extends StatelessWidget {
  final Gunpla gunpla;

  final VoidCallback onTap;
  const GunplaListTile({
    Key key,
    @required this.gunpla,
    @required this.onTap,
  })  : assert(gunpla != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<String>>(
        stream: context.read<Backend>().favoritedGunplas,
        builder: (context, snapshot) {
          final hasFavorited = snapshot.hasData && snapshot.data.contains('${gunpla.id}');
          return ListTile(
            isThreeLine: true,
            onTap: onTap,
            leading: gunpla.image.isEmpty
                ? null
                : Hero(
                    tag: 'hero-${gunpla.id}-image',
                    child: Material(
                      clipBehavior: Clip.antiAlias,
                      borderRadius: BorderRadius.circular(8.0),
                      child: AspectRatio(
                        aspectRatio: 3 / 2,
                        child: Image.network(
                          gunpla.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
            title: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                    child: Hero(
                  tag: 'hero-${gunpla.id}-name',
                  child: Text(gunpla.name),
                )),
                if (hasFavorited) ...const [
                  SizedBox(width: 4.0),
                  Icon(
                    AntIcons.heart,
                    color: Colors.redAccent,
                    size: 16.0,
                  ),
                ],
              ],
            ),
            subtitle: Text(
              gunpla.series,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: const Icon(Icons.chevron_right_sharp),
          );
        });
  }
}
