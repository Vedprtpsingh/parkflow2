package com.ved.parkflow.services;

import com.ved.parkflow.entities.Booking;
import java.util.List;

public interface BookingService {
    List<Booking> getAllBookings();
    List<Booking> getBookingsByUserId(Long userId);
    Booking getBookingById(Long id);
    Booking saveBooking(Booking booking);
    void deleteBooking(Long id);
}
