import 'dart:math';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../constants/constants.dart';
import '../models/comic.dart';

const String latestComic = '$ApiUri/$ApiUriPredicate';

Future<Comic> fetchById({int id = 1}) async {
  if (id < 1) id = 1;

  final search = '$ApiUri/$id/$ApiUriPredicate';
  final response = await http.get(search);

  if (response.statusCode == 200) {
    return Comic.fromJson(json.decode(response.body));
  } else if (response.statusCode == 404) {
    return Comic.notFound();
  } else {
    throw Exception('Unable to get the comic');
  }
}

Future<Comic> fetchRandom(int latest) async =>
    fetchById(id: (Random().nextInt(latest) + 1));

Future<Comic> fetchFirst() async => fetchById();

Future<Comic> fetchCurrent() async {
  final response = await http.get(latestComic);

  if (response.statusCode == 200) {
    return Comic.fromJson(json.decode(response.body));
  } else if (response.statusCode == 404) {
    return Comic.notFound();
  } else {
    throw Exception('${response.statusCode}: Unable to get the comic');
  }
}
