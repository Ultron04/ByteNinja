package com.user.service;

import com.user.model.Reservation;
import com.user.repository.ReservationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReservationService {
    @Autowired
    private ReservationRepository reservationRepository;

    public Reservation saveReservation(Reservation reservation) {
        return reservationRepository.save(reservation);
    }

    public void cancelReservation(int id) {
        reservationRepository.deleteById(id);
    }

    public List<Reservation> getReservationsByUser Id(int userId) {
        return reservationRepository.findByUser Id(userId);
    }
}