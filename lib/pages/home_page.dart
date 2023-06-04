import 'package:cocktail_fp/helper/featured_cocktail_helper.dart';
import 'package:cocktail_fp/model/featured_cocktail.dart';
import 'package:cocktail_fp/pages/details_recipes_page.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          padding: const EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Hello there"),
              const SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: const Text(
                      "What would you like to drink for today ●",
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Card(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                  ),
                  padding: const EdgeInsets.all(15),
                  child: const Text(
                    'We provide thousands of cocktail recipes that will help you create a drik that suits your mood anyday and anytime',
                    style: TextStyle(height: 1.8),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Featured',
                style: TextStyle(fontSize: 24),
              ),
              const SizedBox(
                height: 20,
              ),
              Flexible(
                child: FutureBuilder(
                  future: FeaturedCocktailApi().getFeaturedCocktail(),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.data == null) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (!snapshot.hasData) {
                      return const Center(
                        child: Text('No data'),
                      );
                    } else {
                      return GridView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            childAspectRatio: 3 / 2,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 5),
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          FeaturedCocktail featuredCocktail = snapshot.data[index];
                          return Card(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                              ),
                              padding: const EdgeInsets.all(15),
                              child: ListTile(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => DetailRecipesPage(
                                            featuredCocktail: featuredCocktail),
                                      ));
                                },
                                title: Text(featuredCocktail.name),
                              ),
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              )
            ],
          ),
        ));
  }
}

