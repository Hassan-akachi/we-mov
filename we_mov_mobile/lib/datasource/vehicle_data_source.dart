
import '../models/app_user.dart';
import '../models/auth_response_model.dart';
import '../models/bus_reservation.dart';
import '../models/bus_route.dart';
import '../models/response_model.dart';
import '../models/schedule.dart';
import '../models/vehicle.dart';
import '../utils/constants.dart';

abstract class VehicleDataSource {
  //Future<AuthResponseModel?> login(AppUser user);
  Future<ResponseModel> addVehicle(Vehicle vehicle);
  Future<List<Vehicle>> getAllVehicles();
   Future<ResponseModel> addVehicleRoute(BusRoute route);
  Future<List<BusRoute>> getAllVehicleRoutes();
  Future<BusRoute?> getVehicleRouteByRouteName(String routeName);
  Future<List<Schedule>> getSchedulesByVehicleRouteName(BusRoute route);
  Future<BusRoute?> getVehicleRouteByCityFromAndCityToAndType(String cityFrom, String cityTo,TransportType transportType);
  //Future<ResponseModel> addVehicleSchedule(Schedule schedule);
  Future<List<Schedule>> getAllSchedules();
  Future<ResponseModel> addSchedule(Schedule schedule);

  Future<ResponseModel> addVehicleBusReservation(BusReservation reservation);
  Future<List<BusReservation>> getAllVehicleReservation();
  Future<List<BusReservation>> getVehicleReservationsByMobile(String mobile) ;
  Future<List<BusReservation>> getVehicleReservationsByScheduleAndDepartureDate(int scheduleId, String departureDate);}