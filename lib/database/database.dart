import 'package:auto_maat/database/table/rental.dart';
import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:auto_maat/database/table/user.dart';

part 'database.g.dart';

@DriftDatabase(
  tables: [
    User,
    Rentals
    ]
    )
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(name: 'my_database');
  }

    Future<List<UserData>> getUsers() async {
    return await select(user).get();
  }

  Future<int> saveItem(String item) async {
    return await into(user)
        .insert(UserCompanion.insert(token: item, firstName: '', lastName: '', email: '', login: ''));
  }

  Future<int> saveUser({required String token, required String firstName, required String lastName, required String email, required String login}) async {
    return await into(user)
        .insert(UserCompanion.insert(token: token, firstName: firstName, lastName: lastName, email: email, login: login));
  }

  Future<int> deleteUserToken() async {
    return await delete(user).go();
  }
}