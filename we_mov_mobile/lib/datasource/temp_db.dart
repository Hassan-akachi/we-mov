
import 'package:we_mov_mobile/models/boat_model.dart';

import '../models/bus_model.dart';
import '../models/bus_reservation.dart';
import '../models/bus_route.dart';
import '../models/bus_schedule.dart';
import '../models/car_model.dart';
import '../models/plane_model.dart';
import '../models/schedule.dart';
import '../models/train_model.dart';
import '../models/vehicle.dart';
import '../utils/constants.dart';



class TempDB {
  static List<Bus> tableBus = [
    Bus(busId: 1, busName: 'Test Bus1', busNumber: 'Test-0001', busType: busTypeACExecutive, totalSeat: 18,transportType: TransportType.BUS),
    Bus(busId: 2, busName: 'Test Bus2', busNumber: 'Test-0002', busType: busTypeACBusiness, totalSeat: 32,transportType: TransportType.BUS),
    Bus(busId: 3, busName: 'Test Bus3', busNumber: 'Test-0003', busType: busTypeACEconomy, totalSeat: 40,transportType: TransportType.BUS),
    Bus(busId: 4, busName: 'Test car1', busNumber: 'Test-0004', busType: busTypeACExecutive, totalSeat: 4,transportType: TransportType.CAR),
    Bus(busId: 5, busName: 'Test car2', busNumber: 'Test-0005', busType: busTypeACBusiness, totalSeat: 6,transportType: TransportType.CAR),
    Bus(busId: 6, busName: 'Test car3', busNumber: 'Test-0006', busType: busTypeACEconomy, totalSeat: 8,transportType: TransportType.CAR),
    Bus(busId: 7, busName: 'Test plane1', busNumber: 'Test-0007', busType: busTypeACExecutive, totalSeat: 80,transportType: TransportType.AIRPLANE),
    Bus(busId: 8, busName: 'Test plane2', busNumber: 'Test-0008', busType: busTypeACBusiness, totalSeat: 140,transportType: TransportType.AIRPLANE),
    Bus(busId: 9, busName: 'Test plane3', busNumber: 'Test-0009', busType: busTypeACEconomy, totalSeat: 460,transportType: TransportType.AIRPLANE),
    Bus(busId: 10, busName: 'Test train1', busNumber: 'Test-0010', busType: busTypeACExecutive, totalSeat: 80,transportType: TransportType.TRAIN),
    Bus(busId: 11, busName: 'Test train2', busNumber: 'Test-0011', busType: busTypeACBusiness, totalSeat: 140,transportType: TransportType.TRAIN),
    Bus(busId: 12, busName: 'Test train3', busNumber: 'Test-0012', busType: busTypeACEconomy, totalSeat: 400,transportType: TransportType.TRAIN),
    Bus(busId: 13, busName: 'Test Boat1', busNumber: 'Test-0013', busType: busTypeACExecutive, totalSeat: 7,transportType: TransportType.BOAT),
    Bus(busId: 14, busName: 'Test Boat2', busNumber: 'Test-0014', busType: busTypeACBusiness, totalSeat: 20,transportType: TransportType.BOAT),
    Bus(busId: 15, busName: 'Test Boat3', busNumber: 'Test-0015', busType: busTypeACEconomy, totalSeat: 40,transportType: TransportType.BOAT),
  ];
  // ----------------------------
  // VEHICLES (BUS, CAR, AIRPLANE)
  // ----------------------------
  static List<Vehicle> tableVehicle = [
    // Buses (3 examples)
    // Bus(busId: 1, busName: 'City Express AC Business', busNumber: 'BUS-0001', busType: busTypeACBusiness, totalSeat: 18,),
    // Bus(busId: 2, busName: 'Economy Shuttle', busNumber: 'BUS-0002', busType: busTypeACEconomy, totalSeat: 32,),
    // Bus(busId: 3, busName: 'Local Commuter', busNumber: 'BUS-0003', busType: busTypeNonAc, totalSeat: 40,),
    // Bus(busId: 4, busName: 'Sleeper Bus', busNumber: 'BUS-0004', busType: busTypeACBusiness, totalSeat: 24,),
    // Bus(busId: 5, busName: 'Intercity Luxury', busNumber: 'BUS-0005', busType: busTypeACEconomy, totalSeat: 28,),

    // Cars (4 examples)
    Car(id: 10, name: 'Economy Sedan', number: 'CAR-E001', vehicleClass: VehicleClass.economy, totalSeats: 4, trunkCapacityLiters: 450, isElectric: false,),
    Car(id: 11, name: 'Executive Mercedes', number: 'CAR-E002', vehicleClass: VehicleClass.executive, totalSeats: 4, trunkCapacityLiters: 550, isElectric: true,),
    Car(id: 12, name: 'Family SUV', number: 'CAR-F001', vehicleClass: VehicleClass.business, totalSeats: 7, trunkCapacityLiters: 800, isElectric: false,),
    Car(id: 13, name: 'Luxury Tesla', number: 'CAR-L001', vehicleClass: VehicleClass.executive, totalSeats: 5, trunkCapacityLiters: 600, isElectric: true,),
    Car(id: 14, name: 'Compact Hatchback', number: 'CAR-C001', vehicleClass: VehicleClass.economy, totalSeats: 5, trunkCapacityLiters: 350, isElectric: true,),

    // Airplanes (4 examples)
    Airplane(id: 20, name: 'City Hopper Jet', number: 'PLANE-CH01', vehicleClass: VehicleClass.economy, totalSeats: 80, maxAltitudeFeet: 35000, airlineCode: 'WM',),
    Airplane(id: 21, name: 'Vice City Business Jet', number: 'PLANE-CH02', vehicleClass: VehicleClass.business, totalSeats: 50, maxAltitudeFeet: 41000, airlineCode: 'WM',),
    Airplane(id: 22, name: 'Transatlantic Widebody', number: 'PLANE-TA01', vehicleClass: VehicleClass.executive, totalSeats: 300, maxAltitudeFeet: 43000, airlineCode: 'AA',),
    Airplane(id: 23, name: 'Regional Turboprop', number: 'PLANE-RT01', vehicleClass: VehicleClass.economy, totalSeats: 40, maxAltitudeFeet: 25000, airlineCode: 'RQ',),
    Airplane(id: 24, name: 'Private Charter Jet', number: 'PLANE-PC01', vehicleClass: VehicleClass.executive, totalSeats: 12, maxAltitudeFeet: 45000, airlineCode: 'PC',),

    // Trains (5 examples)
    Train(id: 30, name: 'Express Bullet Train', number: 'TRN-B001', vehicleClass: VehicleClass.executive, totalSeats: 500, isElectric: true, numberOfCoaches: 16, hasDiningCar: true,),
    Train(id: 31, name: 'Metro Commuter', number: 'TRN-M001', vehicleClass: VehicleClass.economy, totalSeats: 800, isElectric: true, numberOfCoaches: 8, hasDiningCar: false,),
    Train(id: 32, name: 'Heritage Steam Train', number: 'TRN-H001', vehicleClass: VehicleClass.business, totalSeats: 120, isElectric: false, numberOfCoaches: 4, hasDiningCar: true,),
    Train(id: 33, name: 'Overnight Sleeper', number: 'TRN-S001', vehicleClass: VehicleClass.executive, totalSeats: 200, isElectric: true, numberOfCoaches: 10, hasDiningCar: true,),
    Train(id: 34, name: 'Freight Carrier', number: 'TRN-F001', vehicleClass: VehicleClass.economy, totalSeats: 100, isElectric: false, numberOfCoaches: 20, hasDiningCar: false,),

    /* Boats (5 examples) */
    Boat(id: 40, name: 'Ocean Queen Yacht', number: 'BOAT-Y001', vehicleClass: VehicleClass.executive, totalSeats: 20, boatType: BoatType.YACHT, lengthInMeters: 25.5, hasLifeJackets: true, hasRestroom: true, maxPassengers: 30,),
    Boat(id: 41, name: 'Express Ferry', number: 'BOAT-F001', vehicleClass: VehicleClass.economy, totalSeats: 150, boatType: BoatType.FERRY, lengthInMeters: 45.0, hasLifeJackets: true, hasRestroom: true, maxPassengers: 200,),
    Boat(id: 42, name: 'Coastal Speedboat', number: 'BOAT-S001', vehicleClass: VehicleClass.business, totalSeats: 12, boatType: BoatType.SPEEDBOAT, lengthInMeters: 8.5, hasLifeJackets: true, hasRestroom: false, maxPassengers: 15,),
    Boat(id: 43, name: 'River Canoe', number: 'BOAT-C001', vehicleClass: VehicleClass.economy, totalSeats: 2, boatType: BoatType.CANOE, lengthInMeters: 4.5, hasLifeJackets: true, hasRestroom: false, maxPassengers: 2,),
    Boat(id: 44, name: 'Mega Cruise Ship', number: 'BOAT-CS001', vehicleClass: VehicleClass.executive, totalSeats: 2000, boatType: BoatType.CRUISE_SHIP, lengthInMeters: 300.0, hasLifeJackets: true, hasRestroom: true, maxPassengers: 2500,),
  ];
  // ----------------------------
  // ROUTES
  // ----------------------------
  static List<BusRoute> tableRoute = [
    BusRoute(routeId: 1, routeName: 'Lagos → Abuja', cityFrom: 'Lagos', cityTo: 'Abuja', distanceInKm: 250, transportType: TransportType.BUS),
    BusRoute(routeId: 2, routeName: 'Abuja → Lagos', cityFrom: 'Abuja', cityTo: 'Lagos', distanceInKm: 250, transportType: TransportType.BUS),
    BusRoute(routeId: 3, routeName: 'Abuja → Kano', cityFrom: 'Abuja', cityTo: 'Kano', distanceInKm: 150, transportType: TransportType.CAR),
    BusRoute(routeId: 4, routeName: 'Kano → Abuja', cityFrom: 'Kano', cityTo: 'Abuja', distanceInKm: 150, transportType: TransportType.CAR),
    BusRoute(routeId: 5, routeName: 'Ibadan → Kano', cityFrom: 'Ibadan', cityTo: 'Kano', distanceInKm: 650, transportType: TransportType.TRAIN),
    BusRoute(routeId: 6, routeName: 'Abuja → Ibadan', cityFrom: 'Abuja', cityTo: 'Ibadan', distanceInKm: 550, transportType: TransportType.TRAIN),
    BusRoute(routeId: 7, routeName: 'Lagos → Abuja', cityFrom: 'Lagos', cityTo: 'Abuja', distanceInKm: 250, transportType: TransportType.TRAIN),
    BusRoute(routeId: 8, routeName: 'Benin → Abuja', cityFrom: 'Benin', cityTo: 'Abuja', distanceInKm: 450, transportType: TransportType.AIRPLANE),
    BusRoute(routeId: 9, routeName: 'Kano → Benin', cityFrom: 'Kano', cityTo: 'Benin', distanceInKm: 450, transportType: TransportType.AIRPLANE),
    BusRoute(routeId: 10, routeName: 'Lagos → Port-Harcourt', cityFrom: 'Lagos', cityTo: 'Port-Harcourt', distanceInKm: 350, transportType: TransportType.BOAT),
    BusRoute(routeId: 11, routeName: 'Kaduna → Kano', cityFrom: 'Kaduna', cityTo: 'Kano', distanceInKm: 150, transportType: TransportType.BOAT),
  ];


