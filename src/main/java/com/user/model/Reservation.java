package com.user.model;

import java.sql.Date;

public class Reservation {
    private int id;
    private int userId;
    private int seatNumber;
    private Date reservationDate;

    public Reservation(int id, int userId, int seatNumber, Date reservationDate) {
        this.id = id;
        this.userId = userId;
        this.seatNumber = seatNumber;
        this.reservationDate = reservationDate;
    }

    // Getters
    public int getId() {
        return id;
    }

    public int getUserId() {
        return userId;
    }

    public int getSeatNumber() {
        return seatNumber;
    }

    public Date getReservationDate() {
        return reservationDate;
    }
}