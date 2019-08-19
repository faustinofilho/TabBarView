import 'package:exemplos/http/categoria_http.dart';
import 'package:flutter/material.dart';
import '../model/product.dart';
import '../widgets/category_widget.dart';
import '../widgets/product_widget.dart';
import '../model/category.dart';

class ShowProductScreen extends StatefulWidget {
  @override
  _ShowProductScreenState createState() => _ShowProductScreenState();
}

class _ShowProductScreenState extends State<ShowProductScreen> with TickerProviderStateMixin {
  List<Category> categoryList = List();

  TabController _tabController;

  @override
  void initState() {
    super.initState();

    //Add data

//    Future future = CategoryHttp.getCategories();


    for (int i = 0; i < 5; i++) {

      List<Product> productList = List();
      for (int j = 0; j < 50; j++) {
        Product product = Product(
          productId: "$i-$j",
          price: "${(j + 1) * 10}",
          name: "Product $i-$j",
          image: "assets/image.jpg"
        );

        productList.add(product);
      }

      Category category = Category(
        id: "$i",
        tipo: "Category $i",
//        image: "assets/image.jpg",
        productList: productList,
      );

      categoryList.add(category);
    }

    _tabController = TabController(vsync: this, length: categoryList.length);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
//        titleSpacing: 0.0,
        title: Text('Promoção na mão'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: _body()
    );
  }

  _body() {

      return Column(
        children: <Widget>[
          Container(
            height: 70.0,
            padding: EdgeInsets.all(8),
            child: TabBar(
              controller: _tabController,
              isScrollable: true,
              tabs: categoryList.map((Category category) {
                return CategoryWidget(
                  category: category,
                );
              }).toList(),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(5.0),
              child: TabBarView(
                controller: _tabController,
                children: categoryList.map((Category category) {
                  return Container(
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: 4 / 3,
                      controller: ScrollController(keepScrollOffset: false),
                      scrollDirection: Axis.vertical,
                      children: category.productList.map(
                          (Product product) {
                            return ProductWidget(
                              product: product,
                            );
                        },
                      ).toList(),
                    ),
                  );
                }).toList(),
              ),
            ),
          )
        ],
      );
  }
}