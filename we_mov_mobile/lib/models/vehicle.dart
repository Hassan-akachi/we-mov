import '../utils/constants.dart';

class Vehicle {
  final int id;
  final String name;
  final String number;
  final TransportType type;
  final VehicleClass vehicleClass;
  final int totalSeats;

  Vehicle({
    required this.id,
    required this.name,
    required this.number,
    required this.type,
    required this.vehicleClass,
    required this.totalSeats,
  });
}
