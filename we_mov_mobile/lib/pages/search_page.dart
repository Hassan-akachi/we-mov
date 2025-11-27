import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:we_mov_mobile/datasource/temp_db.dart';
import 'package:we_mov_mobile/providers/app_data_provider.dart';
import 'package:we_mov_mobile/utils/constants.dart';
import 'package:we_mov_mobile/utils/helper_functions.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String? fromCity, toCity;
  DateTime? departureDate;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    //final transport = context.watch<AppDataProvider>().selectedTransportString;
    return Scaffold(
      appBar: AppBar(title: Text("Search ")),
      body: Form(
        key: _formKey,
        child: Center(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.all(8),
            children: [
              Text(
                'Book Your Ride ',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(height: 20),
              DropdownButtonFormField<String>(
                initialValue: fromCity,

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return emptyFieldErrMessage;
                  }
                  return null;
                },
                decoration: InputDecoration(
                  errorStyle: TextStyle(color: Colors.white),
                ),
                hint: Text("From"),
                items: cities
                    .map(
                      (city) => DropdownMenuItem<String>(
                        value: city,
                        child: Text(city),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  fromCity = value;
                },
              ),
              SizedBox(height: 20),

              DropdownButtonFormField<String>(
                initialValue: toCity,

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return emptyFieldErrMessage;
                  }
                  return null;
                },
                decoration: InputDecoration(
                  errorStyle: TextStyle(color: Colors.white),
                ),
                hint: Text("To"),
                items: cities
                    .map(
                      (city) => DropdownMenuItem<String>(
                        value: city,
                        child: Text(city),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  toCity = value;
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: _selectDate,
                      child: Text("Select Departure Date"),
                    ),
                    Text(
                      departureDate == null
                          ? 'No Date Chosen'
                          : getFormattedDate(
                              departureDate!,
                              pattern: 'EEE MMM dd, yyy',
                            ),
                    ),
                  ],
                ),
              ),
              Center(
                child: SizedBox(
                  width: 180,
                  child: ElevatedButton(
                    onPressed: _search,
                    child: Text('search'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _selectDate() async {
    final selectedDate = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 21)),
      initialDate: DateTime.now(),
    );
    if (selectedDate != null) {
      setState(() {
        departureDate = selectedDate;
      });
    }
  }

  void _search() {
    if (departureDate == null) {
      showToastMsg(emptyDateErrMessage, context);
      return;
    }
    if (_formKey.currentState!.validate()) {
      Provider.of<AppDataProvider>(
        context,
        listen: false,
      ).getRouteByCityFromAndCityTo(fromCity!, toCity!).then((route) {
        Navigator.pushNamed(
          context,
          routeNameSearchResultPage,
          arguments: [route, getFormattedDate(departureDate!)],
        );
      });
    }
  }
}
