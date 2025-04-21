package com.ved.parkflow.services;

import com.ved.parkflow.entities.ParkingSlot;
import java.util.List;

public interface ParkingSlotService {
    boolean addParkingSlot(ParkingSlot parkingSlot);
    List<ParkingSlot> getAllParkingSlots();
    ParkingSlot getParkingSlotBySlotNumber(String slotNumber);
}
