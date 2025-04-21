package com.ved.parkflow.controller;

import com.ved.parkflow.services.BookingService;
import com.ved.parkflow.services.PaymentService;
import com.ved.parkflow.services.VehicleService;
import com.ved.parkflow.services.ParkingSlotService;
import com.ved.parkflow.entities.Vehicle;
import com.ved.parkflow.entities.ParkingSlot;
import com.ved.parkflow.entities.User;
import com.ved.parkflow.entities.Booking;
import com.ved.parkflow.entities.Payment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpSession;

import java.time.LocalDateTime;
import java.util.List;
import java.util.logging.Logger;

@Controller
@RequestMapping("/parkflow")
public class VehicleController {

    @Autowired
    private VehicleService vehicleService;

    @Autowired
    private ParkingSlotService parkingSlotService;

    @Autowired
    private BookingService bookingService;

    @Autowired
    private PaymentService paymentService;

    private static final Logger logger = Logger.getLogger(VehicleController.class.getName());

    @GetMapping("/viewParkedVehicles")
    public String showViewParkedVehiclesPage(HttpSession session, Model model) {
        User user = (User) session.getAttribute("loggedInUser");
        if (user != null) {
            List<Vehicle> vehicles = vehicleService.getVehiclesByOwnerId(user.getId());
            model.addAttribute("vehicles", vehicles);
            return "viewParkedVehicles";
        }
        return "redirect:/login";
    }

    @GetMapping("/parkVehicle")
    public String showParkVehiclePage(Model model) {
        model.addAttribute("vehicle", new Vehicle());
        model.addAttribute("availableSlots", parkingSlotService.getAllParkingSlots().stream().filter(ParkingSlot::isAvailable).toList());
        return "parkVehicle";
    }
/***
    @PostMapping("/parkVehicle")
    public String parkVehicle(@ModelAttribute("vehicle") Vehicle vehicle, Integer slotId, HttpSession session, Model model) {
        User user = (User) session.getAttribute("loggedInUser");
        if (user != null) {
            if (isValidVehicle(vehicle)) {
                vehicle.setOwner(user);
                vehicle.setParkedAt(LocalDateTime.now());
                // TODO: Handle slotId association with vehicle if applicable
                boolean status = vehicleService.addVehicle(vehicle);
                if (status) {
                    logger.info("Vehicle parked: " + vehicle.getLicensePlate() + " by user " + user.getEmail());
                    // Redirect to payment page after successful parking
                    return "redirect:/parkflow/payment";
                } else {
                    model.addAttribute("error", "Failed to park vehicle.");
                    logger.warning("Failed to park vehicle: " + vehicle.getLicensePlate());
                }
            } else {
                model.addAttribute("error", "Invalid vehicle data. Please check the inputs.");
                logger.warning("Invalid vehicle data submitted.");
            }
            return "parkVehicle";
        }
        return "redirect:/login";
    }
**/
    @GetMapping("/addVehicle")
    public String showAddVehiclePage(Model model) {
        model.addAttribute("vehicle", new Vehicle());
        return "addVehicle";
    }

    @PostMapping("/addVehicle")
    public String addVehicle(@ModelAttribute("vehicle") Vehicle vehicle, HttpSession session, Model model) {
        User user = (User) session.getAttribute("loggedInUser");
        if (user != null) {
            if (isValidVehicle(vehicle)) {
                vehicle.setOwner(user);
                boolean status = vehicleService.addVehicle(vehicle);
                if (status) {
                    model.addAttribute("success", "Vehicle added successfully.");
                    logger.info("Vehicle added: " + vehicle.getLicensePlate() + " by user " + user.getEmail());
                } else {
                    model.addAttribute("error", "Failed to add vehicle.");
                    logger.warning("Failed to add vehicle: " + vehicle.getLicensePlate());
                }
            } else {
                model.addAttribute("error", "Invalid vehicle data. Please check the inputs.");
                logger.warning("Invalid vehicle data submitted.");
            }
            return "addVehicle";
        }
        return "redirect:/login";
    }

    @GetMapping("/addParkingSlot")
    public String showAddParkingSlotPage(Model model) {
        model.addAttribute("parkingSlot", new ParkingSlot());
        return "addParkingSlot";
    }

    @PostMapping("/addParkingSlot")
    public String addParkingSlot(@ModelAttribute("parkingSlot") ParkingSlot parkingSlot, Model model) {
        if (parkingSlot.getSlotNumber() == null || parkingSlot.getSlotNumber().trim().isEmpty()) {
            model.addAttribute("error", "Slot number is required.");
            return "addParkingSlot";
        }
        if (parkingSlot.getLatitude() == null || parkingSlot.getLongitude() == null) {
            model.addAttribute("error", "Latitude and Longitude are required.");
            return "addParkingSlot";
        }
        parkingSlot.setAvailable(true);
        boolean status = parkingSlotService.addParkingSlot(parkingSlot);
        if (status) {
            model.addAttribute("success", "Parking slot added successfully.");
            logger.info("Parking slot added: " + parkingSlot.getSlotNumber());
        } else {
            model.addAttribute("error", "Failed to add parking slot.");
            logger.warning("Failed to add parking slot: " + parkingSlot.getSlotNumber());
        }
        return "addParkingSlot";
    }

    @GetMapping("/viewBookings")
    public String showViewBookingsPage(Model model) {
        List<Booking> bookings = bookingService.getAllBookings();
        model.addAttribute("bookings", bookings);
        return "viewBookings";
    }

    @GetMapping("/managePayments")
    public String showManagePaymentsPage(Model model) {
        List<Payment> payments = paymentService.getAllPayments();
        model.addAttribute("payments", payments);
        return "managePayments";
    }

    @GetMapping("/allActivities")
    public String showAllActivitiesPage() {
        return "allActivities";
    }

    @GetMapping("/exitVehicle")
    public String showExitVehiclePage() {
        return "exitVehicle";
    }

    @GetMapping("/payment")
    public String showPaymentPage() {
        return "payment";
    }
    @GetMapping("/processPayment")
    public String processPayment() {
        return "paymentSuccessful";
    }

    private boolean isValidVehicle(Vehicle vehicle) {
        if (vehicle == null) return false;
        if (vehicle.getLicensePlate() == null || vehicle.getLicensePlate().trim().isEmpty()) return false;
        if (vehicle.getModel() == null || vehicle.getModel().trim().isEmpty()) return false;
        // Additional validation rules can be added here
        return true;
    }
}
