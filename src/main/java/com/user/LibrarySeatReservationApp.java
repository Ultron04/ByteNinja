package com.user;

import com.user.dao.UserDAO;
import com.user.dao.ReservationDAO;
import com.user.model.User;
import com.user.model.Reservation;

import java.sql.Date;
import java.sql.SQLException;
import java.util.List;
import java.util.Scanner;

public class LibrarySeatReservationApp {
    private static Scanner scanner = new Scanner(System.in);

    public static void main(String[] args) {
        while (true) {
            System.out.println("Welcome to the Library Seat Reservation System");
            System.out.println("1. Login as Admin");
            System.out.println("2. Login as User");
            System.out.println("3. Exit");
            System.out.print("Choose an option: ");
            int choice = scanner.nextInt();
            scanner.nextLine(); // Consume newline

            switch (choice) {
                case 1:
                    adminMenu();
                    break;
                case 2:
                    userMenu();
                    break;
                case 3:
                    System.out.println("Exiting...");
                    return;
                default:
                    System.out.println("Invalid choice. Please try again.");
            }
        }
    }

    private static void adminMenu() {
        UserDAO userDAO = new UserDAO();
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
                    break;
                case 2:
                    System.out.print("Enter user ID to remove: ");
                    int userId = scanner.nextInt();
                    try {
                        userDAO.removeUser (userId);
                        System.out.println("User  removed successfully.");
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                    break;
                case 3:
                    try {
                        List<Reservation> reservations = new ReservationDAO().getAllReservations();
                        System.out.println("Reserved Seats:");
                        for (Reservation reservation : reservations) {
                            System.out.println("User  ID: " + reservation.getUserId() + ", Seat Number: " + reservation.getSeatNumber() + ", Date: " + reservation.getReservationDate());
                        }
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                    break;
                case 4:
                    return; // Logout
                default:
                    System.out.println("Invalid choice. Please try again.");
            }
        }
    }

    private static void userMenu() {
        ReservationDAO reservationDAO = new ReservationDAO();
        System.out.print("Enter your user ID: ");
        int userId = scanner.nextInt();
        scanner.nextLine(); // Consume newline

        while (true) {
            System.out.println("User  Menu:");
            System.out.println("1. Reserve Seat");
            System.out.println("2. View My Reservations");
            System.out.println("3. Logout");
            System.out.print("Choose an option: ");
            int choice = scanner.nextInt();
            scanner.nextLine(); // Consume newline

            switch (choice) {
                case 1:
                    System.out.print("Enter seat number: ");
                    int seatNumber = scanner.nextInt();
                    System.out.print("Enter reservation date (YYYY-MM-DD): ");
                    String dateString = scanner.next();
                    try {
                        Date reservationDate = Date.valueOf(dateString);
                        Reservation reservation = new Reservation(0, userId, seatNumber, reservationDate); // ID will be auto-generated
                        reservationDAO.saveReservation(reservation);
                        System.out.println("Seat reserved successfully.");
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                    break;
                case 2:
                    try {
                        List<Reservation> userReservations = reservationDAO.getReservationsByUserId(userId);
                        System.out.println("Your Reservations:");
                        for (Reservation reservation : userReservations) {
                            System.out.println("Seat Number: " + reservation.getSeatNumber() + ", Date: " + reservation.getReservationDate());
                        }
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                    break;
                case 3:
                    return; // Logout
                default:
                    System.out.println("Invalid choice. Please try again.");
            }
        }
    }
}