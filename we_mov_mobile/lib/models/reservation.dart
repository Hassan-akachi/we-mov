// reservation.dart

import 'package:we_mov_mobile/models/app_user.dart';
import 'package:we_mov_mobile/models/schedule.dart'; // Import the new generic Schedule class

import 'package:we_mov_mobile/utils/constants.dart';

/// Represents a customer's booking for any scheduled transport (Bus, Car, Plane, etc.).
class Reservation {
  final int? reservationId;
  final String departureDate;
  final String bookingDate; // Often equivalent to timestamp but kept separate for clarity
  final AppUser customer;
  final Schedule schedule; // Now links to the generic Schedule
  final int totalSeatBooked;
  final String seatNumbers;
  final double totalPrice;
  String reservationStatus;
  final int timestamp; // Unix timestamp of booking

  Reservation({
    this.reservationId,
    required this.departureDate,
    required this.bookingDate,
    required this.customer,
    required this.schedule, // Updated from busSchedule
    required this.totalSeatBooked,
    required this.seatNumbers,
    required this.totalPrice,
    required this.reservationStatus ,
    required this.timestamp,
  });

  // Helper to get the type of transport booked
  TransportType get transportType => schedule.vehicle.type;
}

/// You would also update ReservationExpansionItem and its sub-classes
/// (Header/Body) to use the generic Reservation and Schedule models.