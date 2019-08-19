import 'dart:async';
import 'dart:convert';

import '../model/category.dart';
import 'package:http/http.dart' as http;

class CategoryHttp {
  static Future<List<Category>> getCategories() async {

    final url = "http://livrowebservices.com.br/rest/carros";
    final response = await http.get(url);
    final mapCategory = json.decode(response.body).cast<Map<String, dynamic>>();
    final categories = mapCategory.map<Category>((json) => Category.fromJson(json)).toList();

    return categories;
  }







/*static List<Carro> getCarrosFake() {
    final carros = List.generate(50, (idx) {
      var url =
          "http://www.livroandroid.com.br/livro/carros/esportivos/Ferrari_FF.png";
      return Carro("Ferrari $idx", url);
    },);
    return carros;
  }*/
}