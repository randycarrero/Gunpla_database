import 'package:ant_icons/ant_icons.dart';
import 'package:flutter/material.dart';
import 'package:gunpla_database/backend/backend.dart';
import 'package:url_launcher/url_launcher.dart';

class GunplaDetailsScreen extends StatelessWidget {
  const GunplaDetailsScreen({
    Key key,
    @required this.gunpla,
  })  : assert(gunpla != null),
        super(key: key);

  final Gunpla gunpla;

  bool get _hasAlreadyFlown => gunpla.firstFlight.isBefore(DateTime.now());

  int get _daysSinceFirstFlight =>
      gunpla.firstFlight.difference(DateTime.now()).abs().inDays;

  String get _firstFlightLabel {
    final date = gunpla.firstFlight;

    return '${date.year}-${date.month}-${date.day}';
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(gunpla.name),
      ),
      body: ListView(
        children: [
          if (gunpla.flickrImages.isNotEmpty) _ImageHeader(gunpla: gunpla),
          ListTile(
            title: Text(
              gunpla.name,
              style: textTheme.headline6,
            ),
            subtitle: gunpla.active ? null : Text('Inactive'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              gunpla.description,
              style: textTheme.subtitle1,
            ),
          ),
          ListTile(
            leading: const Icon(AntIcons.calendar),
            title: Text(
              _hasAlreadyFlown
                  ? '$_daysSinceFirstFlight days since first flight'
                  : '$_daysSinceFirstFlight days until first flight',
            ),
            subtitle: Text(
              _hasAlreadyFlown
                  ? 'First flew on $_firstFlightLabel'
                  : 'Scheduled to fly on $_firstFlightLabel',
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(AntIcons.column_width),
            title: Text('${gunpla.diameter} m'),
            subtitle: const Text('in diameter'),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(AntIcons.colum_height),
            title: Text('${gunpla.height} m'),
            subtitle: const Text('in height'),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(AntIcons.arrow_down),
            title: Text('${gunpla.mass} kg'),
            subtitle: Text('total mass'),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              height: 56.0,
              child: ElevatedButton(
                onPressed: () {
                  launch(gunpla.wikipedia);
                },
                child: Center(
                  child: Text('View Wikipedia Article'),
                ),
              ),
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
        child: PageView(
          children: [
            for (final url in gunpla.flickrImages)
              Image.network(
                url,
                fit: BoxFit.cover,
              ),
          ],
        ),
      ),
    );
  }
}
