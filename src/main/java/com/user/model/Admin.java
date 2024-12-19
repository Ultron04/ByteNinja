package com.user.model;

import com.user.dao.UserDAO;
import com.user.dao.ReservationDAO;
import com.user.model.User;
import com.user.model.Reservation;

import java.sql.SQLException;
import java.util.List;
import java.util.Scanner;

public class Admin {
    private UserDAO userDAO;
    private ReservationDAO reservationDAO;
    private Scanner scanner;

    public Admin() {
        this.userDAO = new UserDAO();
        this.reservationDAO = new ReservationDAO();
        this.scanner = new Scanner(System.in);
    }

    public void adminMenu() {
        while (true) {
            System.out.println("Admin Menu:");
            System.out.println("1. Add User");
            System.out.println("2. Remove User");
            System.out.println("3. Check Reserved Seats");
            System.out.println("4. Logout");
            System.out.print("Choose an option: ");
            int choice = scanner.nextInt();
            scanner.nextLine(); // Consume newline

            switch (choice) {
                case 1:
                    addUser ();
                    break;
                case 2:
                    removeUser ();
                    break;
                case 3:
                    checkReservedSeats();
                    break;
                case 4:
                    return; // Logout
                default:
                    System.out.println("Invalid choice. Please try again.");
            }
        }
    }

    private void addUser () {
        System.out.print("Enter username: ");
        String username = scanner.nextLine();
        System.out.print("Enter password: ");
        String password = scanner.nextLine();
        System.out.print("Enter name: ");
        String name = scanner.nextLine();
        try {
            User newUser  = new User(0, username, password, name); // ID will be auto-generated
            userDAO.addUser (newUser );
            System.out.println("User  added successfully.");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void removeUser () {
        System.out.print("Enter user ID to remove: ");
        int userId = scanner.nextInt();
        try {
            userDAO.removeUser (userId);
            System.out.println("User  removed successfully.");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void checkReservedSeats() {
        try {
            List<Reservation> reservations = reservationDAO.getAllReservations();
            System.out.println("Reserved Seats:");
            for (Reservation reservation : reservations) {
                System.out.println("User  ID: " + reservation.getUserId() + ", Seat Number: " + reservation.getSeatNumber() + ", Date: " + reservation.getReservationDate());
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}