import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

class User extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get username =>  text()();
  TextColumn get token => text()();
}