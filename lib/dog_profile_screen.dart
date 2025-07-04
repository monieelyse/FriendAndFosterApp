import 'package:flutter/material.dart';
import 'models/dog.dart';
import 'widgets/rent_form.dart';

class DogProfileScreen extends StatelessWidget {
  final Dog dog;

  const DogProfileScreen({super.key, required this.dog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(dog.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(
              dog.imageUrl,
              height: 250,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dog.name,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 4),
                  Text('${dog.breed}, ${dog.age} years old'),
                  const SizedBox(height: 16),
                  Text(
                    dog.description,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 20),
                  Text('📍 Located in ${dog.location}'),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                        ),
                        builder: (_) => RentForm(dog: dog),
                      );
                    },
                    child: const Text('Apply to Foster / Adopt'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
