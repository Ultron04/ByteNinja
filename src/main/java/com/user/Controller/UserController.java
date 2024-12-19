package com.user.Controller;

import com.user.model.Reservation;
import com.user.service.ReservationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/reservations")
public class ReservationController {
    @Autowired
    private ReservationService reservationService;

    @PostMapping("/reserve")
    public Reservation reserveSeat(@RequestBody Reservation reservation) {
        return reservationService.saveReservation(reservation);
    }

    @DeleteMapping("/cancel/{id}")
    public void cancelReservation(@PathVariable int id) {
        reservationService.cancelReservation(id);
    }

    @GetMapping("/user/{userId}")
    public List<Reservation> getReservationsByUser Id(@PathVariable int userId) {
        return reservationService.getReservationsByUser  Id(userId);
    }
}