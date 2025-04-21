package com.ved.parkflow.dto;

public class Activity {
    private String vehicleNumber;
    private String vehicleType;
    private String entryTime;
    private String slotNumber;
    private String status;
    private int id;

    public Activity(String vehicleNumber, String vehicleType, String entryTime, String slotNumber, String status, int id) {
        this.vehicleNumber = vehicleNumber;
        this.vehicleType = vehicleType;
        this.entryTime = entryTime;
        this.slotNumber = slotNumber;
        this.status = status;
        this.id = id;
    }

    public String getVehicleNumber() {
        return vehicleNumber;
    }

    public String getVehicleType() {
        return vehicleType;
    }

    public String getEntryTime() {
        return entryTime;
    }

    public String getSlotNumber() {
        return slotNumber;
    }

    public String getStatus() {
        return status;
    }

    public int getId() {
        return id;
    }
}
