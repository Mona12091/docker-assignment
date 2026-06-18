package com.example.docker_assignment.controller;

import com.example.docker_assignment.entity.UserEntity;
import com.example.docker_assignment.repository.UserRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class DockerController {

    @Autowired
    private UserRepository userRepository;

    // Sample API
    @GetMapping("/test")
    public String getTest() {
        return "Hello Java application";
    }

    //Get users API with database call
    @GetMapping("/users")
    public List<UserEntity> getAllUsers() {
        return userRepository.findAll();
    }

    //Create user API with database call
    @PostMapping("/user")
    public UserEntity createUser(@RequestBody UserEntity user) {
        return userRepository.save(user);
    }
}
