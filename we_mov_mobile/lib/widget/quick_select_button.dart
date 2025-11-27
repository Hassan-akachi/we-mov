import 'package:flutter/material.dart';

import '../models/transport_data.dart';

class QuickSelectButton extends StatelessWidget {
  final TransportData transport;
  final bool isSelected;
  final VoidCallback onTap;

  const QuickSelectButton({
    super.key,
    required this.transport,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: transport.bgColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? Colors.grey[400]! : Colors.transparent,
            width: 2,
          ),
        ),
        child: Container(
          margin: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: transport.gradient,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            transport.icon,
            size: 28,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
