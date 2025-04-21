package com.ved.parkflow.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import com.ved.parkflow.entities.Payment;
import java.util.List;

public interface PaymentRepository extends JpaRepository<Payment, Long> {
    List<Payment> findByUserId(Long userId);
}
