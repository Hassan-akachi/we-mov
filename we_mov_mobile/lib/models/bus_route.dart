import 'package:we_mov_mobile/utils/constants.dart';

class BusRoute {
  int? routeId;
  String routeName;
  String cityFrom;
  String cityTo;
  double distanceInKm;
  TransportType transportType ;

  BusRoute(
      {this.routeId,
      required this.routeName,
      required this.cityFrom,
      required this.cityTo,
      required this.distanceInKm,
      this.transportType = TransportType.BUS
      });
}