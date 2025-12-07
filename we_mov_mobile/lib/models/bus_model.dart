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
}