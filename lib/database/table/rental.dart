// import 'dart:ffi';

// import 'package:drift/drift.dart';
// import 'package:drift_flutter/drift_flutter.dart';

// class TodoItems extends Table {
//   IntColumn get id => integer().autoIncrement()();
//   TextColumn get code => text().withLength(min: 1, max: 32)();
//   IntColumn get longitude => ;
//   IntColumn get latitude => ;
//   DateTimeColumn get fromDate => dateTime()();
//   DateTimeColumn get toDate => dateTime()();
//   TextColumn get state => text()();

  
//   TextColumn get content => text().named('body')();
//   IntColumn get category =>
//       integer().nullable().references(TodoCategory, #id)();
//   DateTimeColumn get createdAt => dateTime().nullable()();
// }