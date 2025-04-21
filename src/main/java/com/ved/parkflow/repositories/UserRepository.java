package com.ved.parkflow.repositories;
import com.ved.parkflow.entities.User;
import org.springframework.data.jpa.repository.JpaRepository;
public interface UserRepository extends JpaRepository<User, Integer> {
    User findByEmail(String email);
}