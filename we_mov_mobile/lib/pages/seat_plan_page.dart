import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:we_mov_mobile/customWidgets/seat_plan_view.dart';
import 'package:we_mov_mobile/models/bus_schedule.dart';
import 'package:we_mov_mobile/providers/app_data_provider.dart';
import 'package:we_mov_mobile/utils/colors.dart';
import 'package:we_mov_mobile/utils/constants.dart';

import '../utils/helper_functions.dart';

class SeatPlanPage extends StatefulWidget {
  const SeatPlanPage({super.key});

  @override
  State<SeatPlanPage> createState() => _SeatPlanPageState();
}

class _SeatPlanPageState extends State<SeatPlanPage> {
  late BusSchedule schedule;
  late String departureDate;
  int totalSeatBooked = 0;
  String bookedSeatNumbers = '';
  List<String> selectedSeats = [];
  bool isFirst = true;
  bool isDataLoading = true;

  ValueNotifier<String> selectedSeatStringNotifier = ValueNotifier('');

  @override
  void didChangeDependencies() {
    final arglist = ModalRoute.of(context)?.settings.arguments as List;
    schedule = arglist[0];
    departureDate = arglist[1];
    _getData();
    super.didChangeDependencies();
  }

  _getData() async {
    final resList = await Provider.of<AppDataProvider>(context, listen: false)
        .getReservationsByScheduleAndDepartureDate(
          schedule.scheduleId!,
          departureDate,
        );
    setState(() {
      isDataLoading = false;
    });
    List<String> seats = [];
    for (final res in resList) {
      totalSeatBooked = res.totalSeatBooked;
      seats.add((res.seatNumbers));
    }
    bookedSeatNumbers = seats.join(',');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('Seat Plan')),
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            width: 20,
                            height: 20,
                            color: seatBookedColor,
                          ),
                          SizedBox(width: 10),
                          Text('Booked', style: TextStyle(fontSize: 16)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            width: 20,
                            height: 20,
                            color: seatAvailableColor,
                          ),
                          SizedBox(width: 10),
                          Text('Available', style: TextStyle(fontSize: 16)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              ValueListenableBuilder(
                valueListenable: selectedSeatStringNotifier,
                builder: (context, value, _) {
                  return Text(
                    'Selected : $value',
                    style: TextStyle(fontSize: 16),
                  );
                },
              ),
              if(!isDataLoading)
                Expanded(
                child: SingleChildScrollView(
                  child: SeatPlanView(
                    totalSeat: schedule.bus.totalSeat,
                    totalSeatBooked: totalSeatBooked,
                    bookedSeatNumber: bookedSeatNumbers,
                    isBusinessClass: schedule.bus.busType == busTypeACBusiness,
                    onSeatSelected: (value, seat) {
                      if (value) {
                        selectedSeats.add(seat);
                      } else {
                        selectedSeats.remove(seat);
                      }
                      selectedSeatStringNotifier.value = selectedSeats.join(
                        ',',
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 10),
              OutlinedButton(
                onPressed: () {
                  if (selectedSeats.isEmpty) {
                    showToastMsg('Please select your seats', context);
                    return;
                  }
                  Navigator.pushNamed(
                    context,
                    routeNameBookingConfirmationPage,
                    arguments: [
                      departureDate,
                      schedule,
                      selectedSeatStringNotifier.value,
                      selectedSeats.length,
                    ],
                  );
                },
                child: Text('Next'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
