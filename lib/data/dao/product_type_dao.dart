import 'package:floor/floor.dart';
import 'package:wilma_store/data/entity/product_type.dart';

abstract class ProductTypeDao {
  @Query('SELECT * FROM ProductType')
  Future<List<ProductType>> findAllProductType();

  @Query('SELECT * FROM ProductType WHERE id = :id')
  Stream<ProductType?> findProductTypeById(int id);

  @insert
  Future<void> insertProductType(ProductType productType);
}