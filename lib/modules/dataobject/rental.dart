class Rental {
  int id;
  String code;
  String fromDate;
  String toDate;
  double latitude;
  double longitude;
  String state;

  Rental({
    required this.id,
    required this.code,
    required this.fromDate,
    required this.toDate,
    required this.latitude,
    required this.longitude,
    required this.state,
  });

  factory Rental.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': int id,
        'code': String code,
        'fromDate': String fromDate,
        'toDate': String toDate,
        'latitude':  double latitude,
        'longitude': double longitude,
        'state': String state,
      } =>
        Rental(
          id: id,
          code: code,
          fromDate: fromDate,
          toDate: toDate,
          latitude: latitude,
          longitude: longitude,
          state: state,
        ),
      _ => throw const FormatException('Failed to load rentals'),
    };
  }
}
