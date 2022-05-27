import 'package:floor/floor.dart';

@entity
class Product {
  @primaryKey
  final int id;
  final String productName;
  final String created;
  final String iconPath;
  final int productTypeId;

  Product({
    required this.created,
    required this.iconPath,
    required this.productTypeId,
    required this.id,
    required this.productName });

  String getName() {
    return productName;
  }
}
