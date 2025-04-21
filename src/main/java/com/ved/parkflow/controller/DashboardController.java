package com.ved.parkflow.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpSession;

import com.ved.parkflow.services.DashboardService;
import com.ved.parkflow.dto.Activity;
import java.util.List;

@Controller
@RequestMapping("/parkflow")
public class DashboardController {

    @Autowired
    private DashboardService dashboardService;

    @GetMapping("/businessDashboard")
    public String showBusinessDashboard(Model model, HttpSession session) {
        Object loggedInUser = session.getAttribute("loggedInUser");
        if (loggedInUser == null) {
            return "redirect:/parkflow/login";
        }
        model.addAttribute("totalSpaces", dashboardService.getTotalSpaces());
        model.addAttribute("occupiedSpaces", dashboardService.getOccupiedSpaces());
        model.addAttribute("availableSpaces", dashboardService.getAvailableSpaces());
        model.addAttribute("todayRevenue", dashboardService.getTodayRevenue());
        List<Activity> recentActivities = dashboardService.getRecentActivities();
        model.addAttribute("recentActivities", recentActivities);
        model.addAttribute("parkingSlots", dashboardService.getParkingSlots());
        return "businessDashboard";
    }

    @GetMapping("/customerDashboard")
    public String showCustomerDashboard(Model model, HttpSession session) {
        Object loggedInUser = session.getAttribute("loggedInUser");
        if (loggedInUser == null) {
            return "redirect:/parkflow/login";
        }
        String firstName = (String) session.getAttribute("modelFirstName");
        model.addAttribute("modelFirstName", firstName != null ? firstName : "User");
        List<Activity> recentActivities = dashboardService.getRecentActivities();
        model.addAttribute("recentActivities", recentActivities);
        model.addAttribute("notifications", dashboardService.getNotifications(firstName));
        return "customerDashboard";
    }

    @GetMapping("/businessReports")
    public String showBusinessReportsPage(Model model) {
        Object businessReports = dashboardService.getBusinessReports();
        model.addAttribute("businessReports", businessReports);
        return "businessReports";
    }

    @GetMapping("/map")
    public String showMapPage() {
        return "map";
    }

    @GetMapping("/about")
    public String showAboutPage() {
        return "about";
    }

    @GetMapping("/services")
    public String showServicesPage() {
        return "services";
    }

    @GetMapping("/contact")
    public String showContactPage() {
        return "contact";
    }

    @GetMapping("/home")
    public String showHomePage() {
        return "home";
    }

    @GetMapping("/businessLogin")
    public String showBusinessLoginPage() {
        return "businessLogin";
    }

    @GetMapping("/forgotpassword")
    public String showForgotPasswordPage() {
        return "forgotPassword";
    }

    @GetMapping("/features")
    public String showFeaturesPage() {
        return "features";
    }

    @GetMapping("/parkingMap")
    public String showParkingMap(){
        return "parkingMap";
    }
}
