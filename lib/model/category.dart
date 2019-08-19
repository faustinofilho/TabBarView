
import 'product.dart';

class Category {
  String id;
  String tipo;
  String image;

  List<Product> productList;

  Category({this.id, this.tipo, this.productList});


  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      tipo: json['tipo']
    );
  }

  @override
  String toString() {
    return "Category[$id]: $tipo";
  }

//  static fromJSON(data) {}

}