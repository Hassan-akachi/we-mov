import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String getFormattedDate(DateTime dt,{String pattern ='dd/MM/yyy'}){
  return DateFormat(pattern).format(dt);
}


String getFormattedTime(TimeOfDay tm, {String pattern = 'HH:mm'}) {
  return DateFormat(pattern).format(DateTime(0,0,0,tm.hour,tm.minute));
}


void showToastMsg(String msg,BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content:  Row(
        children: [
          Icon(Icons.info_outline, color: Colors.white),
          SizedBox(width: 12),
          Text(
            msg,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,color: Colors.white),
          ),
        ],
      ),
      backgroundColor: Colors.black87,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      duration: const Duration(seconds: 3),
    ),
  );


}


int getGrandTotal (int discount,int totalSeatBooked,int price,int fee){
  final subTotal = totalSeatBooked * price;
  final priceAfterDiscount =
      subTotal - ((subTotal * discount)/ 100);
  return (priceAfterDiscount + fee).toInt();
}