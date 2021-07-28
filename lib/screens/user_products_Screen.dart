import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_shop_practice/screens/edit_product_screen.dart';
import 'package:the_shop_practice/utilities/providers/products_provider.dart';
import 'package:the_shop_practice/utilities/widgets/app_drawer.dart';
import 'package:the_shop_practice/utilities/widgets/user_product_item.dart';

class UserProductsScreen extends StatelessWidget {
  // const UserProductsScreen({ Key? key }) : super(key: key);
  static const routeName = "/userProduct";
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Products'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(EditProductScreen.routeName);
            },
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: productData.items.length,
          itemBuilder: (_, i) => Column(
            children: [
              UserProductItem(
                  imageUrl: productData.items[i].imageUrl,
                  title: productData.items[i].title),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}