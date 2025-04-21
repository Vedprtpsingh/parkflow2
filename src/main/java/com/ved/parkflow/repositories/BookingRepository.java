package com.ved.parkflow.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import com.ved.parkflow.entities.Booking;
import java.util.List;

public interface BookingRepository extends JpaRepository<Booking, Long> {
    List<Booking> findByUserId(Long userId);
}
