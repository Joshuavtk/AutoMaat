class Car {
  int id;
  String brand;
  String model;
  double latitude;
  double longitude;
  String picture;
  String pictureContentType;
  String fuel;
  String options;
  String licensePlate;
  int engineSize;
  int modelYear;
  String since;
  int nrOfSeats;
  String body;

  Car({
    required this.id,
    required this.brand,
    required this.model,
    required this.latitude,
    required this.longitude,
    required this.picture,
    required this.pictureContentType,
    required this.fuel,
    required this.options,
    required this.licensePlate,
    required this.engineSize,
    required this.modelYear,
    required this.since,
    required this.nrOfSeats,
    required this.body,
  });

  factory Car.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': int id,
        'brand': String brand,
        'model': String model,
        'latitude':  double latitude,
        'longitude': double longitude,
        'picture': String picture,
        'pictureContentType': String pictureContentType,
        'fuel': String fuel,
        'options': String options,
        'licensePlate': String licensePlate,
        'engineSize': int engineSize,
        'modelYear': int modelYear,
        'since': String since,
        'nrOfSeats': int nrOfSeats,
        'body': String body,
      } =>
        Car(
          id: id,
          brand: brand,
          model: model,
          latitude: latitude,
          longitude: longitude,
          picture: picture,
          pictureContentType: pictureContentType,
          fuel: fuel,
          options: options,
          licensePlate: licensePlate,
          engineSize: engineSize,
          modelYear: modelYear,
          since: since,
          nrOfSeats: nrOfSeats,
          body: body,
        ),
      _ => throw const FormatException('Failed to load cars'),
    };
  }
}
