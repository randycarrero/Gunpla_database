import 'dart:convert';
import 'dart:io';

import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

class Backend {
  const Backend(this.hostUrl);

  final String hostUrl;

  Future<List<Gunpla>> getGunplas() async {
    final url = '$hostUrl/Gunplas';

    // Fetch the data from the API.
    // Since `http.get` returns a `Future`, we need to use `await` here.
    final response = await http.get(url);

    // If the request failed, we throw an exception.
    if (response.statusCode != 200) {
      throw HttpException(
        '${response.statusCode}: ${response.reasonPhrase}',
        uri: Uri.tryParse(url),
      );
    }

    // Get the JSON data from the response.
    final body = response.body;

    // Convert the body, a String, into a JSON object.
    // To do this, use Dart's built-in JSON decoder.
    // We know this returns a `List`, so we type-cast it into a `List<dynamic>`.
    final jsonData = json.decode(body) as List;

    // Convert every item in the list into a `Gunpla`.
    final gunplas =
        jsonData.map((jsonObject) => Gunpla.fromJson(jsonObject)).toList();

    return gunplas;
  }
}

class Gunpla {
  const Gunpla({
    @required this.id,
    @required this.name,
    @required this.series,
    @required this.flickrImages,
    @required this.scale,
    @required this.grade,
  });

  final String id;
  final String name;
  final String series;
  final List<String> flickrImages;
  final String scale;
  final String grade;

  factory Gunpla.fromJson(Map<String, dynamic> json) {
    return Gunpla(
      id: json['id'],
      name: json['name'],
      series: json['series'],
      flickrImages: List<String>.from(json['flickr_images']),
      scale: json['Scale'],
      grade: json['Grade'],
    );
  }
}
