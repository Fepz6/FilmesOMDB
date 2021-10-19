import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:FilmesOMDB/page/JSON_movie.dart';
import 'package:FilmesOMDB/page/JSON_info.dart';




Future<List<Movie>> searchMovies(key) async {
  final response = await http.get('http://www.omdbapi.com/?apikey=b3838adb&i=&s=$key');

  if (response.statusCode == 200) {
    Map data = json.decode(response.body);

    if (data['Response'] == "True") {
      var list = (data['Search'] as List).map((item) => Movie.fromJson(item)).toList();
      return list;
    } else {
      throw Exception(data['Error']);
    }
  } else {
    throw Exception('Something went wrong !');
  }
}

Future<MovieInfo> getMovie(movieId) async {
  final response = await http.get('http://www.omdbapi.com/?apikey=b3838adb&i=$movieId');

  if (response.statusCode == 200) {
    Map data = json.decode(response.body);

    if (data['Response'] == "True") {
      return MovieInfo.fromJSON(data);
    } else {
      throw Exception(data['Error']);
    }
  } else {
    throw Exception('Something went wrong !');
  }
}

