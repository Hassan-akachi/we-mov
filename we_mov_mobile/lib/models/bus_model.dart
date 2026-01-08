// import 'package:we_mov_mobile/models/vehicle.dart';
//
// import '../utils/constants.dart';
//
// class Bus extends Vehicle{
//   int? busId;
//   String busName;
//   String busNumber;
//   String? busType;
//   int totalSeat;
//   bool? hasWifi;
//   bool? hasRestroom;
//
//   Bus({
//     this.busId,
//     required this.busName,
//     required this.busNumber,
//     required this.busType,
//     required this.totalSeat,
//     this.hasWifi,
//     this.hasRestroom,
//   }): super(
//   id: busId,
//   name: busName,
//   number: busNumber,
//   type: TransportType.BUS,
//   vehicleClass: VehicleClass.economy,
//   totalSeats: totalSeat,
//     busType: busType
//   );
// }
import 'package:we_mov_mobile/utils/constants.dart';

class Bus {
  int? busId;
  String busName;
  String busNumber;
  String busType;
  int totalSeat;
  TransportType transportType;

  Bus({
    this.busId,
    required this.busName,
    required this.busNumber,
    required this.busType,
    required this.totalSeat,
    required this.transportType
  });

  factory Bus.fromJson(Map<String, dynamic> json) {
    print(json);

    return Bus(
      // Use tryParse or just cast if you're sure it's an int/string
      busId: json["busId"] is String ? int.parse(json["busId"]) : json["busId"],
      busName: json["busName"],
      busNumber: json["busNumber"],
      busType: json["busType"],
      totalSeat: json["totalSeat"] is String ? int.parse(json["totalSeat"]) : json["totalSeat"],

      // ⭐ THE FIX: Map String from JSON to Enum
      transportType: TransportType.values.firstWhere(
            (e) => e.name == json["transportType"],
        orElse: () => TransportType.BUS, // Default fallback
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "busId": busId,
      "busName": busName,
      "busNumber": busNumber,
      "busType": busType,
      "totalSeat": totalSeat,
      // ⭐ THE FIX: Convert Enum to String for JSON
      "transportType": transportType.name,
    };
  }
}