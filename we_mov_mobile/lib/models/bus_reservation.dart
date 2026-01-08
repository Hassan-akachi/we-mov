import 'bus_schedule.dart';
import 'customer.dart';

class BusReservation {
  int? reservationId;
  Customer customer;
  BusSchedule busSchedule;
  int timestamp;
  String departureDate;
  int totalSeatBooked;
  String seatNumbers;
  String reservationStatus;
  int totalPrice;

  BusReservation({
    this.reservationId,
    required this.customer,
    required this.busSchedule,
    required this.timestamp,
    required this.departureDate,
    required this.totalSeatBooked,
    required this.seatNumbers,
    required this.reservationStatus,
    required this.totalPrice,
  });

  factory BusReservation.fromJson(Map<String, dynamic> json) {
    print(json);

    return BusReservation(
      reservationId: json['reservationId'],
      customer: Customer.fromJson(json['customer']),
      busSchedule: BusSchedule.fromJson(json['busSchedule']),
      timestamp: json['timestamp'],
      departureDate: json['departureDate'],
      totalSeatBooked: json['totalSeatBooked'],
      seatNumbers: json['seatNumbers'],
      reservationStatus: json['reservationStatus'],
      totalPrice: json['totalPrice'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "reservationId": this.reservationId,
      "customer": this.customer,
      "busSchedule": this.busSchedule,
      "timestamp": this.timestamp,
      "departureDate": this.departureDate,
      "totalSeatBooked": this.totalSeatBooked,
      "seatNumbers": this.seatNumbers,
      "reservationStatus": this.reservationStatus,
      "totalPrice": this.totalPrice,
    };
  }
}
