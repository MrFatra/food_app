import 'dart:convert';
import 'package:food_app/model/list_food.dart';
import 'package:http/http.dart' as http;

class FoodAPI {
  static Future<List<Food>> getFood() async {
    var uri = Uri.https('tasty.p.rapidapi.com', '/recipes/list',
        {"from": "0", "size": "10", "tags": "under_30_minutes"});

    final response = await http.get(uri, headers: {
      "x-rapidapi-key": "494914a346mshc158e5dbb8a4c86p124d54jsn9aeae76a8f6c",
      "x-rapidapi-host": "tasty.p.rapidapi.com",
      "useQueryString": "true"
    });

    Map jsonResponse = jsonDecode(response.body);

    List temp = [];

    for (var index in jsonResponse['results']) {
      temp.add(index);
    }

    return Food.foodFromSnapshot(temp);
  }

  static Future<List<Food>> getFoodRecomendation() async {
    var uri = Uri.https('tasty.p.rapidapi.com', '/recipes/list',
        {"from": "10", "size": "6", "tags": "under_30_minutes"});

    final response = await http.get(uri, headers: {
      "X-RapidAPI-Key": "494914a346mshc158e5dbb8a4c86p124d54jsn9aeae76a8f6c",
      "X-RapidAPI-Host": "tasty.p.rapidapi.com",
      "useQueryString": "true"
    });

    Map jsonResponse = jsonDecode(response.body);

    List temp = [];

    for (var index in jsonResponse['results']) {
      temp.add(index);
    }

    return Food.foodFromSnapshot(temp);
  }
}
