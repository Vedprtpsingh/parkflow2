package com.ved.parkflow.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

    @RequestMapping({ "/", "/home", "/parkflow" })
    public String home() {
        return "home";
    }

    @GetMapping("/services")
    public String showServicesPage() {
        return "services";
    }

    @GetMapping("/contact")
    public String showContactPage() {
        return "contact";
    }

    @GetMapping("/about")
    public String showAboutPage() {
        return "about";
    }

    @GetMapping("/map")
    public String showMapPage() {
        return "map";
    }
}
