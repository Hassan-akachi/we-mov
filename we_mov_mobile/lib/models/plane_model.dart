// airplane_model.dart

import 'package:we_mov_mobile/models/vehicle.dart';
import '../utils/constants.dart';

/// Represents a specific airplane vehicle type, inheriting common properties from Vehicle.
class Airplane extends Vehicle {
  // Unique Airplane properties
  final int maxAltitudeFeet;
  final String airlineCode;

  Airplane({
    int? id,
    required String name,
    required String number,
    required VehicleClass vehicleClass,
    required int totalSeats,
    required this.maxAltitudeFeet,
    required this.airlineCode,
  }) : super(
    id: id,
    name: name,
    number: number,
    type: TransportType.AIRPLANE, // Explicitly set the transport type
    vehicleClass: vehicleClass,
    totalSeats: totalSeats,
  );
}