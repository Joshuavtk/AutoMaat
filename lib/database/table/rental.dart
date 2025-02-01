import 'package:drift/drift.dart';

class Rentals extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get code => text().withLength(min: 1, max: 32)();
  Column<double> get longitude => real()();
  Column<double> get latitude => real()();
  DateTimeColumn get fromDate => dateTime()();
  DateTimeColumn get toDate => dateTime()();
  TextColumn get state => text()();

// TODO: Add relation to these fields
// this.inspections,
// this.customer,
// this.car,

// TextColumn get content => text().named('body')();
// IntColumn get category =>
//     integer().nullable().references(TodoCategory, #id)();
// DateTimeColumn get createdAt => dateTime().nullable()();
}
