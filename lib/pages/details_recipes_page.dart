import 'package:cocktail_fp/model/featured_cocktail.dart';
import 'package:cocktail_fp/helper/hive_boxes.dart';
import 'package:flutter/material.dart';

class DetailRecipesPage extends StatefulWidget {
  final FeaturedCocktail featuredCocktail;

  const DetailRecipesPage({Key? key, required this.featuredCocktail})
      : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailRecipesPage> {
  bool isSaved = false;

  @override
  void initState() {
    super.initState();
    checkIfSaved();
  }

  void checkIfSaved() {
    final savedRecipesBox = HiveBoxes.isSaved(widget.featuredCocktail.name);
    // final savedRecipes = savedRecipesBox.get(widget.featuredCocktail.name);
    setState(() {
      isSaved = savedRecipesBox;
    });
  }

  void saveRecipe() {
    HiveBoxes.saveRecipe(widget.featuredCocktail);
    setState(() {
      isSaved = true;
    });
  }

  void unsaveRecipe() {
    HiveBoxes.unSaveRecipe(widget.featuredCocktail.name);
    setState(() {
      isSaved = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(widget.featuredCocktail.name),
        actions: [
          IconButton(
            onPressed: () {
              isSaved ? unsaveRecipe() : saveRecipe();
            },
            icon: Icon(isSaved ? Icons.bookmark : Icons.bookmark_border),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.featuredCocktail.name,
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Ingredients",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              children: [
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: widget.featuredCocktail.ingredients.length,
                  itemBuilder: (context, index) {
                    return Text(widget.featuredCocktail.ingredients[index]);
                  },
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Instructions",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(widget.featuredCocktail.instructions),
          ],
        ),
      ),
    );
  }
}
