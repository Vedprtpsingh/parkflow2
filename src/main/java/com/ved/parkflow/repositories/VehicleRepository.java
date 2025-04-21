package com.ved.parkflow.repositories;
import com.ved.parkflow.entities.Vehicle;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;
public interface VehicleRepository extends JpaRepository<Vehicle, Integer> {
    List<Vehicle> findByOwnerId(int ownerId);
    Vehicle findByLicensePlate(String licensePlate);
}
