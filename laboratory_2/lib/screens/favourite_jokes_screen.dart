import 'package:flutter/material.dart';
import '../services/favorite_jokes_manager.dart';

class FavoriteJokesScreen extends StatelessWidget {
  const FavoriteJokesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteJokes = FavoriteJokesManager.instance.favoriteJokes;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Jokes'),
      ),
      body: favoriteJokes.isEmpty
          ? const Center(child: Text('No favorite jokes yet!'))
          : ListView.builder(
              itemCount: favoriteJokes.length,
              itemBuilder: (context, index) {
                final joke = favoriteJokes[index];
                return Card(
                  child: ListTile(
                    title: Text(joke.setup),
                    subtitle: Text(joke.punchline),
                  ),
                );
              },
            ),
    );
  }
}
