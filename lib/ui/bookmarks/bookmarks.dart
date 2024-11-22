import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_streams_lab/ui/providers.dart'; // Import the providers
import 'package:flutter_streams_lab/data/models/recipe.dart'; // Import the Recipe model
import 'package:flutter_streams_lab/data/repository.dart'; // Import the Repository

class BookmarksScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Access the repository using the provider
    final repository = ref.read(repositoryProvider);

    return Scaffold(
      appBar: AppBar(title: Text("Bookmarks")),
      body: StreamBuilder<List<Recipe>>(
        stream: repository.getRecipesStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No recipes available.'));
          }

          final recipes = snapshot.data!;

          return ListView.builder(
            itemCount: recipes.length,
            itemBuilder: (context, index) {
              final recipe = recipes[index];
              return ListTile(
                title: Text(recipe.name),
                subtitle: Text(recipe.description),
              );
            },
          );
        },
      ),
    );
  }
}
