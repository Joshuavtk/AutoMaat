// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $CustomerTable extends c.Customer
    with TableInfo<$CustomerTable, CustomerData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CustomerTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _lastNameMeta =
      const VerificationMeta('lastName');
  @override
  late final GeneratedColumn<String> lastName = GeneratedColumn<String>(
      'last_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _firstNameMeta =
      const VerificationMeta('firstName');
  @override
  late final GeneratedColumn<String> firstName = GeneratedColumn<String>(
      'first_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _tokenMeta = const VerificationMeta('token');
  @override
  late final GeneratedColumn<String> token = GeneratedColumn<String>(
      'token', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, lastName, firstName, token];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'customer';
  @override
  VerificationContext validateIntegrity(Insertable<CustomerData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('last_name')) {
      context.handle(_lastNameMeta,
          lastName.isAcceptableOrUnknown(data['last_name']!, _lastNameMeta));
    } else if (isInserting) {
      context.missing(_lastNameMeta);
    }
    if (data.containsKey('first_name')) {
      context.handle(_firstNameMeta,
          firstName.isAcceptableOrUnknown(data['first_name']!, _firstNameMeta));
    } else if (isInserting) {
      context.missing(_firstNameMeta);
    }
    if (data.containsKey('token')) {
      context.handle(
          _tokenMeta, token.isAcceptableOrUnknown(data['token']!, _tokenMeta));
    } else if (isInserting) {
      context.missing(_tokenMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CustomerData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CustomerData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      lastName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}last_name'])!,
      firstName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}first_name'])!,
      token: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}token'])!,
    );
  }

  @override
  $CustomerTable createAlias(String alias) {
    return $CustomerTable(attachedDatabase, alias);
  }
}

class CustomerData extends DataClass implements Insertable<CustomerData> {
  final int id;
  final String lastName;
  final String firstName;
  final String token;
  const CustomerData(
      {required this.id,
      required this.lastName,
      required this.firstName,
      required this.token});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['last_name'] = Variable<String>(lastName);
    map['first_name'] = Variable<String>(firstName);
    map['token'] = Variable<String>(token);
    return map;
  }

  CustomerCompanion toCompanion(bool nullToAbsent) {
    return CustomerCompanion(
      id: Value(id),
      lastName: Value(lastName),
      firstName: Value(firstName),
      token: Value(token),
    );
  }

  factory CustomerData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CustomerData(
      id: serializer.fromJson<int>(json['id']),
      lastName: serializer.fromJson<String>(json['lastName']),
      firstName: serializer.fromJson<String>(json['firstName']),
      token: serializer.fromJson<String>(json['token']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'lastName': serializer.toJson<String>(lastName),
      'firstName': serializer.toJson<String>(firstName),
      'token': serializer.toJson<String>(token),
    };
  }

  CustomerData copyWith(
          {int? id, String? lastName, String? firstName, String? token}) =>
      CustomerData(
        id: id ?? this.id,
        lastName: lastName ?? this.lastName,
        firstName: firstName ?? this.firstName,
        token: token ?? this.token,
      );
  CustomerData copyWithCompanion(CustomerCompanion data) {
    return CustomerData(
      id: data.id.present ? data.id.value : this.id,
      lastName: data.lastName.present ? data.lastName.value : this.lastName,
      firstName: data.firstName.present ? data.firstName.value : this.firstName,
      token: data.token.present ? data.token.value : this.token,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CustomerData(')
          ..write('id: $id, ')
          ..write('lastName: $lastName, ')
          ..write('firstName: $firstName, ')
          ..write('token: $token')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, lastName, firstName, token);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CustomerData &&
          other.id == this.id &&
          other.lastName == this.lastName &&
          other.firstName == this.firstName &&
          other.token == this.token);
}

