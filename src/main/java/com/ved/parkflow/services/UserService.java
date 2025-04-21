package com.ved.parkflow.services;
import com.ved.parkflow.entities.User;
public interface UserService {
    boolean registerUser(User user);
    public User loginUser(String email,String password);
    public User findByEmail(String email);
}