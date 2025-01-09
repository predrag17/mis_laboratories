import 'package:flutter/material.dart';

class JokeCard extends StatelessWidget {
  final String jokeType;
  final VoidCallback onTap;

  const JokeCard({required this.jokeType, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            jokeType,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
