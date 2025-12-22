package com.pl.wemovbackend.services.impl;


import com.pl.wemovbackend.entities.BusRoute;
import com.pl.wemovbackend.entities.TransportType;
import com.pl.wemovbackend.exceptions.ReservationApiException;
import com.pl.wemovbackend.repository.BusRouteRepository;
import com.pl.wemovbackend.services.BusRouteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BusRouteServiceImpl implements BusRouteService {

    @Autowired
    private BusRouteRepository busRouteRepository;
    @Override
    public BusRoute addRoute(BusRoute busRoute) {
        return busRouteRepository.save(busRoute);
    }

    @Override
    public List<BusRoute> getAllBusRoutes() {
        return busRouteRepository.findAll();
    }

    @Override
    public BusRoute getRouteByRouteName(String routeName) {
        return busRouteRepository.findByRouteName(routeName).orElseThrow(() -> new ReservationApiException(HttpStatus.BAD_REQUEST, "No such route found!"));
    }

    @Override
    public BusRoute getRouteByCityFromAndCityTo(String cityFrom, String cityTo, TransportType transportType) {
        return busRouteRepository.findByCityFromAndCityToAndTransportType(cityFrom, cityTo,transportType).orElseThrow(() -> new ReservationApiException(HttpStatus.BAD_REQUEST, "No such route found!"));
    }
}
