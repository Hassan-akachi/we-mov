import '../utils/constants.dart';

class Vehicle {
  final int? id;
  final String name;
  final String number;
  final TransportType type;
  final VehicleClass? vehicleClass;
  final int totalSeats;
  String? busType;

  Vehicle({
     this.id,
    required this.name,
    required this.number,
    required this.type,
    required this.vehicleClass,
    required this.totalSeats,
    this.busType
  });

  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "name": this.name,
      "number": this.number,
      "type": type.name,
      "vehicleClass": this.vehicleClass,
      "totalSeats": this.totalSeats,
      "busType": this.busType,
    };
  }

  factory Vehicle.fromJson(Map<String, dynamic> json) {
    return Vehicle(id: int.parse(json["id"]),
      name: json["name"],
      number: json["number"],
      type: TransportType.values.firstWhere(
            (e) => e.name == json["transportType"],
        orElse: () => TransportType.BUS, // Default fallback
      ),
      vehicleClass: VehicleClass.values.firstWhere(
            (e) => e.name == json["vehicleClass"],
        orElse: () => VehicleClass.economy, // Default fallback
      ),
      totalSeats: int.parse(json["totalSeats"]),
      busType: json["busType"],);
  }

}