  static List<BusSchedule> tableSchedule = [
    //index :-> tableBus 0-2 ,table 0-1
    BusSchedule(scheduleId: 1, bus: tableBus[0], busRoute: tableRoute[0], departureTime: '18:00', ticketPrice: 2000,),
    BusSchedule(scheduleId: 2, bus: tableBus[1], busRoute: tableRoute[0], departureTime: '20:00', ticketPrice: 1600,),
    BusSchedule(scheduleId: 3, bus: tableBus[2], busRoute: tableRoute[0], departureTime: '22:00', ticketPrice: 1000,),
    BusSchedule(scheduleId: 4, bus: tableBus[0], busRoute: tableRoute[1], departureTime: '18:00', ticketPrice: 2000,),
    // ==================== CAR SCHEDULES ====================
  //tableBus 3-5 ,tableroute 2-3
    BusSchedule(scheduleId: 5, bus: tableBus[3],     /* Economy Sedan (index 5 = first car) */busRoute: tableRoute[2], departureTime: '07:00', ticketPrice: 5000,),
    BusSchedule(scheduleId: 6, bus: tableBus[4],     /* Executive Mercedes */busRoute: tableRoute[2], departureTime: '12:00', ticketPrice: 7500,),
    BusSchedule(scheduleId: 7, bus: tableBus[5],     /* Family SUV */busRoute: tableRoute[2], departureTime: '16:00', ticketPrice: 6000,),

    // Route 4: Kano → Abuja (CAR) - 3 schedules
    BusSchedule(scheduleId: 8, bus: tableBus[3],     /* Luxury Tesla */busRoute: tableRoute[3], departureTime: '08:00', ticketPrice: 8000,),
    BusSchedule(scheduleId: 9, bus: tableBus[5],     /* Compact Hatchback (index 9 = second car) */busRoute: tableRoute[3], departureTime: '13:00', ticketPrice: 4500,),
    BusSchedule(scheduleId: 10, bus: tableBus[4],     /* Executive Mercedes (reused) */busRoute: tableRoute[3], departureTime: '18:00', ticketPrice: 7500,),

    // ==================== AIRPLANE SCHEDULES ====================
//index :-> tableBus 6-8 ,table 7-8
    // Route 5: Ibadan → Kano (AIRPLANE) - 3 schedules/ROUTES,VEHICLE(
    BusSchedule(scheduleId: 11, bus: tableBus[7],    busRoute: tableRoute[7], departureTime: '06:00', ticketPrice: 6500,),
    BusSchedule(scheduleId: 12, bus: tableBus[6],   busRoute: tableRoute[7], departureTime: '14:00', ticketPrice: 4500,),
    BusSchedule(scheduleId: 13, bus: tableBus[8],    busRoute: tableRoute[8], departureTime: '22:00', ticketPrice: 5500,),

    // Route 6: Abuja → Ibadan (TRAIN) - 3 schedules
    BusSchedule(scheduleId: 14, bus: tableBus[7],    /* Overnight Sleeper */busRoute: tableRoute[8], departureTime: '21:00', ticketPrice: 5500,),
    BusSchedule(scheduleId: 15, bus: tableBus[6],    /* Freight Carrier (with passenger seats) */busRoute: tableRoute[8], departureTime: '10:00', ticketPrice: 3500,),
    BusSchedule(scheduleId: 16, bus: tableBus[8],    /* Express Bullet Train */busRoute: tableRoute[8], departureTime: '15:00', ticketPrice: 6500,),

    BusSchedule(scheduleId: 16, bus: tableBus[6],    /* Express Bullet Train */busRoute: tableRoute[0], departureTime: '15:00', ticketPrice: 6500,),

    // ==================== TRAIN SCHEDULES ====================
//index :-> tableBus 9-11 ,table 4-6
    // Route 7: Benin → Abuja (AIRPLANE) - 3 schedules
    BusSchedule(scheduleId: 17, bus: tableBus[10],    /* City Hopper Jet (index 10 = first airplane) */busRoute: tableRoute[4], departureTime: '08:00', ticketPrice: 15000,),
    BusSchedule(scheduleId: 18, bus: tableBus[9],    /* Vice City Business Jet */busRoute: tableRoute[6], departureTime: '14:00', ticketPrice: 25000,),
    BusSchedule(scheduleId: 19, bus: tableBus[11],    /* Transatlantic Widebody */busRoute: tableRoute[6], departureTime: '20:00', ticketPrice: 20000,),


    BusSchedule(scheduleId: 20, bus: tableBus[11],    /* Regional Turboprop */busRoute: tableRoute[4], departureTime: '09:00', ticketPrice: 12000,),
    BusSchedule(scheduleId: 21, bus: tableBus[9],    /* Private Charter Jet */busRoute: tableRoute[5], departureTime: '16:00', ticketPrice: 35000,),
    BusSchedule(scheduleId: 22, bus: tableBus[10],    /* City Hopper Jet */busRoute: tableRoute[4], departureTime: '22:00', ticketPrice: 15000,), // ==================== BOAT SCHEDULES (Extra) ==================== Note: No
    // boat busRoutes in tableRoute, but let's add some example boat schedules


    // ==================== BOAT SCHEDULES ====================
//index :-> tableBus 12-14 ,table 9-10
    /* Example Boat Route 1 (not in tableRoute) */
    BusSchedule(scheduleId: 23, bus: tableBus[12],    /* Ocean Queen Yacht (index 20 = first boat) */busRoute: tableRoute[9], departureTime: '10:00', ticketPrice: 8000,),

    // Example Boat Route 2 (not in tableRoute)
    BusSchedule(scheduleId: 24, bus: tableBus[13],    /* Express Ferry */busRoute: tableRoute[9], departureTime: '08:00', ticketPrice: 12000,),
    BusSchedule(scheduleId: 24, bus: tableBus[14],    /* Express Ferry */busRoute: tableRoute[10], departureTime: '08:00', ticketPrice: 12000,)
  ];


