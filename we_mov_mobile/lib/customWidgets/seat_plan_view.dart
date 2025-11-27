import 'package:flutter/material.dart';
import 'package:we_mov_mobile/utils/colors.dart';
import 'package:we_mov_mobile/utils/constants.dart';

class SeatPlanView extends StatelessWidget {
  final int totalSeat, totalSeatBooked;
  final String bookedSeatNumber;
  final bool isBusinessClass;
  final Function(bool, String) onSeatSelected;

  const SeatPlanView({
    super.key,
    required this.totalSeat,
    required this.totalSeatBooked,
    required this.bookedSeatNumber,
    required this.isBusinessClass,
    required this.onSeatSelected,
  });

  @override
  Widget build(BuildContext context) {
    final noOfRow = isBusinessClass ? (totalSeat / 3) : (totalSeat / 4).toInt();
    final noOfColumn = isBusinessClass ? 3 : 4;
    List<List<String>> seatArrangement = [];

    for (int i = 0; i < noOfRow; i++) {
      List<String> columns = [];
      for (int j = 0; j < noOfColumn; j++) {
        columns.add('${seatLabelList[i]} ${j + 1}');
      }
      seatArrangement.add(columns);
    }
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
                            if (isBusinessClass && j == 0) SizedBox(width: 14),
                            if (!isBusinessClass && j == 1) SizedBox(width: 14),
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
