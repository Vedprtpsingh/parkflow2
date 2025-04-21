package com.ved.parkflow.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ved.parkflow.entities.Vehicle;
import com.ved.parkflow.repositories.VehicleRepository;
import java.util.List;
import java.util.logging.Logger;

@Service
public class VehicleServiceImpl implements VehicleService {

    @Autowired
    private VehicleRepository vehicleRepository;

    private static final Logger logger = Logger.getLogger(VehicleServiceImpl.class.getName());

    @Override
    public boolean addVehicle(Vehicle vehicle) {
        try {
            vehicleRepository.save(vehicle);
            logger.info("Vehicle saved: " + vehicle.getLicensePlate());
            return true;
        } catch (Exception e) {
            logger.warning("Error saving vehicle: " + e.getMessage());
            return false;
        }
    }

    @Override
    public List<Vehicle> getVehiclesByOwnerId(int ownerId) {
        return vehicleRepository.findByOwnerId(ownerId);
    }

    @Override
    public Vehicle getVehicleByLicensePlate(String licensePlate) {
        return vehicleRepository.findByLicensePlate(licensePlate);
    }
}
