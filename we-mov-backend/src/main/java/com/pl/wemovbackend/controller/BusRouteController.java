package com.pl.wemovbackend.controller;


import com.pl.wemovbackend.entities.BusRoute;
import com.pl.wemovbackend.entities.TransportType;
import com.pl.wemovbackend.models.ResponseModel;
import com.pl.wemovbackend.services.BusRouteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/route")
public class BusRouteController {

    @Autowired
    private BusRouteService busRouteService;

    @PostMapping("/add")
    public ResponseModel<BusRoute> addRoute(@RequestBody BusRoute busRoute) {
        final BusRoute busRoute1 = busRouteService.addRoute(busRoute);
        return new ResponseModel<>(HttpStatus.OK.value(), "Route Saved", busRoute1);
    }

    @GetMapping("/all")
    public ResponseEntity<List<BusRoute>> getAllRoutes() {
        return ResponseEntity.ok(busRouteService.getAllBusRoutes());
    }

  //  example of how to pathvariable
//    @GetMapping("/{routeName}")
//    public ResponseEntity<BusRoute> getRouteByRouteName(@PathVariable(name = "routeName") String routeName) {
//        return ResponseEntity.ok(busRouteService.getRouteByRouteName(routeName));
//    }


    @GetMapping("/routeName")
    public ResponseEntity<BusRoute> getByRouteName(
            @RequestParam String routeName
    ) {
        return ResponseEntity.ok(busRouteService.getRouteByRouteName(routeName));
    }


    @GetMapping("/query")
    public ResponseEntity<BusRoute> getRouteByCityFromAndCityTo(
            @RequestParam String cityFrom,
            @RequestParam String cityTo,
            @RequestParam TransportType transportType

    ) {
        return ResponseEntity.ok(busRouteService.getRouteByCityFromAndCityTo(cityFrom, cityTo,transportType));
    }
}
