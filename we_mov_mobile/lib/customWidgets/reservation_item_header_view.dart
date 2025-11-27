
import 'package:flutter/material.dart';

import '../models/reservation_expansion_item.dart';
import '../utils/helper_functions.dart';
//
// class ReservationItemHeaderView extends StatelessWidget {
//   final ReservationExpansionHeader header;
//   const ReservationItemHeaderView({Key? key, required this.header}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: ListTile(
//         title: Text('${header.departureDate} ${header.schedule.departureTime}'),
//         subtitle: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text('${header.schedule.busRoute.routeName}-${header.schedule.bus.busType}'),
//             Text('Booking Time: ${getFormattedDate(DateTime.fromMillisecondsSinceEpoch(header.timestamp), pattern: 'EEE MMM dd yyyy HH:mm')}'),
//           ],
//         ),
//       ),
//     );
//   }
// }



// reservation_item_header_view.dart

import 'package:flutter/material.dart';

import '../models/reservation_expansion_item.dart';
import '../utils/helper_functions.dart';

class ReservationItemHeaderView extends StatelessWidget {
  final ReservationExpansionHeader header;
  const ReservationItemHeaderView({Key? key, required this.header}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // FIX: Removed ListTile and replaced with a Column/Row structure
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0), // Adjust padding for a cleaner look
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Primary content (Title equivalent)
          Text(
            '${header.departureDate} ${header.schedule.departureTime}',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 4),
          // Subtitle content
          Text(
            '${header.schedule.busRoute.routeName}-${header.schedule.bus.busType}',
            style: const TextStyle(color: Colors.grey),
          ),
          Text(
            'Booking Time: ${getFormattedDate(DateTime.fromMillisecondsSinceEpoch(header.timestamp), pattern: 'EEE MMM dd yyyy HH:mm')}',
            style: const TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ],
      ),
    );
  }
}