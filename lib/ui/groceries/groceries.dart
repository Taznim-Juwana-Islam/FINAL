import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_streams_lab/ui/providers.dart'; // Import the providers
import 'package:flutter_streams_lab/data/models/ingredient.dart'; // Import the Ingredient model
import 'package:flutter_streams_lab/data/repository.dart'; // Import the Repository

class GroceriesScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Access the repository using the provider
    final repository = ref.read(repositoryProvider);

    return Scaffold(
      appBar: AppBar(title: Text("Groceries")),
      body: StreamBuilder<List<Ingredient>>(
        stream: repository.getIngredientsStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No ingredients available.'));
          }

          final ingredients = snapshot.data!;

          return ListView.builder(
            itemCount: ingredients.length,
            itemBuilder: (context, index) {
              final ingredient = ingredients[index];
              return ListTile(
                title: Text(ingredient.name),
                subtitle: Text('Quantity: ${ingredient.quantity}'),
              );
            },
          );
        },
      ),
    );
  }
}
