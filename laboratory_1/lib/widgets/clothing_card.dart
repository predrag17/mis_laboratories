import 'package:flutter/material.dart';
import '../models/clothing_item.dart';
import '../screens/detail_screen.dart';

class ClothingCard extends StatelessWidget {
  final ClothingItem item;

  ClothingCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: ListTile(
        leading: Image.network(item.imageUrl),
        title: Text(item.name),
        subtitle: Text('\$${item.price}'),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailScreen(item: item),
            ),
          );
        },
      ),
    );
  }
}
