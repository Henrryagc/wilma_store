import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:wilma_store/data/database/entity/product.dart';

class Products extends StatefulWidget {
  const Products({Key? key}) : super(key: key);

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {

  List<Product> products = List.from([
    /*Product(productName: "Data 2", id: null),
    Product(productName: "Data 1"),
    Product(productName: "Data 4"),
    Product(productName: "Data 6"),
    Product(productName: "Data 8"),
    Product(productName: "Data 2"),
    Product(productName: "Data 1"),
    Product(productName: "Data 4"),
    Product(productName: "Data 6"),
    Product(productName: "Data 8"),*/
  ]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CupertinoSearchTextField(
          placeholder: "Nombre Producto",
          placeholderStyle: TextStyle(
            color: Colors.white60
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            margin: const EdgeInsets.all(8.0),
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.abc),
                  title: Text(products[index].productName),
                  subtitle: const Text("Sub title"),
                ),
              ],
            ),
          );
        },

      ),
    );
  }
}

