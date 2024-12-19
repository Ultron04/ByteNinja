package com.user.model;

import javax.persistence.*;
import java.sql.Date;

@Entity
@Table(name = "reservations")
public class Reservation {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private int userId;
    private int seatNumber;
    private Date reservationDate;

    // Constructors, getters, and setters
    public Reservation() {}

    public Reservation(int userId, int seatNumber, Date reservationDate) {
        this.userId = userId;
        this.seatNumber = seatNumber;
        this.reservationDate = reservationDate;
    }

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public int getUser Id() { return userId; }
    public void setUser Id(int userId) { this.userId = userId; }
    public int getSeatNumber() { return seatNumber; }
    public void setSeatNumber(int seatNumber) { this.seatNumber = seatNumber; }
    public Date getReservationDate() { return reservationDate; }
    public void setReservationDate(Date reservationDate) { this.reservationDate = reservationDate; }
}