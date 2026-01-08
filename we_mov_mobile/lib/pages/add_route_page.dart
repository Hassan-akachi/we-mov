import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../customWidgets/login_alert_dialog.dart';
import '../customWidgets/select_transport_dropdown.dart';
import '../datasource/temp_db.dart';
import '../models/bus_route.dart';
import '../providers/app_data_provider.dart';
import '../utils/constants.dart';
import '../utils/helper_functions.dart';

class AddRoutePage extends StatefulWidget {
  const AddRoutePage({Key? key}) : super(key: key);

  @override
  State<AddRoutePage> createState() => _AddRoutePageState();
}

class _AddRoutePageState extends State<AddRoutePage> {
  final _formKey = GlobalKey<FormState>();
  String? from, to;
  final distanceController = TextEditingController();
  // 1. Define a state variable in the parent to hold the selected value
  late TransportType _parentSelectedTransport;

  // 2. Define the method that will be passed to the child
  void _handleTransportSelection(TransportType selectedType) {
    setState(() {
      _parentSelectedTransport = selectedType;
      print('Parent received: $selectedType');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Route'),
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            shrinkWrap: true,
            children: [
              TransportSelector( onTransportSelected: _handleTransportSelection,),


              const SizedBox(
                height: 10,
              ),

              DropdownButtonFormField<String>(
                onChanged: (value) {
                  setState(() {
                    from = value;
                  });
                },
                isExpanded: true,
                value: from,
                hint: const Text('From'),
                items: cities
                    .map((e) => DropdownMenuItem<String>(
                  value: e,
                  child: Text(e),
                ))
                    .toList(),
              ),
              const SizedBox(
                height: 5,
              ),
              DropdownButtonFormField<String>(
                onChanged: (value) {
                  setState(() {
                    to = value;
                  });
                },
                isExpanded: true,
                value: to,
                hint: const Text('To'),
                items: cities
                    .map((e) => DropdownMenuItem<String>(
                  value: e,
                  child: Text(e),
                ))
                    .toList(),
              ),
              const SizedBox(
                height: 5,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: distanceController,
                decoration: const InputDecoration(
                  hintText: 'Distance in Kilometer',
                  filled: true,
                  prefixIcon: Icon(Icons.social_distance_outlined),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return emptyFieldErrMessage;
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 5,
              ),
              Center(
                child: SizedBox(
                  width: 150,
                  child: ElevatedButton(
                    onPressed: addRoute,
                    child: const Text('ADD ROUTE'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void addRoute() {
    if (_formKey.currentState!.validate()) {
      final route = BusRoute(
        //routeId: TempDB.tableRoute.length + 1,
        routeName: '$from → $to (${_parentSelectedTransport.name})',
        cityFrom: from!,
        cityTo: to!,
        distanceInKm: double.parse(distanceController.text),
        transportType:_parentSelectedTransport
      );
      Provider.of<AppDataProvider>(context, listen: false)
          .addRoute(route)
          .then((response) {
        if(response.responseStatus == ResponseStatus.SAVED) {
          showToastMsg( response.message ?? "",context);
          resetFields();
        }else if (response.responseStatus == ResponseStatus.EXPIRED ||
            response.responseStatus == ResponseStatus.UNAUTHORIZED) {
          showLoginAlertDialog(
            context: context,
            message: response.message ?? "",
            callback: () {
              Navigator.pushNamed(context, routeNameLoginPage);
            },
          );
        }
      });

    }
  }
  @override
  void dispose() {
    distanceController.dispose();
    super.dispose();
  }

  void resetFields() {
    distanceController.clear();
  }
}
