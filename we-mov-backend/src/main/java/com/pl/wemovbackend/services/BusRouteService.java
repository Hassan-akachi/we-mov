package com.pl.wemovbackend.services;



import com.pl.wemovbackend.entities.BusRoute;
import com.pl.wemovbackend.entities.TransportType;

import java.util.List;

public interface BusRouteService {
    BusRoute addRoute(BusRoute busRoute);
    List<BusRoute> getAllBusRoutes();

    BusRoute getRouteByRouteName(String routeName);

    BusRoute getRouteByCityFromAndCityTo(String cityFrom, String cityTo, TransportType transportType);
}
