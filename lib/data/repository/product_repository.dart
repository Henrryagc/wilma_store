import 'package:flutter/cupertino.dart';
import 'package:wilma_store/data/database/entity/product.dart';
import 'package:wilma_store/data/database/db_wilma_store.dart';

import '../database/entity/product.dart';

class ProductRepository {
   Future<void> insertProduct() async {
     // WidgetsFlutterBinding.ensureInitialized();
    /*final database = await $FloorDbWilmaStore
        .databaseBuilder('db_wilma_store')
        .build();
    final productDao = database.productDao;
    final product = Product(productName: 'product name', iconPath: 'pathh c', productTypeId: 1);
    await productDao.insertP(product);
    final result = await productDao.findAllProducts();
    for (var element in result) {
      debugPrint(element.productName);
    }*/
   }
}
