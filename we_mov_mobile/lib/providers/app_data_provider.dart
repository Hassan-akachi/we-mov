import 'package:flutter/material.dart';
import 'package:we_mov_mobile/datasource/app_data_source.dart';
import 'package:we_mov_mobile/datasource/vehicle_data_source.dart';
import 'package:we_mov_mobile/models/schedule.dart';
import 'package:we_mov_mobile/models/vehicle.dart';

import '../datasource/data_source.dart';
import '../datasource/dummy_data_source.dart';
import '../models/app_user.dart';
import '../models/auth_response_model.dart';
import '../models/bus_model.dart';
import '../models/bus_reservation.dart';
import '../models/bus_route.dart';
import '../models/bus_schedule.dart';
import '../models/reservation_expansion_item.dart';
import '../models/response_model.dart';
import '../utils/constants.dart';
import '../utils/helper_functions.dart';


class AppDataProvider extends ChangeNotifier {
  List<Bus> _busList = [];
  List<Vehicle>_vehicleList = [];
  List<BusRoute> _routeList = [];
  List<BusReservation> _reservationList = [];
  List<BusSchedule> _scheduleList = [];

  List<BusSchedule> get scheduleList => _scheduleList;

  List<Bus> get busList => _busList;
  List<Vehicle> get vehicleList => _vehicleList;

  List<BusRoute> get routeList => _routeList;

  List<BusReservation> get reservationList => _reservationList;
  final DataSource _dataSource = AppDataSource(); //DummyDataSource();





  Future<AuthResponseModel?> login(AppUser user) async {
    final response = await _dataSource.login(user);
    if(response == null) return null;
    await saveToken(response.accessToken);
    await saveLoginTime(response.loginTime);
    await saveExpirationDuration(response.expirationDuration);
    await saveIsAdmin(user.role);
    return response;
  }



  // New property to track selected transport
  TransportType? _selectedTransport;

  TransportType? get selectedTransport => _selectedTransport;

  /// Setter method to update the selected transport type
  void setTransport(TransportType type) {
    _selectedTransport = type;
    notifyListeners();
  }



  Future<ResponseModel> addBus(Bus bus) {
    return _dataSource.addBus(bus);
  }

  Future<ResponseModel> addRoute(BusRoute route) {
    return _dataSource.addRoute(route);
  }

  Future<ResponseModel> addSchedule(BusSchedule busSchedule) {
    return _dataSource.addSchedule(busSchedule);
  }

  Future<ResponseModel> addReservation(BusReservation reservation) {
    return _dataSource.addReservation(reservation);
  }

  void getAllBus() async {
    _busList = await _dataSource.getAllBus();
    notifyListeners();
  }

  void getAllBusRoutes() async {
    _routeList = await _dataSource.getAllRoutes();
    notifyListeners();
  }

  Future<List<BusReservation>> getAllReservations() async {
    _reservationList = await _dataSource.getAllReservation();
    notifyListeners();
    return _reservationList;
  }

  Future<List<BusReservation>> getReservationsByMobile(String mobile) {
    return _dataSource.getReservationsByMobile(mobile);
  }

  Future<BusRoute?> getRouteByCityFromAndCityTo(
      String cityFrom, String cityTo, TransportType? selectedTransport) {
    return _dataSource.getRouteByCityFromAndCityTo(cityFrom, cityTo,selectedTransport);
  }

  Future<List<BusSchedule>> getSchedulesByRouteName(String routeName, TransportType transportType) async {
    return _dataSource.getSchedulesByRouteName(routeName,transportType);
  }


  Future<List<BusReservation>> getReservationsByScheduleAndDepartureDate(
      int scheduleId, String departureDate) {
    return _dataSource.getReservationsByScheduleAndDepartureDate(
        scheduleId, departureDate);
  }

  List<ReservationExpansionItem> getExpansionItems(List<BusReservation> reservationList) {
    return List.generate(reservationList.length, (index) {
      final reservation = reservationList[index];
      return ReservationExpansionItem(
        header: ReservationExpansionHeader(
          reservationId: reservation.reservationId,
          departureDate: reservation.departureDate,
          schedule: reservation.busSchedule!,// reservation.Schedule,
          timestamp: reservation.timestamp,
          reservationStatus: reservation.reservationStatus,
        ),
        body: ReservationExpansionBody(
          customer: reservation.customer,
          totalSeatedBooked: reservation.totalSeatBooked,
          seatNumbers: reservation.seatNumbers,
          totalPrice: reservation.totalPrice,
        ),
      );
    });
  }
}
