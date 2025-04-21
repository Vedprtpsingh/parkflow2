package com.ved.parkflow.services;

import com.ved.parkflow.entities.Payment;
import java.util.List;

public interface PaymentService {
    List<Payment> getAllPayments();
    List<Payment> getPaymentsByUserId(Long userId);
    Payment getPaymentById(Long id);
    Payment savePayment(Payment payment);
    void deletePayment(Long id);
}
