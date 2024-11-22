import 'dart:async';
import 'models/recipe.dart';
import 'models/ingredient.dart';

class Repository {
  // Example stream to simulate getting recipes
  Stream<List<Recipe>> getRecipesStream() {
    return Stream.periodic(Duration(seconds: 2), (count) {
      return List.generate(count + 1, (index) {
        return Recipe(name: 'Recipe $index', description: 'Description of recipe $index');
      });
    });
  }

  // Example stream to simulate getting ingredients
  Stream<List<Ingredient>> getIngredientsStream() {
    return Stream.periodic(Duration(seconds: 2), (count) {
      return List.generate(count + 1, (index) {
        return Ingredient(name: 'Ingredient $index', quantity: index.toDouble());
      });
    });
  }
}
