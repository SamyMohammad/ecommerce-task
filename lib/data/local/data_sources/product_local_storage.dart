import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:ecommerce_task/data/local/models/product_cm.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'product_local_storage.g.dart';

@DriftDatabase(tables: [ProductCM])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 3;

  //GET TODO LIST
  Future<List<ProductCMData>> getALlProductCM() async {
    return await productCM.select().get();
  }

  //ADD TODO
  Future<int> insertProductCM(ProductCMCompanion productCMCompanion) async {
    return await productCM.insertOne(productCMCompanion);
  }

  //UPDATE TODO
  Future<void> updateProductCM(ProductCMCompanion productCompanion) async {
    return await productCM.replaceOne(productCompanion);
  }

  //DELETE TODO
  Future<int> deleteProductCM(ProductCMData productCMData) async {
    return await (productCM.delete()
          ..where((tbl) => tbl.id.equals(productCMData.id)))
        .go();
  }
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'dataBase.sqlite'));
    return NativeDatabase(file);
  });
}
