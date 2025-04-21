package com.ved.parkflow.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ved.parkflow.entities.ParkingSlot;
import com.ved.parkflow.repositories.ParkingSlotRepository;

import java.util.List;
import java.util.logging.Logger;

@Service
public class ParkingSlotServiceImpl implements ParkingSlotService {

    @Autowired
    private ParkingSlotRepository parkingSlotRepository;

    private static final Logger logger = Logger.getLogger(ParkingSlotServiceImpl.class.getName());

    @Override
    public boolean addParkingSlot(ParkingSlot parkingSlot) {
        try {
            parkingSlotRepository.save(parkingSlot);
            logger.info("Parking slot saved: " + parkingSlot.getSlotNumber());
            return true;
        } catch (Exception e) {
            logger.warning("Error saving parking slot: " + e.getMessage());
            return false;
        }
    }

    @Override
    public List<ParkingSlot> getAllParkingSlots() {
        return parkingSlotRepository.findAll();
    }

    @Override
    public ParkingSlot getParkingSlotBySlotNumber(String slotNumber) {
        return parkingSlotRepository.findBySlotNumber(slotNumber);
    }
}
