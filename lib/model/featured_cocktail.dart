import 'package:hive/hive.dart';
part 'featured_cocktail.g.dart';

@HiveType(typeId: 0)
class FeaturedCocktail {
  @HiveField(0)
  List<String> ingredients;
  @HiveField(1)
  String instructions;
  @HiveField(2)
  String name;

  FeaturedCocktail({
    required this.ingredients,
    required this.instructions,
    required this.name,
  });

  factory FeaturedCocktail.fromJson(Map<String, dynamic> json) {
    List<String> ingredients = List<String>.from(json["ingredients"] ?? []);
    return FeaturedCocktail(
      ingredients: ingredients,
      instructions: json["instructions"],
      name: json["name"],
    );
  }

  Map<String, dynamic> toJson() => {
        "ingredients": List<dynamic>.from(ingredients.map((x) => x)),
        "instructions": instructions,
        "name": name,
      };
}
