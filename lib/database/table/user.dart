import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

class User extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get token => text()();
  TextColumn get firstName => text()();
  TextColumn get lastName => text()();
  TextColumn get email => text()();
  TextColumn get login => text()();
}