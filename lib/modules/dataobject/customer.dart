class Customer {
  int id;
  int nr;
  String lastName;
  String firstName;
  String from;

  Customer({
    required this.id,
    required this.nr,
    required this.lastName,
    required this.firstName,
    required this.from,
  });

  factory Customer.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': int id,
        'nr': int nr,
        'lastName': String lastName,
        'firstName': String firstName,
        'from': String from,
      } =>
        Customer(
          id: id,
          nr: nr,
          lastName: lastName,
          firstName: firstName,
          from: from,
        ),
      _ => throw const FormatException('Failed to load customer'),
    };
  }
}
