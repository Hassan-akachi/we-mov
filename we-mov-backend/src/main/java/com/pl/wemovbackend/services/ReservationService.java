package com.pl.wemovbackend.services;


import com.pl.wemovbackend.entities.Reservation;

import java.util.List;

public interface ReservationService {
    Reservation addReservation(Reservation reservation);

    List<Reservation> getAllReservations();

    List<Reservation> getReservationsByScheduleAndDepartureDate(Long scheduleId, String departureDate);

    List<Reservation> getReservationsByMobile(String mobile);

    List<Reservation> getReservationsByEMail(String email);
}
