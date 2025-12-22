package com.pl.wemovbackend.repository;


import com.pl.wemovbackend.entities.BusRoute;
import com.pl.wemovbackend.entities.TransportType;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface BusRouteRepository extends JpaRepository<BusRoute, Long> {
    Optional<BusRoute> findByRouteName(String routeName);
    Optional<BusRoute> findByCityFromAndCityToAndTransportType(String cityFrom, String cityTo, TransportType transportType);
}
