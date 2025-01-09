import 'package:flutter/material.dart';
import 'package:laboratory_2/screens/favourite_jokes_screen.dart';
import 'package:laboratory_2/screens/joke_detail_screen.dart';
import '../models/joke_model.dart';
import '../services/api_services.dart';
import '../services/favorite_jokes_manager.dart';

class JokesByTypeScreen extends StatelessWidget {
  final String type;

  const JokesByTypeScreen({required this.type, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$type Jokes'),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FavoriteJokesScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: FutureBuilder<List<Joke>>(
        future: ApiService.fetchJokesByType(type),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final jokes = snapshot.data!;
            return ListView.builder(
              itemCount: jokes.length,
              itemBuilder: (context, index) {
                final joke = jokes[index];
                final isFavorite =
                    FavoriteJokesManager.instance.isFavorite(joke);

                return Card(
                  child: ListTile(
                    title: Text(joke.setup),
                    subtitle: Text(joke.punchline),
                    trailing: IconButton(
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite ? Colors.red : null,
                      ),
                      onPressed: () {
                        if (isFavorite) {
                          FavoriteJokesManager.instance.removeFavorite(joke);
                        } else {
                          FavoriteJokesManager.instance.addFavorite(joke);
                        }
                        // Force UI refresh
                        (context as Element).markNeedsBuild();
                      },
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => JokeDetailScreen(joke: joke),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
