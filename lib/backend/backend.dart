import 'package:meta/meta.dart';

class Gunpla {
  const Gunpla({
    @required this.name,
    @required this.description,
    this.flickrImages = const [],
  })  : assert(name != null),
        assert(description != null);

  final String name;
  final String description;
  final List<String> flickrImages;
}
