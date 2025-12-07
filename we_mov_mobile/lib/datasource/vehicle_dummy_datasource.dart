import 'package:we_mov_mobile/datasource/temp_db.dart';
import 'package:we_mov_mobile/datasource/vehicle_data_source.dart';
import 'package:we_mov_mobile/models/bus_model.dart';
import 'package:we_mov_mobile/models/vehicle.dart'; // New generic import

import '../models/app_user.dart';
import '../models/auth_response_model.dart';

// NEW GENERIC IMPORTS:
import '../models/bus_reservation.dart';
import '../models/bus_route.dart';


import '../models/schedule.dart';
import '../models/response_model.dart';
import '../utils/constants.dart';


class VehicleDummyDatasource extends VehicleDataSource {

  // RENAME: addBus -> addVehicle, update parameter/return types
  @override
  Future<ResponseModel> addVehicle(Vehicle vehicle) async {
    TempDB.tableVehicle.add(vehicle);
    return ResponseModel(responseStatus: ResponseStatus.SAVED, statusCode: 200, message: 'Vehicle Saved', object: {});
  }

  // RENAME: addBusReservation, update parameter type
  @override
  Future<ResponseModel> addVehicleBusReservation(BusReservation reservation) async {
    TempDB.tableReservation.add(reservation);
    print(TempDB.tableReservation.length);
    return ResponseModel(responseStatus: ResponseStatus.SAVED, statusCode: 200, message: 'Your reservation has been saved', object: {});
  }

  // RENAME: addBusRoute, update parameter type
  @override
  Future<ResponseModel> addVehicleRoute(BusRoute route) async {
    TempDB.tableRoute.add(route);
    return ResponseModel(responseStatus: ResponseStatus.SAVED, statusCode: 200, message: 'BusRoute Saved', object: {});
  }

  // RENAME: addSchedule, update parameter type
  @override
  Future<ResponseModel> addSchedule(Schedule schedule) async {
    TempDB.tableVehicleSchedule.add(schedule);
    return ResponseModel(responseStatus: ResponseStatus.SAVED, statusCode: 200, message: 'Schedule Saved', object: {});
  }

  // RENAME: getAllBus -> getAllVehicles
  @override
  Future<List<Vehicle>> getAllVehicles() async {
    return TempDB.tableVehicle;
  }

  // RENAME: getAllBusReservation
  @override
  Future<List<BusReservation>> getAllVehicleReservation() async {
    return TempDB.tableReservation; // Casting for TempDB list type
  }

  // RENAME: getAllBusRoutes
  @override
  Future<List<BusRoute>> getAllVehicleRoutes() async {
    return TempDB.tableRoute;
  }

  // RENAME: getAllSchedules
  @override
  Future<List<Schedule>> getAllSchedules() {
    // Implement or return the generic schedule list
    return Future.value(TempDB.tableVehicleSchedule);
  }

  // RENAME: getBusReservationsByMobile, update return type
  @override
  Future<List<BusReservation>> getVehicleReservationsByMobile(String mobile) async {
    return TempDB.tableReservation
        .where((element) => element.customer.mobile == mobile)
        .toList();
  }

  // RENAME: getBusReservationsByScheduleAndDepartureDate, update return type and property access
  @override
  Future<List<BusReservation>> getVehicleReservationsByScheduleAndDepartureDate(int scheduleId, String departureDate) async {
    return TempDB.tableReservation
        .where((element) => element.schedule?.scheduleId == scheduleId && // Access schedule.scheduleId
        element.departureDate == departureDate)
        .toList();
  }

  // RENAME: getBusRouteByCityFromAndCityTo, update return type
  @override
  Future<BusRoute?> getVehicleRouteByCityFromAndCityToAndType(String cityFrom, String cityTo,TransportType transportType) async {
    BusRoute? route;
    try {
      route = TempDB.tableRoute.firstWhere((element) =>
      element.cityFrom == cityFrom && element.cityTo == cityTo && element.transportType == transportType);
      return route;

    } on StateError {
      return null;
    }
  }

  // RENAME: getBusRouteByBusRouteName, update return type
  @override
  Future<BusRoute?> getVehicleRouteByRouteName(String routeName) {
    throw UnimplementedError();
  }

  // RENAME: getSchedulesByBusRouteName, update return type and property access
  @override
  Future<List<Schedule>> getSchedulesByVehicleRouteName(BusRoute route) async {
    return TempDB.tableVehicleSchedule
        .where((schedule) =>
    // Check if the schedule's route matches the search criteria
    schedule.route.routeName == route.routeName &&
        schedule.route.transportType == route.transportType )
        .toList();
  }

  // @override
  // Future<ResponseModel> addVehicleSchedule(Schedule schedule) {
  //   // TODO: implement addVehicleSchedule
  //   throw UnimplementedError();
  // }





}