import 'package:flutter_modular/flutter_modular.dart';
import 'package:wilma_store/screens/home/home.dart';
import 'package:wilma_store/service/product_service.dart';

import '../data/database/db_wilma_store.dart';

class AppModule extends Module {
  static const dataBaseName = "db_wilma_store";
  @override
  List<Bind> get binds => [
    Bind.factory((i) => $FloorDbWilmaStore
        .databaseBuilder(dataBaseName)
        .build()),
    Bind.singleton((i) => ProductService())
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => const Home(title: 'Home'))
  ];
}