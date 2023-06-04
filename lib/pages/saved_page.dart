import 'package:cocktail_fp/helper/hive_boxes.dart';
import 'package:cocktail_fp/model/featured_cocktail.dart';
import 'package:cocktail_fp/pages/details_recipes_page.dart';
import 'package:flutter/material.dart';

class SavedPage extends StatefulWidget {
  const SavedPage({Key? key}) : super(key: key);

  @override
  _SavedPageState createState() => _SavedPageState();
}

class _SavedPageState extends State<SavedPage> {
  var savedRecipesBox = HiveBoxes.getSavedRecipes();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Saved Recipes ●',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: savedRecipesBox.length,
                itemBuilder: (context, index) {
                  // final recipeIngredients = savedRecipes[index];
                  FeaturedCocktail featuredCocktail = savedRecipesBox[index];
                  return GestureDetector(
                    onTap: () async {
                      await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailRecipesPage(
                                featuredCocktail: featuredCocktail),
                          ));
                      setState(() {
                        savedRecipesBox = HiveBoxes.getSavedRecipes();
                      });
                    },
                    child: Card(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                        ),
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Recipe ${featuredCocktail.name}',
                              style: const TextStyle(fontSize: 18),
                            ),
                            const SizedBox(height: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: (featuredCocktail.ingredients)
                                  .map((ingredient) =>
                                      Text(ingredient.toString()))
                                  .toList(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
