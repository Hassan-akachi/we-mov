import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:we_mov_mobile/pages/add_bus_page.dart';
import 'package:we_mov_mobile/pages/add_route_page.dart';
import 'package:we_mov_mobile/pages/add_schedule_page.dart';
import 'package:we_mov_mobile/pages/booking_confrimation_page.dart';
import 'package:we_mov_mobile/pages/login_page.dart';
import 'package:we_mov_mobile/pages/reservation_page.dart';
import 'package:we_mov_mobile/pages/search_page.dart';
import 'package:we_mov_mobile/pages/search_result_page.dart';
import 'package:we_mov_mobile/pages/seat_plan_page.dart';
import 'package:we_mov_mobile/pages/select_transport_page.dart';
import 'package:we_mov_mobile/pages/sign_up.dart';
import 'package:we_mov_mobile/pages/splash_page.dart';
import 'package:we_mov_mobile/providers/app_data_provider.dart';
import 'package:we_mov_mobile/utils/constants.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (create) => AppDataProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        brightness: Brightness.dark,

        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.lightGreen,

          accentColor: Colors.lightGreen.shade400, // Used for active/accent elements
          cardColor: Colors.grey.shade900,
          backgroundColor: Colors.grey.shade900,
          errorColor: Colors.red,
          brightness: Brightness.dark, // Ensure ColorScheme matches global brightness
        ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black,
              backgroundColor: Colors.lightGreen.shade400, // Light Green button background
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
          ),

          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              foregroundColor: Colors.lightGreen.shade400, // Light Green text color
            ),
          ),

          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Colors.lightGreen.shade400,
            foregroundColor: Colors.black,
          )
      ),
      //home: SelectTransportPage(),
      //SearchPage(),
      initialRoute: routeSplash,
      routes: {
        routeSplash :(context) => const SplashScreen(),
        routeNameSelectTransport : (context) => const SelectTransportPage(),
        routeNameHome: (context) => const SearchPage(),
        routeNameSearchResultPage: (context) => const SearchResultPage(),
        routeNameSeatPlanPage: (context) => const SeatPlanPage(),
        routeNameBookingConfirmationPage :(context)=> const BookingConfirmationPage(),
        routeNameAddBusPage : (context) => const AddBusPage(),
        routeNameAddRoutePage : (context) => const AddRoutePage(),
        routeNameAddSchedulePage : (context) => const AddSchedulePage(),
        routeNameReservationPage : (context) => const ReservationPage(),
        routeNameLoginPage : (context) => const LoginPage(),
        routeNameSignupPage : (context) => const SignUpPage(),

      },
    );
  }
}
