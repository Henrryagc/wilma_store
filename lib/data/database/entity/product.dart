import 'package:floor/floor.dart';

@entity
class Product {
  @PrimaryKey(autoGenerate: true)
   final int? id;
   final String productName;
   final String created = DateTime.now().toUtc().toString();
   final String iconPath;
   final int productTypeId;

  Product( {
    this.id,
    required this.iconPath,
    required this.productTypeId,
    required this.productName
    });

  String getName() {
    return productName;
  }
}
