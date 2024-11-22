// lib/data/repositories/memory_repository.dart

import 'dart:async';
import '../models/recipe.dart';
import '../models/ingredient.dart';

// Define the repository interface
abstract class Repository {
  Stream<List<Recipe>> watchAllRecipes();
  Stream<List<Ingredient>> watchAllIngredients();
  Future<int> insertRecipe(Recipe recipe);
  Future<int> insertIngredients(List<Ingredient> ingredients);
}

// Memory-based implementation of the Repository
class MemoryRepository implements Repository {
  late Stream<List<Recipe>> _recipeStream;
  late Stream<List<Ingredient>> _ingredientStream;
  
  final StreamController<List<Recipe>> _recipeStreamController = StreamController<List<Recipe>>.broadcast();
  final StreamController<List<Ingredient>> _ingredientStreamController = StreamController<List<Ingredient>>.broadcast();
  
  List<Recipe> currentRecipes = [];
  List<Ingredient> currentIngredients = [];

  MemoryRepository() {
    _recipeStream = _recipeStreamController.stream;
    _ingredientStream = _ingredientStreamController.stream;
  }

  @override
  Stream<List<Recipe>> watchAllRecipes() {
    return _recipeStream;
  }

  @override
  Stream<List<Ingredient>> watchAllIngredients() {
    return _ingredientStream;
  }

  @override
  Future<int> insertRecipe(Recipe recipe) async {
    currentRecipes.add(recipe);
    _recipeStreamController.add(currentRecipes);
    return currentRecipes.length;
  }

  @override
  Future<int> insertIngredients(List<Ingredient> ingredients) async {
    currentIngredients.addAll(ingredients);
    _ingredientStreamController.add(currentIngredients);
    return currentIngredients.length;
  }
}
