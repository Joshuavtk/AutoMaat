import 'package:drift/drift.dart';

class Customer extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get lastName =>  text()();
  TextColumn get firstName => text()();
  TextColumn get token => text()();
}