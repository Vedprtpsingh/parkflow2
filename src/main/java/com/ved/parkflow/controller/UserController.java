package com.ved.parkflow.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.beans.factory.annotation.Autowired;
import com.ved.parkflow.services.UserService;
import com.ved.parkflow.entities.User;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/parkflow")
public class UserController {

    @Autowired
    private UserService userService;

    @GetMapping("/login")
    public String showLoginPage() {
        return "login";
    }

    @GetMapping("/signup")
    public String showSignupPage() {
        return "signup";
    }

    @GetMapping("/businessSignup")
    public String showBusinessSignupPage() {
        return "businessSignup";
    }

    @PostMapping("/businessSignupForm")
    public String handleBusinessSignup(User user, Model model) {
        boolean registered = userService.registerUser(user);
        if (registered) {
            // Redirect to business login page after successful signup
            return "redirect:/parkflow/businessLogin";
        } else {
            model.addAttribute("error", "Registration failed. Please try again.");
            return "businessSignup";
        }
    }

    @PostMapping("/signupForm")
    public String handleSignup(User user, Model model) {
        boolean registered = userService.registerUser(user);
        if (registered) {
            // Redirect to login page after successful signup
            return "redirect:/parkflow/login";
        } else {
            model.addAttribute("error", "Registration failed. Please try again.");
            return "signup";
        }
    }

    @PostMapping("/customerLoginForm")
    public String handleCustomerLogin(@RequestParam String email, @RequestParam String password, Model model, HttpSession session) {
        User user = userService.loginUser(email, password);
        if (user != null) {
            // Set session attributes for logged-in user
            session.setAttribute("loggedInUser", user);
            session.setAttribute("modelFirstName", user.getFirstName());
            model.addAttribute("success", "Login successful!");
            // Authentication successful, redirect to customer dashboard
            return "redirect:/parkflow/customerDashboard";
        } else {
            // Authentication failed, show error on login page
            model.addAttribute("error", "Invalid email or password");
            return "login";
        }
    }

    @PostMapping("/businessLoginForm")
    public String handleBusinessLogin(@RequestParam String email, @RequestParam String password, Model model, HttpSession session) {
        // TODO: Implement business user login logic, for now reuse customer login
        User user = userService.loginUser(email, password);
        if (user != null) {
            session.setAttribute("loggedInUser", user);
            session.setAttribute("modelFirstName", user.getFirstName());
            model.addAttribute("success", "Login successful!");
            return "redirect:/parkflow/businessDashboard";
        } else {
            model.addAttribute("error", "Invalid email or password");
            return "businessLogin";
        }
    }

    @GetMapping("/logout")
    public String handleLogout(HttpSession session) {
        session.invalidate();
        return "redirect:/parkflow/home?logout=true";
    }
}