class CustomerCompanion extends UpdateCompanion<CustomerData> {
  final Value<int> id;
  final Value<String> lastName;
  final Value<String> firstName;
  final Value<String> token;
  const CustomerCompanion({
    this.id = const Value.absent(),
    this.lastName = const Value.absent(),
    this.firstName = const Value.absent(),
    this.token = const Value.absent(),
  });
  CustomerCompanion.insert({
    this.id = const Value.absent(),
    required String lastName,
    required String firstName,
    required String token,
  })  : lastName = Value(lastName),
        firstName = Value(firstName),
        token = Value(token);
  static Insertable<CustomerData> custom({
    Expression<int>? id,
    Expression<String>? lastName,
    Expression<String>? firstName,
    Expression<String>? token,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (lastName != null) 'last_name': lastName,
      if (firstName != null) 'first_name': firstName,
      if (token != null) 'token': token,
    });
  }

  CustomerCompanion copyWith(
      {Value<int>? id,
      Value<String>? lastName,
      Value<String>? firstName,
      Value<String>? token}) {
    return CustomerCompanion(
      id: id ?? this.id,
      lastName: lastName ?? this.lastName,
      firstName: firstName ?? this.firstName,
      token: token ?? this.token,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (lastName.present) {
      map['last_name'] = Variable<String>(lastName.value);
    }
    if (firstName.present) {
      map['first_name'] = Variable<String>(firstName.value);
    }
    if (token.present) {
      map['token'] = Variable<String>(token.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CustomerCompanion(')
          ..write('id: $id, ')
          ..write('lastName: $lastName, ')
          ..write('firstName: $firstName, ')
          ..write('token: $token')
          ..write(')'))
        .toString();
  }
}

class $RentalsTable extends Rentals with TableInfo<$RentalsTable, Rental> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RentalsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
      'code', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 32),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _longitudeMeta =
      const VerificationMeta('longitude');
  @override
  late final GeneratedColumn<double> longitude = GeneratedColumn<double>(
      'longitude', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _latitudeMeta =
      const VerificationMeta('latitude');
  @override
  late final GeneratedColumn<double> latitude = GeneratedColumn<double>(
      'latitude', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _fromDateMeta =
      const VerificationMeta('fromDate');
  @override
  late final GeneratedColumn<DateTime> fromDate = GeneratedColumn<DateTime>(
      'from_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _toDateMeta = const VerificationMeta('toDate');
  @override
  late final GeneratedColumn<DateTime> toDate = GeneratedColumn<DateTime>(
      'to_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true); 
 
  static const VerificationMeta _stateMeta = const VerificationMeta('state');
  @override
  late final GeneratedColumn<String> state = GeneratedColumn<String>(
      'state', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, code, longitude, latitude, fromDate, toDate, state];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'rentals';
  @override
  VerificationContext validateIntegrity(Insertable<Rental> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('code')) {
      context.handle(
          _codeMeta, code.isAcceptableOrUnknown(data['code']!, _codeMeta));
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('longitude')) {
      context.handle(_longitudeMeta,
          longitude.isAcceptableOrUnknown(data['longitude']!, _longitudeMeta));
    } else if (isInserting) {
      context.missing(_longitudeMeta);
    }
    if (data.containsKey('latitude')) {
      context.handle(_latitudeMeta,
          latitude.isAcceptableOrUnknown(data['latitude']!, _latitudeMeta));
    } else if (isInserting) {
      context.missing(_latitudeMeta);
    }
    if (data.containsKey('from_date')) {
      context.handle(_fromDateMeta,
          fromDate.isAcceptableOrUnknown(data['from_date']!, _fromDateMeta));
    } else if (isInserting) {
      context.missing(_fromDateMeta);
    }
    if (data.containsKey('to_date')) {
      context.handle(_toDateMeta,
          toDate.isAcceptableOrUnknown(data['to_date']!, _toDateMeta));
    } else if (isInserting) {
      context.missing(_toDateMeta);
    }
    if (data.containsKey('state')) {
      context.handle(
          _stateMeta, state.isAcceptableOrUnknown(data['state']!, _stateMeta));
    } else if (isInserting) {
      context.missing(_stateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Rental map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Rental(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      code: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}code'])!,
      longitude: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}longitude'])!,
      latitude: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}latitude'])!,
      fromDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}from_date'])!,
      toDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}to_date'])!,
      state: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}state'])!,
    );
  }

  @override
  $RentalsTable createAlias(String alias) {
    return $RentalsTable(attachedDatabase, alias);
  }
}

