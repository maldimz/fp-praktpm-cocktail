import 'package:cocktail_fp/helper/featured_cocktail_helper.dart';
import 'package:cocktail_fp/model/featured_cocktail.dart';
import 'package:cocktail_fp/pages/details_recipes_page.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  int _code = 1;

  List<DropdownMenuItem<int>> get dropdownItems {
    List<DropdownMenuItem<int>> menuItems = [
      const DropdownMenuItem(value: 1, child: Text("name")),
      const DropdownMenuItem(value: 2, child: Text("ingredients")),
    ];
    return menuItems;
  }

  String value = '';
  @override
  Widget build(BuildContext context) {
    if (value == '') {
      return Expanded(
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('We will give you the best drink recipe ●',
                    style: TextStyle(fontSize: 24)),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    onSubmitted: (value) {
                      setState(() {
                        this.value = value;
                      });
                    },
                    decoration: const InputDecoration(
                        hintText: 'Search for any recipes',
                        prefixIcon: Icon(Icons.search),
                        border: InputBorder.none),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text('keysearch : name / ingredients'),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey[200],
                  ),
                  child: DropdownButton(
                    value: _code,
                    items: dropdownItems,
                    dropdownColor: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    onChanged: (int? value) {
                      setState(() {
                        _code = value!;
                      });
                    },
                  ),
                ),
              ],
            ),
          ));
    }
    return Expanded(
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('We will give you the best drink recipe ●',
                  style: TextStyle(fontSize: 24)),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  onSubmitted: (value) {
                    setState(() {
                      this.value = value;
                    });
                  },
                  decoration: const InputDecoration(
                      hintText: 'Search for any recipes',
                      prefixIcon: Icon(Icons.search),
                      border: InputBorder.none),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text('keysearch : name / ingredients'),
              const SizedBox(
                height: 5,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey[200],
                ),
                child: DropdownButton(
                  value: _code,
                  items: dropdownItems,
                  dropdownColor: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  onChanged: (int? value) {
                    setState(() {
                      _code = value!;
                    });
                  },
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Flexible(
                child: FutureBuilder(
                  future: FeaturedCocktailApi().getCocktails(value, _code),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.data == null) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (!snapshot.hasData) {
                      return const Center(
                        child: Text('No Data'),
                      );
                    } else {
                      return ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          FeaturedCocktail cocktail = snapshot.data[index];
                          return Card(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                              ),
                              child: ListTile(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => DetailRecipesPage(
                                            featuredCocktail: cocktail),
                                      ));
                                },
                                title: Text(cocktail.name),
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