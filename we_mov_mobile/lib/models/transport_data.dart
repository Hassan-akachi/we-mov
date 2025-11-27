import 'package:flutter/material.dart';

import '../utils/constants.dart';

class TransportData {
  final TransportType type;
  final String name;
  final IconData icon;
  final List<Color> gradient;
  final Color bgColor;
  final String description;

  TransportData({
    required this.type,
    required this.name,
    required this.icon,
    required this.gradient,
    required this.bgColor,
    required this.description,
  });
}