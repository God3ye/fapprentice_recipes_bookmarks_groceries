import 'package:http/http.dart';

const String apiKey = '0bc5cf408381b4def559f836fbef7e7d';
const String apiID = '88b96790';
const String apiUrl = 'https://api.edamam.com/search';

class RecipeService {
  Future getData(String url) async {
    print('calling url: $url');
    final response = await get(Uri.parse(url));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      print(response.statusCode);
    }
  }

  Future<dynamic> getRecipes(String query, int from, int to) async {
    final recipeData = await getData(
        '$apiUrl?app_id=$apiID&app_key=$apiKey&q=$query&from=$from&to=$to');
    return recipeData;
  }
}
