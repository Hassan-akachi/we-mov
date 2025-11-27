import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:we_mov_mobile/drawers/main_drawer.dart';
import 'package:we_mov_mobile/pages/search_page.dart';
import 'package:we_mov_mobile/providers/app_data_provider.dart';
import 'package:we_mov_mobile/utils/helper_functions.dart';

import '../models/transport_data.dart';
import '../utils/constants.dart';
import '../widget/quick_select_button.dart';
import '../widget/transport_card.dart';

class SelectTransportPage extends StatelessWidget {
  const SelectTransportPage({super.key});


  @override
  Widget build(BuildContext context) {
    TransportType? selectedTransport;

    // Create a map to associate transport types with screens
    final List<TransportData> transports = [
      TransportData(
        type: TransportType.BUS,
        name: 'Bus',
        icon: Icons.directions_bus_rounded,
        gradient: const [Color(0xFFFB923C), Color(0xFFEA580C)],
        bgColor: const Color(0xFFFFF7ED),
        description: 'Comfortable city travel',
      ),
      TransportData(
        type: TransportType.CAR,
        name: 'Car',
        icon: Icons.directions_car_rounded,
        gradient: const [Color(0xFF60A5FA), Color(0xFF2563EB)],
        bgColor: const Color(0xFFEFF6FF),
        description: 'Private and flexible',
      ),
      TransportData(
        type: TransportType.BOAT,
        name: 'Boat',
        icon: Icons.directions_boat_rounded,
        gradient: const [Color(0xFF22D3EE), Color(0xFF0891B2)],
        bgColor: const Color(0xFFECFEFF),
        description: 'Scenic water routes',
      ),
      TransportData(
        type: TransportType.AIRPLANE,
        name: 'Airplane',
        icon: Icons.flight_rounded,
        gradient: const [Color(0xFFA78BFA), Color(0xFF7C3AED)],
        bgColor: const Color(0xFFFAF5FF),
        description: 'Fast long distance',
      ),
      TransportData(
        type: TransportType.TRAIN,
        name: 'Train',
        icon: Icons.train_rounded,
        gradient: const [Color(0xFF4ADE80), Color(0xFF16A34A)],
        bgColor: const Color(0xFFF0FDF4),
        description: 'Reliable rail travel',
      ),
    ];

    return Scaffold(appBar: AppBar(),
      drawer: MainDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  const Text(
                    'Choose Your Transport',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,

                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Select your preferred mode of transportation',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            // Transport Cards
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: transports.length,
                itemBuilder: (context, index) {
                  final transport = transports[index];
                  final isSelected = selectedTransport == transport.type;

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: TransportCard(
                      transport: transport,
                      isSelected: isSelected,
                      onTap: () {
                        // setState(() {
                        //   selectedTransport = transport.type;
                        // });
                        //context.read<AppDataProvider>().setTransport(transport.type);

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            //builder: (context) => transportScreens[transport.type]!(),
                            builder: (context) => SearchPage()
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),


          ],
        ),
      ),
    );
  }
}

