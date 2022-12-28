import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:wilma_store/data/repository/product_repository.dart';
import 'package:wilma_store/screens/home/pages/product_catalog/products/products.dart';
import 'package:wilma_store/service/product_service.dart';

class ProductCatalog extends StatefulWidget {
  const ProductCatalog({Key? key}) : super(key: key);

  @override
  State<ProductCatalog> createState() => _ProductCatalogState();
}

class _ProductCatalogState extends State<ProductCatalog> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final productService = Modular.get<ProductService>();
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 4.0,
      children:  [
        Card(
          elevation: 16.0,
          child: InkWell(
            onTap: () {
              debugPrint("Log Printed");
              Navigator.push(context, MaterialPageRoute(builder: (context) => const Products()));
            },
            child: SizedBox(
              width: 180,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const <Widget>[
                  ListTile(
                    leading: Icon(Icons.album),
                    title: Text('Licores'),
                    subtitle: Text('Lista de Licores y su Precio'),
                  ),
                ],
              ),
            ),
          ),
        ),
        Card(
          elevation: 16.0,
          child: InkWell(
            onTap: () {
              debugPrint("Log Printed");
              // final productRepo = ProductRepository();
              // productRepo.insertProduct();

               productService.insert();
               productService.selectAll();

            },
            child: SizedBox(
              width: 180,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const <Widget>[
                  ListTile(
                    leading: Icon(Icons.album),
                    title: Text('The Enchanted Nightingale'),
                    subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
                  ),
                ],
              ),
            ),
          ),
        ),
        const Chip(
          avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('ML')),
          label: Text('Lafayette'),
        ),
        const Chip(
          avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('HM')),
          label: Text('Mulligan'),
        ),
        const Chip(
          avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('JL')),
          label: Text('Laurens'),
        ),
      ],
    );
  }
}
