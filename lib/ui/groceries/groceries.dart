// lib/ui/groceries/groceries.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_streams_lab/ui/providers.dart';
import 'package:flutter_streams_lab/ui/models/ingredient.dart';

class GroceriesPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repository = ref.watch(repositoryProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Groceries')),
      body: StreamBuilder<List<Ingredient>>(
        stream: repository.getIngredientsStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          final ingredients = snapshot.data ?? [];
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
