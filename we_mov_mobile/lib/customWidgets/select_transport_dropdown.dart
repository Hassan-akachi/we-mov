import 'package:flutter/material.dart';

import '../utils/constants.dart';

class TransportSelector extends StatefulWidget {
  // It takes the selected value (TransportType) and returns nothing (void).
  final ValueChanged<TransportType> onTransportSelected;
  const TransportSelector({super.key, required this.onTransportSelected});

  @override
  State<TransportSelector> createState() => _TransportSelectorState();
}

class _TransportSelectorState extends State<TransportSelector> {
  // 2. State variable to hold the selected transport type
  TransportType? selectedTransport;

  // Helper function to get a user-friendly string from the enum value
  String _getDisplayName(TransportType type) {
    return type.name.toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<TransportType>(
      // Set the currently selected value
      value: selectedTransport,

      // Hint text when nothing is selected
      hint: const Text('Select Transport Type'),

      // When a new value is selected
      onChanged: (TransportType? newValue) {
        setState(() {
          selectedTransport = newValue;
        });

        // Execute the function provided by the parent, passing the new value.
        if (newValue != null) {
          widget.onTransportSelected(newValue);
        }
      },

      isExpanded: true,

      // Map the enum values to DropdownMenuItems
      items: TransportType.values
          .map<DropdownMenuItem<TransportType>>((TransportType type) {
        return DropdownMenuItem<TransportType>(
          value: type,
          child: Text(_getDisplayName(type)), // Use the helper to display "BUS"
        );
      }).toList(),

      // Optional: Add validation
      validator: (TransportType? value) {
        if (value == null) {
          return 'Please select a transport type';
        }
        return null;
      },
    );
  }
}