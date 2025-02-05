import 'package:drift/drift.dart';

class Rental extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get code => text()();
  DateTimeColumn get fromDate => dateTime()();
  DateTimeColumn get toDate => dateTime()();
  TextColumn get latitude => text()();
  TextColumn get longitude => text()();
  TextColumn get state => text()();
}