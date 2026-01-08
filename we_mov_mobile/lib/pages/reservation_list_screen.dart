import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/bus_reservation.dart';
import '../providers/app_data_provider.dart';

class ReservationListPage extends StatefulWidget {
  const ReservationListPage({super.key});

  @override
  State<ReservationListPage> createState() => _ReservationListPageState();
}

class _ReservationListPageState extends State<ReservationListPage> {
  List<BusReservation> _allReservations = [];
  List<BusReservation> _filteredReservations = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadReservations();
  }

  Future<void> _loadReservations() async {
    final reservations =
    await Provider.of<AppDataProvider>(context, listen: false)
        .getAllReservations();

    setState(() {
      _allReservations = reservations;
      _filteredReservations = reservations;
      _loading = false;
    });
  }

  void _search(String query) {
    setState(() {
      _filteredReservations = _allReservations.where((res) {
        final mobile = res.customer.mobile.toLowerCase();
        final email = res.customer.email.toLowerCase();
        return mobile.contains(query.toLowerCase()) ||
            email.contains(query.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reservations')),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search by mobile or email',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onChanged: _search,
            ),
          ),
          Expanded(
            child: _filteredReservations.isEmpty
                ? const Center(child: Text('No reservations found'))
                : ListView.builder(
              itemCount: _filteredReservations.length,
              itemBuilder: (context, index) {
                final res = _filteredReservations[index];

                return Card(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 8, vertical: 4),
                  child: ExpansionTile(
                    title: Text(
                      res.customer.customerName,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(res.customer.mobile),
                    childrenPadding: const EdgeInsets.all(12),
                    children: [
                      _infoRow(
                          'Email', res.customer.email),
                      _infoRow(
                          'Route',
                          res.busSchedule.busRoute.routeName),
                      _infoRow(
                          'Departure Date',
                          res.departureDate),
                      _infoRow(
                          'Seats',
                          res.seatNumbers),
                      _infoRow(
                          'Total Seats',
                          res.totalSeatBooked.toString()),
                      _infoRow(
                          'Total Price',
                          '₦${res.totalPrice}'),
                      _infoRow(
                          'Status',
                          res.reservationStatus),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          SizedBox(
            width: 120,
            child: Text(
              '$label:',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}
