import 'dart:convert';
import 'dart:io';

import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

class Backend {
  const Backend(this.hostUrl);

  final String hostUrl;

  Future<List<Gunpla>> getGunplas() async {
    final url = '$hostUrl/Gunplas';

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

List<Gunpla> gunplaFromJson(String str) =>
    List<Gunpla>.from(json.decode(str).map((x) => Gunpla.fromJson(x)));

String gunplaToJson(List<Gunpla> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Gunpla {
  Gunpla({
    this.userId,
    this.id,
    this.image,
    this.name,
    this.series,
    this.grade,
    this.scale,
  });

  int userId;
  int id;
  String image;
  String name;
  String series;
  String grade;
  String scale;

  factory Gunpla.fromJson(Map<String, dynamic> json) => Gunpla(
        userId: json["userId"],
        id: json["id"],
        image: json["image"] == null ? null : json["image"],
        name: json["name"],
        series: json["series"],
        grade: json["grade"],
        scale: json["scale"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "image": image == null ? null : image,
        "name": name,
        "series": series,
        "grade": grade,
        "scale": scale,
      };
}
