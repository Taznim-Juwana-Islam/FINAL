// lib/ui/bookmarks/bookmarks.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_streams_lab/ui/providers.dart';
import 'package:flutter_streams_lab/ui/models/recipe.dart';

class BookmarksPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Access the repository provider
    final repository = ref.watch(repositoryProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Bookmarks')),
      body: StreamBuilder<List<Recipe>>(
        stream: repository.getRecipesStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          final recipes = snapshot.data ?? [];
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
