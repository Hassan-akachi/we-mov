import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../customWidgets/reservation_item_body_view.dart';
import '../customWidgets/reservation_item_header_view.dart';
import '../customWidgets/search_box.dart';
import '../models/reservation_expansion_item.dart';
import '../providers/app_data_provider.dart';
import '../utils/helper_functions.dart';

// class ReservationPage extends StatefulWidget {
//   const ReservationPage({Key? key}) : super(key: key);
//
//   @override
//   State<ReservationPage> createState() => _ReservationPageState();
// }
//
// class _ReservationPageState extends State<ReservationPage> {
//   bool isFirst = true;
//   List<ReservationExpansionItem> items = [];
//
//   @override
//   void didChangeDependencies() {
//     if (isFirst) {
//       _getData();
//       isFirst = false;
//     }
//     super.didChangeDependencies();
//   }
//
//   _getData() async {
//     final reservations = await Provider.of<AppDataProvider>(
//       context,
//       listen: false,
//     ).getAllReservations();
//     items = Provider.of<AppDataProvider>(
//       context,
//       listen: false,
//     ).getExpansionItems(reservations);
//     setState(() {});
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Reservation List')),
//       body: ListView(
//         children: [
//           SearchBox(onSubmit: (value) => _search(value)),
//           ExpansionPanelList(
//             expansionCallback: (index, isExpanded) {
//               setState(() {
//                 items[index].isExpanded = !isExpanded;
//               });
//             },
//             children: items
//                 .map(
//                   (item) => ExpansionPanel(
//                     canTapOnHeader: true,
//                     isExpanded: item.isExpanded,
//                     headerBuilder: (_, isExpanded) =>
//                         ReservationItemHeaderView(header: item.header),
//                     body: ReservationItemBodyView(body: item.body),
//                   ),
//                 )
//                 .toList(),
//           ),
//         ],
//       ),
//
//       // SingleChildScrollView(
//       //   child: Column(
//       //     children: [
//       //       SearchBox(onSubmit: (value) {
//       //         _search(value);
//       //       }),
//       //       ExpansionPanelList(
//       //         expansionCallback: (index, isExpanded) {
//       //           setState(() {
//       //             items[index].isExpanded = !isExpanded;
//       //           });
//       //         },
//       //         children: items.map((item) => ExpansionPanel(
//       //             canTapOnHeader: true,
//       //             isExpanded: item.isExpanded,
//       //             headerBuilder: (context, isExpanded) => ReservationItemHeaderView(header: item.header),
//       //             body: ReservationItemBodyView(body: item.body,)
//       //         )).toList(),
//       //       ),
//       //     ],
//       //   ),
//       // ),
//     );
//   }
//
//   void _search(String value) async {
//     final data = await Provider.of<AppDataProvider>(
//       context,
//       listen: false,
//     ).getReservationsByMobile(value);
//     if (data.isEmpty) {
//       showToastMsg('No record found', context);
//       return;
//     }
//     setState(() {
//       items = Provider.of<AppDataProvider>(
//         context,
//         listen: false,
//       ).getExpansionItems(data);
//     });
//   }
// }




class ReservationPage extends StatefulWidget {
  const ReservationPage({Key? key}) : super(key: key);

  @override
  State<ReservationPage> createState() => _ReservationPageState();
}

class _ReservationPageState extends State<ReservationPage> {
  late Future<void> _loadFuture;
  List<ReservationExpansionItem> _items = [];

  @override
  void initState() {
    super.initState();
    _loadFuture = _loadInitialData();
  }

  Future<void> _loadInitialData() async {
    final provider = Provider.of<AppDataProvider>(context, listen: false);
    final reservations = await provider.getAllReservations();
    _items = provider.getExpansionItems(reservations);
  }

  Future<void> _search(String value) async {
    final provider = Provider.of<AppDataProvider>(context, listen: false);
    final data = await provider.getReservationsByMobile(value);

    if (data.isEmpty) {
      showToastMsg('No record found', context);
      return;
    }

    setState(() {
      _items = provider.getExpansionItems(data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reservation List')),
      body: Column(
        children: [
          SearchBox(onSubmit: _search),

          Expanded(
            child: FutureBuilder(
              future: _loadFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (_items.isEmpty) {
                  return const Center(child: Text('No reservations found.'));
                }

                return  SingleChildScrollView(
                  child: ExpansionPanelList(
                    expansionCallback: (index, isExpanded) {
                      print("Tapped index: $index  |  wasExpanded: $isExpanded");
                      setState(() {
                        _items[index].isExpanded = !isExpanded;
                      });
                    },
                    children: _items.map((item) {
                      return ExpansionPanel(
                        canTapOnHeader: true,
                        isExpanded: item.isExpanded,
                        headerBuilder: (_, __) =>
                            ReservationItemHeaderView(header: item.header),
                        body: ReservationItemBodyView(body: item.body),
                      );
                    }).toList(),
                  ),
                );


              },
            ),
          ),
        ],
      ),
    );
  }
}
