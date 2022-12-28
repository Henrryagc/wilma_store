import 'package:floor/floor.dart';

@entity
class ProductType {
  @primaryKey
  final int id;
  final String productTypeName;
  final String created;

  ProductType({required this.id, required this.productTypeName, required this.created});
}