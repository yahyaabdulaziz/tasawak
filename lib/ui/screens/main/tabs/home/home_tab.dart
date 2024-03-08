import 'package:flutter/material.dart';
import 'package:tasawak/data/model/response/category_dm.dart';
import 'package:tasawak/data/model/response/product_dm.dart';
import 'package:tasawak/ui/widgets/category_item.dart';
import 'package:tasawak/ui/widgets/product.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Widget buildProductsListView(List<ProductDM> data) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Product(data[index]);
        });
  }

  Widget buildCategoriesGridView(List<CategoryDM> data) {
    return GridView.builder(
        itemCount: data.length,
        scrollDirection: Axis.horizontal,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return CategoryItem(data[index]);
        });
  }
}
