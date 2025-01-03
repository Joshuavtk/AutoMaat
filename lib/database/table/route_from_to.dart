// import 'package:drift/drift.dart';
// import 'package:drift_flutter/drift_flutter.dart';

// class TodoItems extends Table {
//   IntColumn get id => integer().autoIncrement()();
//   TextColumn get title => text().withLength(min: 1, max: 32)();
//   TextColumn get content => text().named('body')();
//   IntColumn get category =>
//       integer().nullable().references(TodoCategory, #id)();
//   DateTimeColumn get createdAt => dateTime().nullable()();
// }