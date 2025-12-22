package com.pl.wemovbackend.repository;

import com.pl.wemovbackend.entities.BusSchedule;
import com.pl.wemovbackend.entities.Customer;
import com.pl.wemovbackend.entities.Reservation;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface ReservationRepository extends JpaRepository<Reservation, Long> {
    Optional<List<Reservation>> findByCustomer(Customer customer);
    Optional<List<Reservation>> findByBusScheduleAndDepartureDate(BusSchedule busSchedule, String departureDate);

}
