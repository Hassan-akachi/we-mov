
import 'package:flutter/material.dart';

import '../models/bus_model.dart';
import '../models/reservation_expansion_item.dart';
import '../utils/helper_functions.dart';
class ReservationItemHeaderView extends StatelessWidget {
  final ReservationExpansionHeader header;
  const ReservationItemHeaderView({Key? key, required this.header}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // ensure full width
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${header.departureDate} ${header.schedule.departureTime}',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            '${header.schedule.busRoute.routeName} - ${header.schedule.bus.busType}',
            style: const TextStyle(color: Colors.grey),
          ),
          Text(
            'Booking Time: ${getFormattedDate(
              DateTime.fromMillisecondsSinceEpoch(header.timestamp),
              pattern: 'EEE MMM dd yyyy HH:mm',
            )}',
            style: const TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ],
      ),
    );
  }
}



// // reservation_item_header_view.dart
//
// import 'package:flutter/material.dart';
//
// import '../models/reservation_expansion_item.dart';
// import '../utils/helper_functions.dart';
//
// class ReservationItemHeaderView extends StatelessWidget {
//   final ReservationExpansionHeader header;
//   const ReservationItemHeaderView({Key? key, required this.header}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     // FIX: Removed ListTile and replaced with a Column/Row structure
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0), // Adjust padding for a cleaner look
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Primary content (Title equivalent)
//           Text(
//             '${header.departureDate} ${header.schedule.departureTime}',
//             style: const TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: 16,
//             ),
//           ),
//           const SizedBox(height: 4),
//           // Subtitle content
//           Text(
//             '${header.schedule.busRoute.routeName}-${header.schedule.bus.busType}',
//             style: const TextStyle(color: Colors.grey),
//           ),
//           Text(
//             'Booking Time: ${getFormattedDate(DateTime.fromMillisecondsSinceEpoch(header.timestamp), pattern: 'EEE MMM dd yyyy HH:mm')}',
//             style: const TextStyle(color: Colors.grey, fontSize: 12),
//           ),
//         ],
//       ),
//     );
//   }
// }