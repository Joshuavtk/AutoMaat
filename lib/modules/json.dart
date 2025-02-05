import 'package:auto_maat/modules/dataobject/car.dart';
import 'package:auto_maat/modules/dataobject/customer.dart';
import 'package:auto_maat/modules/dataobject/rental.dart';

Map<String, dynamic> rentalToJsonWithoutId(Rental rental, Customer customer, Car car) {
    return {
        'code': rental.code,
        'fromDate': rental.fromDate,
        'toDate': rental.toDate,
        'latitude': rental.latitude,
        'longitude': rental.longitude,
        'state': rental.state,
        'customer': customerToJson(customer),
        'car': carToJson(car),
        'inspections': null,
      };
  }

  Map<String, dynamic> carToJson(Car car){
    return {
        'id': car.id,
        'brand': car.brand,
        'model': car.model,
        'latitude':  car.latitude,
        'longitude': car.longitude,
        'picture': car.picture,
        'pictureContentType': car.pictureContentType,
        'fuel': car.fuel,
        'options': car.options,
        'licensePlate': car.licensePlate,
        'engineSize': car.engineSize,
        'modelYear': car.modelYear,
        'since': car.since,
        'nrOfSeats': car.nrOfSeats,
        'body': car.body,
      };
  }

  Map<String, dynamic> customerToJson(Customer customer) {
    return {
        'id': customer.id,
        'nr': customer.nr,
        'lastName': customer.lastName,
        'firstName': customer.firstName,
        'from': customer.from,
      };
  }