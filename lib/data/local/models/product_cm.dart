import 'package:drift/drift.dart';

class ProductCM extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  TextColumn get description => text()();
  RealColumn get price => real()();
  TextColumn get image => text()();

  // TextColumn get phoneNumber1=> text()();
  //
  // TextColumn get phoneNumber2 => text()();
  //
  // IntColumn get age => integer()();
  //
  // TextColumn get maritalStatus=> textEnum<MaritalStatus>()();
  //
  // TextColumn get chronicDisease=> textEnum()();
  //
  // // TextColumn get name => text()();
  // //
  // // TextColumn get age => text()();
  // //
  // // TextColumn get name => text()();
  // //
  // // TextColumn get age => text()();

  BoolColumn get isFinished => boolean()();
}
