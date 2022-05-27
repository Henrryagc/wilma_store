import 'package:flutter/cupertino.dart';
import 'package:wilma_store/data/entity/product.dart';
import 'package:wilma_store/data/module/db_wilma_store.dart';

class ProductRepository {

   Future<void> insertProduct() async {
    final database = await $FloorDbWilmaStore.databaseBuilder('db_wilma_store').build();
    final productDao = database.productDao;
    final product = Product(created: 'created', iconPath: "iconPath", productTypeId: 1, id: 0, productName: "productName");
    await productDao.insertP(product);
    final result = await productDao.findAllProducts();
    for (var element in result) {
      debugPrint(element.productName);
    }
   }
}