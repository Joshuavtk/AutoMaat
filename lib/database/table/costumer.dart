// import 'package:drift/drift.dart';
// import 'package:drift_flutter/drift_flutter.dart';

// class Costumer extends Table {
//   IntColumn get id => integer().autoIncrement()();
//   IntColumn get nr => integer()();
//   TextColumn get lastName => text().withLength(min: 1, max: 32)();
//   TextColumn get firstName => text().withLength(min: 1, max: 32)();
//   DateTimeColumn get from => dateTime().nullable()();
  
//   IntColumn get category =>
//       integer().nullable().references(TodoCategory, #id)();
//   DateTimeColumn get createdAt => dateTime().nullable()();
// }