  // ----------------------------
  // SCHEDULES FOR ALL VEHICLES
  // ----------------------------
  static List<Schedule> tableVehicleSchedule = [
    // ==================== BUS SCHEDULES ====================

    // Route 1: Lagos → Abuja (BUS) - 2 schedules
    Schedule(scheduleId: 1, vehicle: tableVehicle[0],     /* City Express AC Business */route: tableRoute[0], departureTime: '08:00', ticketPrice: 2000,),
    Schedule(scheduleId: 2, vehicle: tableVehicle[1],     /* Economy Shuttle */route: tableRoute[0], departureTime: '14:00', ticketPrice: 1600,),

    // Route 2: Abuja → Lagos (BUS) - 2 schedules
    Schedule(scheduleId: 3, vehicle: tableVehicle[2],    route: tableRoute[1], departureTime: '09:00', ticketPrice: 1800,),
    Schedule(scheduleId: 4, vehicle: tableVehicle[3],     /* Sleeper Bus */route: tableRoute[1], departureTime: '22:00', ticketPrice: 3500,),

    // ==================== CAR SCHEDULES ====================

    // Route 3: Abuja → Kano (CAR) - 3 schedules
    Schedule(scheduleId: 5, vehicle: tableVehicle[5],     /* Economy Sedan (index 5 = first car) */route: tableRoute[2], departureTime: '07:00', ticketPrice: 5000,),
    Schedule(scheduleId: 6, vehicle: tableVehicle[6],     /* Executive Mercedes */route: tableRoute[2], departureTime: '12:00', ticketPrice: 7500,),
    Schedule(scheduleId: 7, vehicle: tableVehicle[7],     /* Family SUV */route: tableRoute[2], departureTime: '16:00', ticketPrice: 6000,),

    // Route 4: Kano → Abuja (CAR) - 3 schedules
    Schedule(scheduleId: 8, vehicle: tableVehicle[8],     /* Luxury Tesla */route: tableRoute[3], departureTime: '08:00', ticketPrice: 8000,),
    Schedule(scheduleId: 9, vehicle: tableVehicle[9],     /* Compact Hatchback (index 9 = second car) */route: tableRoute[3], departureTime: '13:00', ticketPrice: 4500,),
    Schedule(scheduleId: 10, vehicle: tableVehicle[6],     /* Executive Mercedes (reused) */route: tableRoute[3], departureTime: '18:00', ticketPrice: 7500,),

    // ==================== TRAIN SCHEDULES ====================

    // Route 5: Ibadan → Kano (TRAIN) - 3 schedules
    Schedule(scheduleId: 11, vehicle: tableVehicle[15],    /* Express Bullet Train (index 15 = first train) */route: tableRoute[4], departureTime: '06:00', ticketPrice: 6500,),
    Schedule(scheduleId: 12, vehicle: tableVehicle[16],    /* Metro Commuter */route: tableRoute[4], departureTime: '14:00', ticketPrice: 4500,),
    Schedule(scheduleId: 13, vehicle: tableVehicle[17],    /* Heritage Steam Train */route: tableRoute[4], departureTime: '22:00', ticketPrice: 5500,),

    // Route 6: Abuja → Ibadan (TRAIN) - 3 schedules
    Schedule(scheduleId: 14, vehicle: tableVehicle[18],    /* Overnight Sleeper */route: tableRoute[5], departureTime: '21:00', ticketPrice: 5500,),
    Schedule(scheduleId: 15, vehicle: tableVehicle[19],    /* Freight Carrier (with passenger seats) */route: tableRoute[5], departureTime: '10:00', ticketPrice: 3500,),
    Schedule(scheduleId: 16, vehicle: tableVehicle[15],    /* Express Bullet Train */route: tableRoute[5], departureTime: '15:00', ticketPrice: 6500,),

    Schedule(scheduleId: 16, vehicle: tableVehicle[15],    /* Express Bullet Train */route: tableRoute[5], departureTime: '15:00', ticketPrice: 6500,),

    // ==================== AIRPLANE SCHEDULES ====================

    // Route 7: Benin → Abuja (AIRPLANE) - 3 schedules
    Schedule(scheduleId: 17, vehicle: tableVehicle[10],    /* City Hopper Jet (index 10 = first airplane) */route: tableRoute[6], departureTime: '08:00', ticketPrice: 15000,),
    Schedule(scheduleId: 18, vehicle: tableVehicle[11],    /* Vice City Business Jet */route: tableRoute[6], departureTime: '14:00', ticketPrice: 25000,),
    Schedule(scheduleId: 19, vehicle: tableVehicle[12],    /* Transatlantic Widebody */route: tableRoute[6], departureTime: '20:00', ticketPrice: 20000,),

    // Route 8: Kano → Benin (AIRPLANE) - 3 schedules
    Schedule(scheduleId: 20, vehicle: tableVehicle[13],    /* Regional Turboprop */route: tableRoute[7], departureTime: '09:00', ticketPrice: 12000,),
    Schedule(scheduleId: 21, vehicle: tableVehicle[14],    /* Private Charter Jet */route: tableRoute[7], departureTime: '16:00', ticketPrice: 35000,),
    Schedule(scheduleId: 22, vehicle: tableVehicle[10],    /* City Hopper Jet */route: tableRoute[7], departureTime: '22:00', ticketPrice: 15000,), // ==================== BOAT SCHEDULES (Extra) ==================== Note: No
    // boat routes in tableRoute, but let's add some example boat schedules

    /* Example Boat Route 1 (not in tableRoute) */
    Schedule(scheduleId: 23, vehicle: tableVehicle[20],    /* Ocean Queen Yacht (index 20 = first boat) */route: tableRoute[9], departureTime: '10:00', ticketPrice: 8000,),

    // Example Boat Route 2 (not in tableRoute)
    Schedule(scheduleId: 24, vehicle: tableVehicle[21],    /* Express Ferry */route: tableRoute[9], departureTime: '08:00', ticketPrice: 12000,),];

  static List<BusReservation> tableReservation = [];

}