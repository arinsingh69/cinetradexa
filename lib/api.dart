import 'dart:convert';
import 'package:http/http.dart' as http;
class MovieApi {
  static const String apiKey = 'ec9c74a8';
  static const String baseUrl = 'http://www.omdbapi.com/';
  static Future<List<dynamic>> fetchMovies(String query) async {
    final url = '$baseUrl?s=$query&apikey=$apiKey';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['Response'] == 'True') {
        return data['Search'];
      } else {
        return [];
      }
    } else {  throw Exception('Failed to load movies');
    }
  }
}
