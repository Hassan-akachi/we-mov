package com.pl.wemovbackend.services.impl;

import com.pl.wemovbackend.entities.BusRoute;
import com.pl.wemovbackend.entities.BusSchedule;
import com.pl.wemovbackend.exceptions.ReservationApiException;
import com.pl.wemovbackend.repository.BusRouteRepository;
import com.pl.wemovbackend.repository.BusScheduleRepository;
import com.pl.wemovbackend.services.BusScheduleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.List;

@Service
public class BusScheduleServiceImpl implements BusScheduleService {
    @Autowired
    private BusScheduleRepository busScheduleRepository;

    @Autowired
    private BusRouteRepository busRouteRepository;


    @Override
    public BusSchedule addSchedule(BusSchedule busSchedule) throws ReservationApiException{
        final boolean exists =
                busScheduleRepository.existsByBusAndBusRouteAndDepartureTime(
                        busSchedule.getBus(),
                        busSchedule.getBusRoute(),
                        busSchedule.getDepartureTime());
        if(exists) {
            throw new ReservationApiException(HttpStatus.CONFLICT, "Duplicate Schedule");
        }
        return busScheduleRepository.save(busSchedule);
    }

    @Override
    public List<BusSchedule> getAllBusSchedules() {
        return busScheduleRepository.findAll();
    }

    @Override
    public List<BusSchedule> getSchedulesByRoute(String routeName) {
        final BusRoute busRoute = busRouteRepository.findByRouteName(routeName).orElseThrow(() -> new ReservationApiException(HttpStatus.BAD_REQUEST, "Not Found"));
        return busScheduleRepository.findByBusRoute(busRoute).orElseThrow(() -> new ReservationApiException(HttpStatus.BAD_REQUEST, "Not Found"));
    }
}
