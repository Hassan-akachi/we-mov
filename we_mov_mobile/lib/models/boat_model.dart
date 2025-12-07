import 'package:we_mov_mobile/models/vehicle.dart';

import '../utils/constants.dart';

class Boat extends Vehicle {
  // Unique Boat properties
  final BoatType boatType;
  final double lengthInMeters;
  final bool hasLifeJackets;
  final bool hasRestroom;
  final int maxPassengers;

  Boat({
    int? id,
    required String name,
    required String number,
    required VehicleClass vehicleClass,
    required int totalSeats,
    required this.boatType,
    required this.lengthInMeters,
    this.hasLifeJackets = true,
    this.hasRestroom = false,
    this.maxPassengers = 50,
  }) : super(
    id: id,
    name: name,
    number: number,
    type: TransportType.BOAT,
    vehicleClass: vehicleClass,
    totalSeats: totalSeats,
  );

  @override
  String get description => '$name $boatType (${lengthInMeters}m)';

  bool get isSpeedboat => boatType == BoatType.SPEEDBOAT;
  bool get isYacht => boatType == BoatType.YACHT;
}

enum BoatType {
  SPEEDBOAT,
  YACHT,
  FERRY,
  CRUISE_SHIP,
  SAILBOAT,
  CANOE,
}