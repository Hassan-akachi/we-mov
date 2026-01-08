import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constants.dart';

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
          SizedBox(width: 4),
          Text(
            msg,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500,color: Colors.white),
          ),
        ],
      ),
      backgroundColor: Colors.black87,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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

Future<bool> saveToken(String token) async {
  final pref = await SharedPreferences.getInstance();
  return pref.setString(accessToken, token);
}

Future<String> getToken() async {
  final pref = await SharedPreferences.getInstance();
  return pref.getString(accessToken) ?? '';
}

Future<bool> saveLoginTime(int time) async {
  final pref = await SharedPreferences.getInstance();
  return pref.setInt(loginTime, time);
}

Future<int> getLoginTime() async {
  final pref = await SharedPreferences.getInstance();
  return pref.getInt(loginTime) ?? 0;
}

Future<bool> saveExpirationDuration(int duration) async {
  final pref = await SharedPreferences.getInstance();
  return pref.setInt(expirationDuration, duration);
}

Future<int> getExpirationDuration() async {
  final pref = await SharedPreferences.getInstance();
  return pref.getInt(expirationDuration) ?? 0;
}


Future<bool> saveIsAdmin(String role) async {
  final pref = await SharedPreferences.getInstance();
  return pref.setString(isAdmin, role);
}

Future<String> getIsAdmin() async {
  final pref = await SharedPreferences.getInstance();
  return pref.getString(isAdmin) ??'';
}

Future<bool> hasTokenExpired() async {
  final loginTime = await getLoginTime();
  final expDuration = await getExpirationDuration();
  return DateTime.now().millisecondsSinceEpoch - loginTime > expDuration;
}