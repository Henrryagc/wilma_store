import 'package:flutter/cupertino.dart';

import '../database/db_wilma_store.dart';
import '../database/entity/product.dart';

class AppDatabaseModule {

  Future<void> initialize() async {
    final database = await $FloorDbWilmaStore
        .databaseBuilder('db_wilma_store')
        .build();
    final productDao = database.productDao;
    final product = Product(productName: 'product name', iconPath: 'pathh c', productTypeId: 1);
    await productDao.insertP(product);
    final result = await productDao.findAllProducts();
    for (var element in result) {
      debugPrint(element.productName);
    }
}

}