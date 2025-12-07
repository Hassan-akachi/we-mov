import 'package:flutter/material.dart';
import 'package:we_mov_mobile/utils/colors.dart';
import 'package:we_mov_mobile/utils/constants.dart';

class SeatPlanView extends StatelessWidget {
  final int totalSeat, totalSeatBooked;
  final String bookedSeatNumber;
  final bool isExecutive;
  final Function(bool, String) onSeatSelected;

  const SeatPlanView({
    super.key,
    required this.totalSeat,
    required this.totalSeatBooked,
    required this.bookedSeatNumber,
    required this.isExecutive,
    required this.onSeatSelected,
  });


  // 1. Static method to generate column headers (A, B, C, ...)
  static List<String> _generateSeatLabels(int count) {
    List<String> labels = [];
    for (int i = 0; i < count; i++) {
      int dividend = i;
      String label = '';

      // Standard English alphabet offset (A is ASCII 65)
      while (dividend >= 0) {
        int remainder = dividend % 26;
        label = String.fromCharCode(65 + remainder) + label;
        dividend = (dividend / 26).toInt() - 1; // Move to the next "digit"
      }
      labels.add(label);
    }
    return labels;
  }

  @override
  Widget build(BuildContext context) {

    // Determine configuration
    final int noOfColumn = isExecutive ? 3 : 4;

    // 2. Calculate the required number of rows using ceil() to fit ALL seats
    final int requiredRows = (totalSeat / noOfColumn).ceil();

    // 3. Generate the seat labels dynamically
    final List<String> seatLabelList = _generateSeatLabels(requiredRows);

    // Now, noOfRow equals the number of labels we just generated
    final int noOfRow = seatLabelList.length;

    List<List<String>> seatArrangement = [];
    int seatsPlaced = 0;

    for (int i = 0; i < noOfRow; i++) {
      List<String> columns = [];
      for (int j = 0; j < noOfColumn; j++) {
        // Check if we have placed all total seats
        if (seatsPlaced < totalSeat) {
          // IMPORTANT: i is now guaranteed to be a valid index for seatLabelList
          columns.add('${seatLabelList[i]} ${j + 1}');
          seatsPlaced++;
        } else {
          // Add a blank/dummy column if the row is incomplete and all seats are placed
          columns.add('');
        }
      }
      seatArrangement.add(columns);
    }



    // // Inside SeatPlanView or a helper function
    // final int noOfColumn = isBusinessClass ? 3 : 4;
    // final int requiredRows = (totalSeat / noOfColumn).ceil();
    // final noOfRow = isBusinessClass ? (totalSeat / 3) : (totalSeat / 4).toInt();
    // List<List<String>> seatArrangement = [];
    //
    // for (int i = 0; i < noOfRow; i++) {
    //   List<String> columns = [];
    //   for (int j = 0; j < noOfColumn; j++) {
    //     columns.add('${seatLabelList[i]} ${j + 1}');
    //   }
    //   seatArrangement.add(columns);
    // }
    final List<String> bookSeatList = bookedSeatNumber.isEmpty
        ? []
        : bookedSeatNumber.split(',');

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(8),
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey, width: 2),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text('Front', style: TextStyle(fontSize: 30, color: Colors.grey)),
            Divider(height: 2, color: Colors.black),
            Column(
              children: [
                for (int i = 0; i < seatArrangement.length; i++)
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      for (int j = 0; j < seatArrangement[i].length; j++)
                        Row(
                          children: [
                            Seat(
                              label: seatArrangement[i][j],
                              isBooked: bookSeatList.contains(
                                seatArrangement[i][j],
                              ),
                              onSelect: (value) {
                                onSeatSelected(value, seatArrangement[i][j]);
                              },
                            ),
                            if (isExecutive && j == 0) SizedBox(width: 14),
                            if (!isExecutive && j == 1) SizedBox(width: 14),
                          ],
                        ),
                    ],
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Seat extends StatefulWidget {
  final String label;
  final bool isBooked;
  final Function(bool) onSelect;

  const Seat({
    super.key,
    required this.label,
    required this.isBooked,
    required this.onSelect,
  });

  @override
  State<Seat> createState() => _SeatState();
}

class _SeatState extends State<Seat> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: 50,
        height: 50,
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: widget.isBooked
              ? seatBookedColor
              : selected
              ? seatSelectedColor
              : seatAvailableColor,
          borderRadius: BorderRadius.circular(8),
          boxShadow: widget.isBooked
              ? null
              : [
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-4, -4),
                    spreadRadius: 2,
                    blurRadius: 5,
                  ),
                  BoxShadow(
                    color: Colors.grey.shade400,
                    offset: Offset(4, 4),
                    spreadRadius: 2,
                    blurRadius: 5,
                  ),
                ],
        ),
        child: Center(
          child: Text(
            widget.label,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: selected ? Colors.grey : Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      onTap: widget.isBooked
          ? null
          : () {
              setState(() {
                selected = !selected;
              });
              widget.onSelect(selected);
            },
    );
  }
}
