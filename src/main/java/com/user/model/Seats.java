package com.user.model;

public class Seats {
	private String S_username;
	private int Seats;
	private String Date;

	public Seats() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Seats(String s_username, int seats, String date) {
		super();
		S_username = s_username;
		Seats = seats;
		Date = date;
	}

	public String getS_username() {
		return S_username;
	}

	public void setS_username(String s_username) {
		S_username = s_username;
	}

	public int getSeats() {
		return Seats;
	}

	public void setSeats(int seats) {
		Seats = seats;
	}

	public String getDate() {
		return Date;
	}

	public void setDate(String date) {
		Date = date;
	}

	@Override
	public String toString() {
		return "Seats [S_username=" + S_username + ", Seats=" + Seats + ", Date=" + Date + "]";
	}

}
