import 'package:we_mov_mobile/models/vehicle.dart';

import '../utils/constants.dart';

class Train extends Vehicle {
  // Unique Train properties
  final bool isElectric;
  final int numberOfCoaches;
  final bool hasDiningCar;

  Train({
    int? id,
    required String name,
    required String number,
    required VehicleClass vehicleClass,
    required int totalSeats,
    required this.isElectric,
    this.numberOfCoaches = 8,
    this.hasDiningCar = false,
  }) : super(
    id: id,
    name: name,
    number: number,
    type: TransportType.TRAIN,
    vehicleClass: vehicleClass,
    totalSeats: totalSeats,
  );

  @override
  String get description => '$name Train (${isElectric ? 'Electric' : 'Diesel'})';
}