package com.user.Controller;


import com.user.model.User;
import com.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/users")
public class UserController {
    @Autowired
    private UserService userService;

    @PostMapping("/add")
    public User addUser (@RequestBody User user) {
        return userService.saveUser (user);
    }

    @DeleteMapping("/remove/{id}")
    public void removeUser (@PathVariable int id) {
        userService.deleteUser (id);
    }

    @GetMapping("/all")
    public List<User> getAllUsers() {
        return userService.getAllUsers();
    }

    @GetMapping("/{username}")
    public User getUser ByUsername(@PathVariable String username) {
        return userService.findByUsername(username);
    }
}