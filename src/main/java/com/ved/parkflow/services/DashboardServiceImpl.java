package com.ved.parkflow.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.ArrayList;

import com.ved.parkflow.dto.Activity;
import com.ved.parkflow.repositories.VehicleRepository;
import com.ved.parkflow.repositories.UserRepository;
import com.ved.parkflow.entities.Vehicle;

@Service
public class DashboardServiceImpl implements DashboardService {

    @Autowired
    private VehicleRepository vehicleRepository;

    @Autowired
    private UserRepository userRepository;

    @Override
    public int getTotalSpaces() {
        // TODO: Replace with real data from parking slots repository when available
        return 100; // Example static value
    }

    @Override
    public int getOccupiedSpaces() {
        // Count vehicles currently parked (assuming all vehicles in repo are parked)
        List<Vehicle> vehicles = vehicleRepository.findAll();
        return vehicles.size();
    }

    @Override
    public int getAvailableSpaces() {
        return getTotalSpaces() - getOccupiedSpaces();
    }

    @Override
    public double getTodayRevenue() {
        // TODO: Implement real revenue calculation from payments repository
        return 0.0;
    }

    @Override
    public List<Activity> getRecentActivities() {
        List<Activity> recentActivities = new ArrayList<>();
        List<Vehicle> vehicles = vehicleRepository.findAll();
        int count = 0;
        for (Vehicle v : vehicles) {
            if (count >= 5) break;
            String vehicleNumber = v.getLicensePlate();
            String vehicleType = v.getModel(); // Assuming model as type
            String entryTime = v.getParkedAt() != null ? v.getParkedAt().toString() : "N/A";
            String slotNumber = "Unknown"; // TODO: Fetch real slot number when available
            String status = "PARKED"; // Simplified status
            int id = v.getId();
            recentActivities.add(new Activity(vehicleNumber, vehicleType, entryTime, slotNumber, status, id));
            count++;
        }
        return recentActivities;
    }

    @Override
    public List<Object> getParkingSlots() {
        // TODO: Implement fetching parking slots from repository
        return new ArrayList<>();
    }

    @Override
    public List<String> getNotifications(String userFirstName) {
        List<String> notifications = new ArrayList<>();
        notifications.add("Welcome " + (userFirstName != null ? userFirstName : "User") + "!");
        notifications.add("System running smoothly.");
        return notifications;
    }

    @Override
    public Object getBusinessReports() {
        // TODO: Implement real business reports fetching logic
        // For now, return a placeholder object
        return new Object();
    }
}