class Rental extends DataClass implements Insertable<Rental> {
  final int id;
  final String code;
  final double longitude;
  final double latitude;
  final DateTime fromDate;
  final DateTime toDate;
  final String state;
  const Rental(
      {required this.id,
      required this.code,
      required this.longitude,
      required this.latitude,
      required this.fromDate,
      required this.toDate,
      required this.state});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['code'] = Variable<String>(code);
    map['longitude'] = Variable<double>(longitude);
    map['latitude'] = Variable<double>(latitude);
    map['from_date'] = Variable<DateTime>(fromDate);
    map['to_date'] = Variable<DateTime>(toDate);
    map['state'] = Variable<String>(state);
    return map;
  }
  RentalsCompanion toCompanion(bool nullToAbsent) {
    return RentalsCompanion(
      id: Value(id),
      code: Value(code),
      longitude: Value(longitude),
      latitude: Value(latitude),
      fromDate: Value(fromDate),
      toDate: Value(toDate),
      state: Value(state),
    );
  }
  factory Rental.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Rental(
      id: serializer.fromJson<int>(json['id']),
      code: serializer.fromJson<String>(json['code']),
      longitude: serializer.fromJson<double>(json['longitude']),
      latitude: serializer.fromJson<double>(json['latitude']),
      fromDate: serializer.fromJson<DateTime>(json['fromDate']),
      toDate: serializer.fromJson<DateTime>(json['toDate']),
      state: serializer.fromJson<String>(json['state']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'code': serializer.toJson<String>(code),
      'longitude': serializer.toJson<double>(longitude),
      'latitude': serializer.toJson<double>(latitude),
      'fromDate': serializer.toJson<DateTime>(fromDate),
      'toDate': serializer.toJson<DateTime>(toDate),
      'state': serializer.toJson<String>(state),
    };
  }
  Rental copyWith(
          {int? id,
          String? code,
          double? longitude,
          double? latitude,
          DateTime? fromDate,
          DateTime? toDate,
          String? state}) =>
      Rental(
        id: id ?? this.id,
        code: code ?? this.code,
        longitude: longitude ?? this.longitude,
        latitude: latitude ?? this.latitude,
        fromDate: fromDate ?? this.fromDate,
        toDate: toDate ?? this.toDate,
        state: state ?? this.state,
      );
  Rental copyWithCompanion(RentalsCompanion data) {
    return Rental(
      id: data.id.present ? data.id.value : this.id,
      code: data.code.present ? data.code.value : this.code,
      longitude: data.longitude.present ? data.longitude.value : this.longitude,
      latitude: data.latitude.present ? data.latitude.value : this.latitude,
      fromDate: data.fromDate.present ? data.fromDate.value : this.fromDate,
      toDate: data.toDate.present ? data.toDate.value : this.toDate,
      state: data.state.present ? data.state.value : this.state,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Rental(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('longitude: $longitude, ')
          ..write('latitude: $latitude, ')
          ..write('fromDate: $fromDate, ')
          ..write('toDate: $toDate, ')
          ..write('state: $state')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, code, longitude, latitude, fromDate, toDate, state);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Rental &&
          other.id == this.id &&
          other.code == this.code &&
          other.longitude == this.longitude &&
          other.latitude == this.latitude &&
          other.fromDate == this.fromDate &&
          other.toDate == this.toDate &&
          other.state == this.state);
}

