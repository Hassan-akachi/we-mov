import 'package:we_mov_mobile/models/vehicle.dart'; // Import the generic Vehicle base class
// Assuming BusRoute will be renamed to Route, for now, use the current name
import 'bus_route.dart';

/// Represents the fixed itinerary for any type of transportation (Bus, Car, Airplane, etc.).
class Schedule {
  final int scheduleId;

  /// Links to the specific vehicle object (or the vehicle that is typically used
  /// for this schedule). Note: In a real system, this is often just a vehicle ID.
  final Vehicle vehicle;

  /// Links to the route this schedule operates on.
  final BusRoute route; // Will be renamed to Route later

  String departureTime;
  int ticketPrice;
  int discount;
  int processingFee;

  // Optional: Unique properties for schedules that apply across all transport types
  // final int durationMinutes;

  Schedule({
    required this.scheduleId,
    required this.vehicle,
    required this.route,
    required this.departureTime,
    required this.ticketPrice,
    this.discount = 0,
    this.processingFee = 50});

  // Example of a helper method to easily get the transport type
  String get transportName => vehicle.type.toString().split('.').last;

  // Example of a simplified copyWith method for immutability
  Schedule copyWith({
    int? scheduleId,
    Vehicle? vehicle,
    BusRoute? route,
    String? departureTime,
    int? ticketPrice,
  }) {
    return Schedule(
      scheduleId: scheduleId ?? this.scheduleId,
      vehicle: vehicle ?? this.vehicle,
      route: route ?? this.route,
      departureTime: departureTime ?? this.departureTime,
      ticketPrice: ticketPrice ?? this.ticketPrice,
    );
  }
}