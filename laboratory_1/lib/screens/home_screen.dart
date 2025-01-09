import 'package:flutter/material.dart';
import '../models/clothing_item.dart';
import '../widgets/clothing_card.dart';

class HomeScreen extends StatelessWidget {
  final List<ClothingItem> items = [
    ClothingItem(
      name: 'Јакна',
      imageUrl: 'assets/images/jacket.jpg',
      description: 'Топла зимска јакна со капуљача.',
      price: 49.99,
    ),
    ClothingItem(
      name: 'Фармерки',
      imageUrl: 'assets/images/jeans.jpg',
      description: 'Класични сини фармерки.',
      price: 34.99,
    ),
    ClothingItem(
      name: 'Патики',
      imageUrl: 'assets/images/sneakers.jpg',
      description: 'Удобни спортски патики за секојдневна употреба.',
      price: 59.99,
    ),
    ClothingItem(
      name: 'Капа',
      imageUrl: 'assets/images/hat.jpg',
      description: 'Памучна капа за заштита од сонце.',
      price: 9.99,
    ),
    ClothingItem(
      name: 'Шал',
      imageUrl: 'assets/images/scarf.jpg',
      description: 'Мек и топол шал за зимски денови.',
      price: 14.99,
    ),
    ClothingItem(
      name: 'Чизми',
      imageUrl: 'assets/images/boots.jpg',
      description: 'Водоотпорни чизми идеални за дождливо време.',
      price: 69.99,
    ),
    ClothingItem(
      name: 'Кошула',
      imageUrl: 'assets/images/shirt.jpg',
      description: 'Елегантна бела кошула со долги ракави.',
      price: 24.99,
    ),
    ClothingItem(
      name: 'Палто',
      imageUrl: 'assets/images/coat.jpg',
      description: 'Класично палто од волна.',
      price: 89.99,
    ),
    ClothingItem(
      name: 'Пижами',
      imageUrl: 'assets/images/pyjamas.jpg',
      description: 'Удобни памучни пижами за добар сон.',
      price: 19.99,
    ),
    ClothingItem(
      name: 'Ракавици',
      imageUrl: 'assets/images/gloves.jpg',
      description: 'Топли ракавици со меко внатрешно обложување.',
      price: 12.99,
    ),
  ];

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('213220')),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ClothingCard(item: items[index]);
        },
      ),
    );
  }
}
