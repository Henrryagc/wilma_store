import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'dao/product_type_dao.dart';
import 'dao/product_dao.dart';
import 'entity/product.dart';
import 'entity/product_type.dart';

part '../database/db_wilma_store.g.dart';

@Database(version: 2, entities: [Product, ProductType])
abstract class DbWilmaStore extends FloorDatabase {
  ProductDao get productDao;
  ProductTypeDao get productTypeDao;
}