
import 'package:we_mov_mobile/models/schedule.dart';

import 'bus_schedule.dart';
import 'customer.dart';

class BusReservation {
  int? reservationId;
  Customer customer;
  BusSchedule? busSchedule;
  Schedule? schedule;
  int timestamp;
  String departureDate;
  int totalSeatBooked;
  String seatNumbers;
  String reservationStatus;
  int totalPrice;

  BusReservation({
    this.reservationId,
    required this.customer,
     this.busSchedule,
    this.schedule,
    required this.timestamp,
    required this.departureDate,
    required this.totalSeatBooked,
    required this.seatNumbers,
    required this.reservationStatus,
    required this.totalPrice,
  });
}