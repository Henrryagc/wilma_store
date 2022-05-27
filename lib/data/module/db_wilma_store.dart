import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:wilma_store/data/dao/product_dao.dart';
import 'package:wilma_store/data/dao/product_type_dao.dart';
import 'package:wilma_store/data/entity/product_type.dart';
import 'package:wilma_store/data/entity/product.dart';

part 'db_wilma_store.g.dart';

@Database(version: 1, entities: [Product, ProductType])
abstract class DbWilmaStore extends FloorDatabase {
  ProductDao get productDao;
  ProductTypeDao get productTypeDao;
}