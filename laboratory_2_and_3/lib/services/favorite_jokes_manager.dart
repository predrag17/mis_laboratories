import '../models/joke_model.dart';

class FavoriteJokesManager {
  static final FavoriteJokesManager _instance =
      FavoriteJokesManager._internal();

  final List<Joke> _favoriteJokes = [];

  FavoriteJokesManager._internal();

  static FavoriteJokesManager get instance => _instance;

  List<Joke> get favoriteJokes => _favoriteJokes;

  void addFavorite(Joke joke) {
    if (!_favoriteJokes.contains(joke)) {
      _favoriteJokes.add(joke);
    }
  }

  void removeFavorite(Joke joke) {
    _favoriteJokes.remove(joke);
  }

  bool isFavorite(Joke joke) {
    return _favoriteJokes.contains(joke);
  }
}
