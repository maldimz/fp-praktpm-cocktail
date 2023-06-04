import 'dart:io';

import 'package:cocktail_fp/model/featured_cocktail.dart';
import 'package:hive/hive.dart';

class HiveBoxes {
  static const String savedRecipesBox = 'saved_recipes';

  static Future<void> initHive() async {
    // var path = Directory.current.path;
    Hive
      // ..init(path)
      ..registerAdapter(FeaturedCocktailAdapter());

    await Hive.openBox(savedRecipesBox);
    // await Hive.openBox<List<String>>(savedRecipesBox);
  }

  // static Box<List<String>> getSavedRecipesBox() {
  //   return Hive.box<List<String>>(savedRecipesBox);
  // }

  static void saveRecipe(FeaturedCocktail featuredCocktail) async {
    var box = await Hive.openBox(savedRecipesBox);
    // var cocktail = featuredCocktail;
    await box.put(featuredCocktail.name, featuredCocktail);
  }

  static void unSaveRecipe(String name) async {
    var box = await Hive.openBox(savedRecipesBox);
    await box.delete(name);
  }

  static List<FeaturedCocktail> getSavedRecipes() {
    var box = Hive.box(savedRecipesBox);
    return box.values.toList().cast<FeaturedCocktail>();
  }

  static bool isSaved(String name) {
    try {
      var box = Hive.box(savedRecipesBox);
      var cocktail = box.get(name);
      if (cocktail == null) {
        return false;
      }
      return true;
    } catch (e) {
      return false;
    }
  }
}
