const String currency = '₦';
const String busTypeACEconomy = 'AC-ECONOMY';
const String busTypeACBusiness = 'AC-BUSINESS'; //busTypeACEconomy = 'AC-ECONOMY';
const String busTypeACExecutive = 'AC-EXECUTIVE'; //busTypeACBusiness = 'AC-BUSINESS';
const String reservationConfirmed = 'Confirmed';
const String reservationCancelled = 'Cancelled';
const String reservationActive = 'Active';
const String reservationExpired = 'Expired';
const String emptyFieldErrMessage = 'This field must not be empty';
const String emptyDateErrMessage = 'Select Departure Date ';
const String accessToken = 'accessToken';
const String loginTime = 'loginTime';
const String expirationDuration = 'expirationDuration';
const String isAdmin = 'isAdmin';
const String routeSplash = 'splash';
const String routeNameSelectTransport = 'select_transport';
const String routeNameHome = 'search';
const String routeNameSearchResultPage = 'search_result';
const String routeNameLoginPage = 'login';
const String routeNameSignupPage = 'signup';
const String routeNameSeatPlanPage = 'seat_plan';
const String routeNameBookingConfirmationPage = 'booking_confirmation';
const String routeNameAddBusPage = 'add_bus';
const String routeNameAddRoutePage = 'add_route';
const String routeNameAddSchedulePage = 'add_schedule';
const String routeNameScheduleListPage = 'schedule_list';
const String routeNameReservationPage = 'reservation';
const String routeNameReservationListScreenPage = 'reservation_screen';

const cities = [
  'Lagos',
  'Abeokuta',
  'Kano',
  'Abuja',
  'Ibadan',
  'Benin',
  'Port-Harcourt',
  'Kaduna',
  'Enugu',
];

enum TransportType {BUS,CAR,BOAT,AIRPLANE,TRAIN}
enum VehicleClass { economy, business, executive }

enum ResponseStatus { SAVED, FAILED, UNAUTHORIZED, AUTHORIZED, EXPIRED, NONE }

const busTypes = [busTypeACExecutive, busTypeACBusiness, busTypeACEconomy];

const seatLabelList = [
  'A',
  'B',
  'C',
  'D',
  'E',
  'F',
  'G',
  'H',
  'I',
  'J',
  'K',
  'L',
];
