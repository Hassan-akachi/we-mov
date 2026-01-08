


import 'bus_model.dart';
import 'bus_route.dart';

class BusSchedule {
  int? scheduleId;
  Bus bus;
  BusRoute busRoute;
  String departureTime;
  int ticketPrice;
  int discount;
  int processingFee;

  BusSchedule(
      {this.scheduleId,
      required this.bus,
        required this.busRoute,
        required this.departureTime,
        required this.ticketPrice,
        this.discount = 0,
        this.processingFee = 50});

  Map<String, dynamic> toJson() {
    return {
      "scheduleId": scheduleId,
      "bus": bus,
      "busRoute": busRoute,
      "departureTime": departureTime,
      "ticketPrice": ticketPrice,
      "discount": discount,
      "processingFee": processingFee,
    };
  }

  factory BusSchedule.fromJson(Map<String, dynamic> json) {
    print(json);

    return BusSchedule(
      scheduleId: json['scheduleId'],
      bus: Bus.fromJson(json['bus']),
      busRoute: BusRoute.fromJson(json['busRoute']),
      departureTime: json['departureTime'].toString(),
      ticketPrice: json['ticketPrice'],      // MUST be int
      discount: json['discount'],            // MUST be int
      processingFee: json['processingFee'],  // MUST be int
    );
  }


}