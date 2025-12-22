package com.pl.wemovbackend.services;

import com.pl.wemovbackend.entities.Bus;

import java.util.List;

public interface BusService {
    Bus addBus(Bus bus);
    List<Bus> getAllBus();
}
