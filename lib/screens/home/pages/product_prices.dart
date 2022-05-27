import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductPrices extends StatefulWidget {
  const ProductPrices({Key? key}) : super(key: key);

  @override
  State<ProductPrices> createState() => _ProductPricesState();
}

class _ProductPricesState extends State<ProductPrices> {

  String data = "Hola ";
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          children: [
            Text("$data $counter"),
            TextButton(onPressed: () {
              setState(() {
                counter += 1;
              });
            },
            child: const Text("Push Me"),)
          ],
        ),
      );
  }
}
