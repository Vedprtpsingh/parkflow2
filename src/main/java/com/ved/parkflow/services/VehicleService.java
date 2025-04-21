package com.ved.parkflow.services;

import com.ved.parkflow.entities.Vehicle;
import java.util.List;

public interface VehicleService {
    boolean addVehicle(Vehicle vehicle);
    List<Vehicle> getVehiclesByOwnerId(int ownerId);
    Vehicle getVehicleByLicensePlate(String licensePlate);
}
