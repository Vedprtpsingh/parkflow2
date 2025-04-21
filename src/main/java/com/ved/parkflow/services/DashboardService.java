package com.ved.parkflow.services;

import java.util.List;
import com.ved.parkflow.dto.Activity;

public interface DashboardService {
    int getTotalSpaces();
    int getOccupiedSpaces();
    int getAvailableSpaces();
    double getTodayRevenue();
    List<Activity> getRecentActivities();
    List<Object> getParkingSlots();
    List<String> getNotifications(String userFirstName);

    // New method to get business reports data
    Object getBusinessReports();
}