class RentalsCompanion extends UpdateCompanion<Rental> {
  final Value<int> id;
  final Value<String> code;
  final Value<double> longitude;
  final Value<double> latitude;
  final Value<DateTime> fromDate;
  final Value<DateTime> toDate;
  final Value<String> state;
  const RentalsCompanion({
    this.id = const Value.absent(),
    this.code = const Value.absent(),
    this.longitude = const Value.absent(),
    this.latitude = const Value.absent(),
    this.fromDate = const Value.absent(),
    this.toDate = const Value.absent(),
    this.state = const Value.absent(),
  });
  RentalsCompanion.insert({
    this.id = const Value.absent(),
    required String code,
    required double longitude,
    required double latitude,
    required DateTime fromDate,
    required DateTime toDate,
    required String state,
  })  : code = Value(code),
        longitude = Value(longitude),
        latitude = Value(latitude),
        fromDate = Value(fromDate),
        toDate = Value(toDate),
        state = Value(state);
  static Insertable<Rental> custom({
    Expression<int>? id,
    Expression<String>? code,
    Expression<double>? longitude,
    Expression<double>? latitude,
    Expression<DateTime>? fromDate,
    Expression<DateTime>? toDate,
    Expression<String>? state,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (code != null) 'code': code,
      if (longitude != null) 'longitude': longitude,
      if (latitude != null) 'latitude': latitude,
      if (fromDate != null) 'from_date': fromDate,
      if (toDate != null) 'to_date': toDate,
      if (state != null) 'state': state,
    });
  }
  RentalsCompanion copyWith(
      {Value<int>? id,
      Value<String>? code,
      Value<double>? longitude,
      Value<double>? latitude,
      Value<DateTime>? fromDate,
      Value<DateTime>? toDate,
      Value<String>? state}) {
    return RentalsCompanion(
      id: id ?? this.id,
      code: code ?? this.code,
      longitude: longitude ?? this.longitude,
      latitude: latitude ?? this.latitude,
      fromDate: fromDate ?? this.fromDate,
      toDate: toDate ?? this.toDate,
      state: state ?? this.state,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (longitude.present) {
      map['longitude'] = Variable<double>(longitude.value);
    }
    if (latitude.present) {
      map['latitude'] = Variable<double>(latitude.value);
    }
    if (fromDate.present) {
      map['from_date'] = Variable<DateTime>(fromDate.value);
    }
    if (toDate.present) {
      map['to_date'] = Variable<DateTime>(toDate.value);
    }
    if (state.present) {
      map['state'] = Variable<String>(state.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RentalsCompanion(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('longitude: $longitude, ')
          ..write('latitude: $latitude, ')
          ..write('fromDate: $fromDate, ')
          ..write('toDate: $toDate, ')
          ..write('state: $state')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $UserTable user = $UserTable(this);
  late final $RentalsTable rentals = $RentalsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [user, rentals];
}

typedef $$CustomerTableCreateCompanionBuilder = CustomerCompanion Function({
  Value<int> id,
  required String lastName,
  required String firstName,
  required String token,
});
typedef $$CustomerTableUpdateCompanionBuilder = CustomerCompanion Function({
  Value<int> id,
  Value<String> lastName,
  Value<String> firstName,
  Value<String> token,
});

class $$CustomerTableFilterComposer
    extends Composer<_$AppDatabase, $CustomerTable> {
  $$CustomerTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get lastName => $composableBuilder(
      column: $table.lastName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get firstName => $composableBuilder(
      column: $table.firstName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get token => $composableBuilder(
      column: $table.token, builder: (column) => ColumnFilters(column));
}

class $$CustomerTableOrderingComposer
    extends Composer<_$AppDatabase, $CustomerTable> {
  $$CustomerTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get lastName => $composableBuilder(
      column: $table.lastName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get firstName => $composableBuilder(
      column: $table.firstName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get token => $composableBuilder(
      column: $table.token, builder: (column) => ColumnOrderings(column));
}

class $$CustomerTableAnnotationComposer
    extends Composer<_$AppDatabase, $CustomerTable> {
  $$CustomerTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get lastName =>
      $composableBuilder(column: $table.lastName, builder: (column) => column);

  GeneratedColumn<String> get firstName =>
      $composableBuilder(column: $table.firstName, builder: (column) => column);

  GeneratedColumn<String> get token =>
      $composableBuilder(column: $table.token, builder: (column) => column);
}

class $$CustomerTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CustomerTable,
    CustomerData,
    $$CustomerTableFilterComposer,
    $$CustomerTableOrderingComposer,
    $$CustomerTableAnnotationComposer,
    $$CustomerTableCreateCompanionBuilder,
    $$CustomerTableUpdateCompanionBuilder,
    (CustomerData, BaseReferences<_$AppDatabase, $CustomerTable, CustomerData>),
    CustomerData,
    PrefetchHooks Function()> {
  $$CustomerTableTableManager(_$AppDatabase db, $CustomerTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CustomerTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CustomerTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CustomerTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> lastName = const Value.absent(),
            Value<String> firstName = const Value.absent(),
            Value<String> token = const Value.absent(),
          }) =>
              CustomerCompanion(
            id: id,
            lastName: lastName,
            firstName: firstName,
            token: token,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String lastName,
            required String firstName,
            required String token,
          }) =>
              CustomerCompanion.insert(
            id: id,
            lastName: lastName,
            firstName: firstName,
            token: token,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CustomerTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CustomerTable,
    CustomerData,
    $$CustomerTableFilterComposer,
    $$CustomerTableOrderingComposer,
    $$CustomerTableAnnotationComposer,
    $$CustomerTableCreateCompanionBuilder,
    $$CustomerTableUpdateCompanionBuilder,
    (CustomerData, BaseReferences<_$AppDatabase, $CustomerTable, CustomerData>),
    CustomerData,
    PrefetchHooks Function()>;
typedef $$RentalTableCreateCompanionBuilder = RentalCompanion Function({
  Value<int> id,
  required String code,
  required DateTime fromDate,
  required DateTime toDate,
  required String latitude,
  required String longitude,
  required String state,
});
typedef $$RentalTableUpdateCompanionBuilder = RentalCompanion Function({
  Value<int> id,
  Value<String> code,
  Value<DateTime> fromDate,
  Value<DateTime> toDate,
  Value<String> latitude,
  Value<String> longitude,
  Value<String> state,
});

class $$RentalTableFilterComposer
    extends Composer<_$AppDatabase, $RentalTable> {
  $$RentalTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get code => $composableBuilder(
      column: $table.code, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get fromDate => $composableBuilder(
      column: $table.fromDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get toDate => $composableBuilder(
      column: $table.toDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get latitude => $composableBuilder(
      column: $table.latitude, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get longitude => $composableBuilder(
      column: $table.longitude, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get state => $composableBuilder(
      column: $table.state, builder: (column) => ColumnFilters(column));
}

class $$RentalTableOrderingComposer
    extends Composer<_$AppDatabase, $RentalTable> {
  $$RentalTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get code => $composableBuilder(
      column: $table.code, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get fromDate => $composableBuilder(
      column: $table.fromDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get toDate => $composableBuilder(
      column: $table.toDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get latitude => $composableBuilder(
      column: $table.latitude, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get longitude => $composableBuilder(
      column: $table.longitude, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get state => $composableBuilder(
      column: $table.state, builder: (column) => ColumnOrderings(column));
}

class $$RentalTableAnnotationComposer
    extends Composer<_$AppDatabase, $RentalTable> {
  $$RentalTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);

  GeneratedColumn<DateTime> get fromDate =>
      $composableBuilder(column: $table.fromDate, builder: (column) => column);

  GeneratedColumn<DateTime> get toDate =>
      $composableBuilder(column: $table.toDate, builder: (column) => column);

  GeneratedColumn<String> get latitude =>
      $composableBuilder(column: $table.latitude, builder: (column) => column);

  GeneratedColumn<String> get longitude =>
      $composableBuilder(column: $table.longitude, builder: (column) => column);

  GeneratedColumn<String> get state =>
      $composableBuilder(column: $table.state, builder: (column) => column);
}

class $$RentalTableTableManager extends RootTableManager<
    _$AppDatabase,
    $RentalTable,
    RentalData,
    $$RentalTableFilterComposer,
    $$RentalTableOrderingComposer,
    $$RentalTableAnnotationComposer,
    $$RentalTableCreateCompanionBuilder,
    $$RentalTableUpdateCompanionBuilder,
    (RentalData, BaseReferences<_$AppDatabase, $RentalTable, RentalData>),
    RentalData,
    PrefetchHooks Function()> {
  $$RentalTableTableManager(_$AppDatabase db, $RentalTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RentalTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RentalTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RentalTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> code = const Value.absent(),
            Value<DateTime> fromDate = const Value.absent(),
            Value<DateTime> toDate = const Value.absent(),
            Value<String> latitude = const Value.absent(),
            Value<String> longitude = const Value.absent(),
            Value<String> state = const Value.absent(),
          }) =>
              RentalCompanion(
            id: id,
            code: code,
            fromDate: fromDate,
            toDate: toDate,
            latitude: latitude,
            longitude: longitude,
            state: state,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String code,
            required DateTime fromDate,
            required DateTime toDate,
            required String latitude,
            required String longitude,
            required String state,
          }) =>
              RentalCompanion.insert(
            id: id,
            code: code,
            fromDate: fromDate,
            toDate: toDate,
            latitude: latitude,
            longitude: longitude,
            state: state,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$RentalTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $RentalTable,
    RentalData,
    $$RentalTableFilterComposer,
    $$RentalTableOrderingComposer,
    $$RentalTableAnnotationComposer,
    $$RentalTableCreateCompanionBuilder,
    $$RentalTableUpdateCompanionBuilder,
    (RentalData, BaseReferences<_$AppDatabase, $RentalTable, RentalData>),
    RentalData,
    PrefetchHooks Function()>;
typedef $$RentalsTableCreateCompanionBuilder = RentalsCompanion Function({
  Value<int> id,
  required String code,
  required double longitude,
  required double latitude,
  required DateTime fromDate,
  required DateTime toDate,
  required String state,
});
typedef $$RentalsTableUpdateCompanionBuilder = RentalsCompanion Function({
  Value<int> id,
  Value<String> code,
  Value<double> longitude,
  Value<double> latitude,
  Value<DateTime> fromDate,
  Value<DateTime> toDate,
  Value<String> state,
});

class $$RentalsTableFilterComposer
    extends Composer<_$AppDatabase, $RentalsTable> {
  $$RentalsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get code => $composableBuilder(
      column: $table.code, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get longitude => $composableBuilder(
      column: $table.longitude, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get latitude => $composableBuilder(
      column: $table.latitude, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get fromDate => $composableBuilder(
      column: $table.fromDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get toDate => $composableBuilder(
      column: $table.toDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get state => $composableBuilder(
      column: $table.state, builder: (column) => ColumnFilters(column));
}

class $$RentalsTableOrderingComposer
    extends Composer<_$AppDatabase, $RentalsTable> {
  $$RentalsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get code => $composableBuilder(
      column: $table.code, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get longitude => $composableBuilder(
      column: $table.longitude, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get latitude => $composableBuilder(
      column: $table.latitude, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get fromDate => $composableBuilder(
      column: $table.fromDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get toDate => $composableBuilder(
      column: $table.toDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get state => $composableBuilder(
      column: $table.state, builder: (column) => ColumnOrderings(column));
}

class $$RentalsTableAnnotationComposer
    extends Composer<_$AppDatabase, $RentalsTable> {
  $$RentalsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);

  GeneratedColumn<double> get longitude =>
      $composableBuilder(column: $table.longitude, builder: (column) => column);

  GeneratedColumn<double> get latitude =>
      $composableBuilder(column: $table.latitude, builder: (column) => column);

  GeneratedColumn<DateTime> get fromDate =>
      $composableBuilder(column: $table.fromDate, builder: (column) => column);

  GeneratedColumn<DateTime> get toDate =>
      $composableBuilder(column: $table.toDate, builder: (column) => column);

  GeneratedColumn<String> get state =>
      $composableBuilder(column: $table.state, builder: (column) => column);
}

class $$RentalsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $RentalsTable,
    Rental,
    $$RentalsTableFilterComposer,
    $$RentalsTableOrderingComposer,
    $$RentalsTableAnnotationComposer,
    $$RentalsTableCreateCompanionBuilder,
    $$RentalsTableUpdateCompanionBuilder,
    (Rental, BaseReferences<_$AppDatabase, $RentalsTable, Rental>),
    Rental,
    PrefetchHooks Function()> {
  $$RentalsTableTableManager(_$AppDatabase db, $RentalsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RentalsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RentalsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RentalsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> code = const Value.absent(),
            Value<double> longitude = const Value.absent(),
            Value<double> latitude = const Value.absent(),
            Value<DateTime> fromDate = const Value.absent(),
            Value<DateTime> toDate = const Value.absent(),
            Value<String> state = const Value.absent(),
          }) =>
              RentalsCompanion(
            id: id,
            code: code,
            longitude: longitude,
            latitude: latitude,
            fromDate: fromDate,
            toDate: toDate,
            state: state,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String code,
            required double longitude,
            required double latitude,
            required DateTime fromDate,
            required DateTime toDate,
            required String state,
          }) =>
              RentalsCompanion.insert(
            id: id,
            code: code,
            longitude: longitude,
            latitude: latitude,
            fromDate: fromDate,
            toDate: toDate,
            state: state,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$RentalsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $RentalsTable,
    Rental,
    $$RentalsTableFilterComposer,
    $$RentalsTableOrderingComposer,
    $$RentalsTableAnnotationComposer,
    $$RentalsTableCreateCompanionBuilder,
    $$RentalsTableUpdateCompanionBuilder,
    (Rental, BaseReferences<_$AppDatabase, $RentalsTable, Rental>),
    Rental,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$UserTableTableManager get user => $$UserTableTableManager(_db, _db.user);
  $$RentalsTableTableManager get rentals =>
      $$RentalsTableTableManager(_db, _db.rentals);
}
