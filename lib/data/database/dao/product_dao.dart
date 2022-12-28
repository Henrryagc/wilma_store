import 'package:floor/floor.dart';

import '../entity/product.dart';

@dao
abstract class ProductDao {
  @Query('SELECT * FROM Product')
  Future<List<Product>> findAllProducts();

  @Query('SELECT * FROM Person WHERE id = :id')
  Stream<Product?> findProductById(int id);

  @insert
  Future<void> insertP(Product product);
}