
---

# 🚌 WeMov – Bus Reservation & Seat Booking System

## 📌 Overview

**WeMov** is a full-stack bus transportation reservation system that allows passengers to view available bus schedules, select seats, make reservations, and manage bookings in real time.
The system consists of a **Spring Boot REST API backend** and a **Flutter mobile application frontend**, with secure authentication using **JWT**.

---

## 🎯 Features

### Passenger Features

* View available bus routes and schedules
* Real-time seat availability
* Seat selection with visual seat plan
* Book bus tickets
* View reservation details
* Search reservations using mobile number or email

### Admin Features

* Secure login using JWT authentication
* Add buses, routes, and schedules
* View all reservations
* Manage schedules and pricing

---

## 🏗️ System Architecture

```
Flutter Mobile App
        |
        |  REST API (JSON)
        v
Spring Boot Backend
        |
        v
     MySQL Database
```

---

## 🛠️ Technology Stack

### Backend

* Java 17
* Spring Boot
* Spring Security
* JWT Authentication
* Spring Data JPA
* MySQL
* Maven

### Frontend

* Flutter (Dart)
* Provider (State Management)
* HTTP package
* Material UI

---

## 📂 Backend Modules

* **Authentication & Security**

    * JWT Token Provider
    * JWT Filter
    * Spring Security Configuration

* **Core Entities**

    * Bus
    * Route
    * Schedule
    * Customer
    * Reservation
    * Users (Admin)

* **Controllers**

    * AuthController
    * ReservationController
    * BusController
    * ScheduleController
    * RouteController

* **Services**

    * ReservationService
    * CustomUserDetailsService

---

## 📱 Mobile App Features

* Clean UI for seat selection
* Seat booking visualization (booked vs available)
* Reservation confirmation
* Reservation list with search by mobile/email
* Secure API communication

---

## 🔐 Authentication Flow

1. Admin logs in using username and password
2. Backend generates JWT token
3. Token is sent with each secured API request
4. JWT filter validates token for protected endpoints

---

## 📡 API Endpoints (Sample)

### Authentication

| Method | Endpoint          | Description |
| ------ | ----------------- | ----------- |
| POST   | `/api/auth/login` | Admin login |

### Reservation

| Method | Endpoint                 | Description                         |
| ------ | ------------------------ | ----------------------------------- |
| POST   | `/api/reservation/add`   | Create reservation                  |
| GET    | `/api/reservation/all`   | Get all reservations                |
| GET    | `/api/reservation/query` | Get reservations by schedule & date |

Example:

```
GET /api/reservation/query?scheduleId=19&departureDate=08/01/2026
```

---

## 🗄️ Database Design

Main tables:

* `bus`
* `bus_route`
* `bus_schedule`
* `customer`
* `bus_reservation`
* `app_users`

Each reservation links:

* One customer
* One bus schedule
* Multiple seat numbers (comma-separated)

---

## 🚀 Installation & Setup

### Backend Setup

1. Clone the repository
2. Configure `application.properties`

   ```properties
   spring.datasource.url=jdbc:mysql://localhost:3306/wemov
   spring.datasource.username=root
   spring.datasource.password=****
   app.jwt-secret=yourSecretKey
   app-jwt-expiration-milliseconds=86400000
   ```
3. Run the application

   ```bash
   mvn spring-boot:run
   ```

### Flutter App Setup

1. Navigate to the Flutter project
2. Install dependencies

   ```bash
   flutter pub get
   ```
3. Update API base URL

   ```dart
   const baseUrl = 'http://<SERVER_IP>:8080/api/';
   ```
4. Run the app

   ```bash
   flutter run
   ```

---

## ✅ Future Improvements

* Online payment integration
* QR code ticket validation
* Seat locking during booking
* Cancellation & refund system
* Role-based admin permissions
* Web dashboard for admin

---

## 👨‍💻 Author

**Hassan Sorunke**
Computer Science
Bus Reservation & Seat Booking System (WeMov)

---

## 📄 License

This project is for **educational and academic purposes**.

---
