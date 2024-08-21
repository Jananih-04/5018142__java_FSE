package com.example.bookstore.controller;

public class CustomerController {
    
}


import com.example.bookstore.entity.Customer;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/customers")
public class CustomerController {

    private List<Customer> customers = new ArrayList<>();

    // POST /customers - JSON request body
    @PostMapping
    public Customer createCustomer(@RequestBody Customer customer) {
        customers.add(customer);
        return customer;
    }

    // POST /customers/register - Form data
    @PostMapping("/register")
    public Customer registerCustomer(@ModelAttribute Customer customer) {
        customers.add(customer);
        return customer;
    }
}
