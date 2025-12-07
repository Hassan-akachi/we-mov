
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/bus_route.dart';
import '../models/bus_schedule.dart';
import '../providers/app_data_provider.dart';
import '../utils/constants.dart';

class SearchResultPage extends StatelessWidget {
  const SearchResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final argList = ModalRoute.of(context)!.settings.arguments as List;
    final BusRoute route = argList[0];
    final String departureDate = argList[1];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Results'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          Text(
      '${route.cityFrom} to ${route.cityTo} by ${route.transportType.name},on $departureDate',
            style: const TextStyle(fontSize: 18),
          ),
          Consumer<AppDataProvider>(
            builder: (context, provider, _) => FutureBuilder<List<BusSchedule>>(
              future: provider.getSchedulesByRouteName(route.routeName,route.transportType),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final scheduleList = snapshot.data!;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: scheduleList
                        .map((schedule) => ScheduleItemView(
                        schedule: schedule, date: departureDate))
                        .toList(),
                  );
                }
                if (snapshot.hasError) {
                  return const Text('Failed to fetch data');
                }
                return const Text('Please wait');
              },
            ),
          )
        ],
      ),
    );
  }
}

class ScheduleItemView extends StatelessWidget {
  final String date;
  final BusSchedule schedule;

  const ScheduleItemView({Key? key, required this.schedule, required this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, routeNameSeatPlanPage, arguments: [schedule, date]),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text(schedule.bus.busName),
              subtitle: Text(schedule.bus.busType),
              trailing: Text('$currency${schedule.ticketPrice}'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'From: ${schedule.busRoute.cityFrom}',
                    style: const TextStyle(
                      fontSize: 17,
                    ),
                  ),
                  Text(
                    'To: ${schedule.busRoute.cityTo}',
                    style: const TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Departure Time: ${schedule.departureTime}',
                    style: const TextStyle(
                      fontSize: 17,
                    ),
                  ),
                  Text(
                    'Total Seat: ${schedule.bus.totalSeat}',
                    style: const TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


//
//
// class SearchResultPage extends StatelessWidget {
//   const SearchResultPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final argList = ModalRoute.of(context)!.settings.arguments as List;
//     final BusRoute route = argList[0];
//     final String departureDate = argList[1];
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Search Results'),
//       ),
//       body: ListView(
//         padding: const EdgeInsets.all(8),
//         children: [
//           Text(
//             '${route.cityFrom} to ${route.cityTo} by ${route.transportType.name}, on $departureDate',
//             style: const TextStyle(fontSize: 18),
//           ),
//           Consumer<AppDataProvider>(
//             builder: (context, provider, _) => FutureBuilder<List<Schedule>>(
//               future: provider.getVehicleSchedulesByRouteName(route),
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return const Center(child: CircularProgressIndicator());
//                 }
//
//                 if (snapshot.hasError) {
//                   // Print the specific error to the console for debugging
//                   debugPrint('Schedule Fetch Error: ${snapshot.error}');
//                   return Center(
//                     // Show a user-friendly message
//                     child: Text('Failed to fetch data. Error: ${snapshot.error.toString().split(':')[0]}'),
//                   );
//                 }
//
//                 if (snapshot.hasData) {
//                   final scheduleList = snapshot.data!;
//                   print("Schedules: $scheduleList");
//
//                   // 🔥 EMPTY RESULT DESIGN
//                   if (scheduleList.isEmpty) {
//                     return Center(
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           const Icon(Icons.directions_bus, size: 60, color: Colors.grey),
//                           const SizedBox(height: 12),
//                           Text(
//                             "No buses found for this route",
//                             style: TextStyle(
//                               fontSize: 18,
//                               color: Colors.grey.shade700,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                           const SizedBox(height: 5),
//                           Text(
//                             "Try another date or route",
//                             style: TextStyle(
//                               fontSize: 15,
//                               color: Colors.grey.shade500,
//                             ),
//                           ),
//                         ],
//                       ),
//                     );
//                   }
//
//                   // 🔥 HAS DATA → SHOW SCHEDULES
//                   return Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: scheduleList
//                         .map((schedule) => ScheduleItemView(
//                       schedule: schedule,
//                       date: departureDate,
//                     ))
//                         .toList(),
//                   );
//                 }
//
//                 return const SizedBox();
//
//               },
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
//
//
//
//
//

// class ScheduleItemView extends StatelessWidget {
//   final String date;
//   final Schedule schedule;
//
//   const ScheduleItemView({
//     Key? key,
//     required this.schedule,
//     required this.date,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () => Navigator.pushNamed(
//         context,
//         routeNameSeatPlanPage,
//         arguments: [schedule, date],
//       ),
//       child: Card(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             ListTile(
//               title: Text(schedule.vehicle.name),
//               subtitle: Text(schedule.vehicle.runtimeType.toString()),
//               trailing: Text('$currency${schedule.ticketPrice}'),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   Text(
//                     'From: ${schedule.route.cityFrom}',
//                     style: const TextStyle(fontSize: 17),
//                   ),
//                   Text(
//                     'To: ${schedule.route.cityTo}',
//                     style: const TextStyle(fontSize: 17),
//                   ),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   Text(
//                     'Departure Time: ${schedule.departureTime}',
//                     style: const TextStyle(fontSize: 17),
//                   ),
//                   Text(
//                     'Total Seat: ${schedule.vehicle.totalSeats}',
//                     style: const TextStyle(fontSize: 17),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
