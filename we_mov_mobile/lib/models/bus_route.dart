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

  factory BusRoute.fromJson(Map<String, dynamic> json) {
    print(json);

    return BusRoute(
      // Check if it's already an int; if not, parse it from string
      routeId: json["routeId"] is int
          ? json["routeId"]
          : int.tryParse(json["routeId"].toString()),

      routeName: json["routeName"] ?? '',
      cityFrom: json["cityFrom"] ?? '',
      cityTo: json["cityTo"] ?? '',

      // Check if it's already a double/num; if not, parse it
      distanceInKm: json["distanceInKm"] is num
          ? (json["distanceInKm"] as num).toDouble()
          : double.tryParse(json["distanceInKm"].toString()) ?? 0.0,

      transportType: TransportType.values.firstWhere(
            (e) => e.name == json["transportType"],
        orElse: () => TransportType.BUS,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "routeId": this.routeId,
      "routeName": this.routeName,
      "cityFrom": this.cityFrom,
      "cityTo": this.cityTo,
      "distanceInKm": this.distanceInKm,
      "transportType": transportType.name,
    };
  }

}