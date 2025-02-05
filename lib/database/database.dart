import 'package:auto_maat/database/table/rental.dart';
import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'table/customer.dart';
import 'package:auto_maat/modules/dataobject/rental.dart' as r;
import 'package:auto_maat/modules/dataobject/customer.dart' as c;

part 'database.g.dart';

@DriftDatabase(
  tables: [
    User,
    Rentals,
    ]
    )
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(name: 'my_database');
  }

  Future<List<CustomerData>> getCustomers() async {
    return await select(customer).get();
  }

  Future<int> saveCustomer(c.Customer i, String token) async {
    return await into(customer)
        .insert(CustomerCompanion.insert(
          lastName: i.lastName,
          firstName: i.firstName,
          token: token,
          )
          );
  }


  Future<List<RentalData>> getRentals() async {
    return await select(rental).get();
  }

  Future<int> saveRental(r.Rental i) async {
    return await into(rental)
        .insert(RentalCompanion.insert(
          code: i.code,
          fromDate: i.fromDate,
          toDate: i.toDate,
          latitude: i.latitude.toString(),
          longitude: i.longitude.toString(),
          state: i.state,
          )
          );
  }

  Future<int> deleteUserToken() async {
    return await delete(user).go();
  }
}