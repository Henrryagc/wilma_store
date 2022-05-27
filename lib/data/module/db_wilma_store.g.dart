// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_wilma_store.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorDbWilmaStore {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$DbWilmaStoreBuilder databaseBuilder(String name) =>
      _$DbWilmaStoreBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$DbWilmaStoreBuilder inMemoryDatabaseBuilder() =>
      _$DbWilmaStoreBuilder(null);
}

class _$DbWilmaStoreBuilder {
  _$DbWilmaStoreBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$DbWilmaStoreBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$DbWilmaStoreBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<DbWilmaStore> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$DbWilmaStore();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$DbWilmaStore extends DbWilmaStore {
  _$DbWilmaStore([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  ProductDao? _productDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Product` (`id` INTEGER NOT NULL, `productName` TEXT NOT NULL, `created` TEXT NOT NULL, `iconPath` TEXT NOT NULL, `productTypeId` INTEGER NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `ProductType` (`id` INTEGER NOT NULL, `productTypeName` TEXT NOT NULL, `created` TEXT NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  ProductDao get productDao {
    return _productDaoInstance ??= _$ProductDao(database, changeListener);
  }

  @override
  ProductTypeDao get productTypeDao => throw UnimplementedError();
}

class _$ProductDao extends ProductDao {
  _$ProductDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _productInsertionAdapter = InsertionAdapter(
            database,
            'Product',
            (Product item) => <String, Object?>{
                  'id': item.id,
                  'productName': item.productName,
                  'created': item.created,
                  'iconPath': item.iconPath,
                  'productTypeId': item.productTypeId
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Product> _productInsertionAdapter;

  @override
  Future<List<Product>> findAllProducts() async {
    return _queryAdapter.queryList('SELECT * FROM Product',
        mapper: (Map<String, Object?> row) => Product(
            created: row['created'] as String,
            iconPath: row['iconPath'] as String,
            productTypeId: row['productTypeId'] as int,
            id: row['id'] as int,
            productName: row['productName'] as String));
  }

  @override
  Stream<Product?> findProductById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM Person WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Product(
            created: row['created'] as String,
            iconPath: row['iconPath'] as String,
            productTypeId: row['productTypeId'] as int,
            id: row['id'] as int,
            productName: row['productName'] as String),
        arguments: [id],
        queryableName: 'Product',
        isView: false);
  }

  @override
  Future<void> insertP(Product product) async {
    await _productInsertionAdapter.insert(product, OnConflictStrategy.abort);
  }
}
