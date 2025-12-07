// car_model.dart

import 'package:we_mov_mobile/models/vehicle.dart';
import '../utils/constants.dart';

/// Represents a specific car vehicle type, inheriting common properties from Vehicle.
class Car extends Vehicle {
  // Unique Car properties
  final int trunkCapacityLiters;
  final bool isElectric;

  Car({
    int? id,
    required String name,
    required String number,
    required VehicleClass vehicleClass,
    required int totalSeats,
    required this.trunkCapacityLiters,
    required this.isElectric,
  }) : super(
    id: id,
    name: name,
    number: number,
    type: TransportType.CAR, // Explicitly set the transport type
    vehicleClass: vehicleClass,
    totalSeats: totalSeats,
  );
}