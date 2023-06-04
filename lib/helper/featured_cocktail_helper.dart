import 'dart:convert';

import 'package:cocktail_fp/model/featured_cocktail.dart';
import 'package:http/http.dart' as http;

class FeaturedCocktailApi {
  Future<List> getFeaturedCocktail() async {
    var url =
        Uri.parse('https://api.api-ninjas.com/v1/cocktail?ingredients=vodka');
    var response = await http.get(url,
        headers: {'X-Api-Key': 'Mf4I1xMHFcV1Q9TZmdJLqQ==phB9X8w2eIpDHZwy'});

    var data = jsonDecode(utf8.decode(response.bodyBytes));

    List<FeaturedCocktail> cocktails = [];
    for (var item in data) {
      if (data != null) {
        var cocktail = FeaturedCocktail.fromJson(item);
        cocktails.add(cocktail);
      }
    }
    return cocktails;
  }

  Future<List> getCocktails(String value, int code) async {
    var param = 'name';
    if (code == 2) {
      param = 'ingredients';
    }
    var url =
        Uri.parse('https://api.api-ninjas.com/v1/cocktail?$param=$value');
    var response = await http.get(url,
        headers: {'X-Api-Key': 'Mf4I1xMHFcV1Q9TZmdJLqQ==phB9X8w2eIpDHZwy'});

    var data = jsonDecode(utf8.decode(response.bodyBytes));

    List<FeaturedCocktail> cocktails = [];
    for (var item in data) {
      if (data != null) {
        var cocktail = FeaturedCocktail.fromJson(item);
        cocktails.add(cocktail);
      }
    }
    return cocktails;
  }
}
