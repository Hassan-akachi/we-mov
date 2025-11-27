import 'package:flutter/material.dart';

import '../models/transport_data.dart';

class TransportCard extends StatelessWidget {
  final TransportData transport;
  final bool isSelected;
  final VoidCallback onTap;

  const TransportCard({
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
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: transport.bgColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? Colors.grey[400]! : Colors.transparent,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              // Icon Container
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: transport.gradient,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: transport.gradient[0].withOpacity(0.3),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Icon(
                  transport.icon,
                  size: 40,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 20),

              // Text Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transport.name,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1E293B),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      transport.description,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),

              // Selection Indicator
              if (isSelected)
                Container(
                  width: 12,
                  height: 12,
                  decoration: const BoxDecoration(
                    color: Color(0xFF22C55E),
                    shape: BoxShape.circle,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
