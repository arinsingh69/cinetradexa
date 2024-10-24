import 'package:flutter/material.dart';
import '../api.dart';
class MovieProvider extends ChangeNotifier {
  List<dynamic>? _movies = [];
  bool _isLoading = false;
  List<dynamic>? get movies => _movies;
  bool get isLoading => _isLoading;
  Future<void> searchMovies(String query) async {
    _isLoading = true;
    notifyListeners();
    try {_movies = await MovieApi.fetchMovies(query);
    } catch (e) {_movies = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
