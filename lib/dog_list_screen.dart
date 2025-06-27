import 'package:flutter/material.dart';
import '../data/mock_dogs.dart';
import 'widgets/dog_card.dart';

class DogListScreen extends StatelessWidget {
  const DogListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Adoptable Dogs')),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: mockDogs.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemBuilder: (context, index) => DogCard(dog: mockDogs[index]),
      ),
    );
  }
}
