package com.user.dao;

import java.sql.*;

public class Connections {
	private static final String URL = "jdbc:mysql://localhost:3306/seat_reservation";
    private static final String USER = "root";
    private static final String PASSWORD = "Anand@2004#";
    
    // write here SQL Query in String
    public Connection getConnection() {
    	Connection connection = null;
    	try {
    		Class.forName("com.mysql.cj.jdbc.Driver");
    		connection = DriverManager.getConnection(URL, USER, PASSWORD);
    	}
    	catch(SQLException e){e.printStackTrace();}
    	catch(ClassNotFoundException e) {e.printStackTrace();}
    	catch(Exception e){e.printStackTrace();}
    	return connection;
    }
    public static void main(String[] args) {
    	Connections in = new Connections();
    	if (in.getConnection()!=null) {
    		System.out.println("Connected to database !!!");
    	}
    	else {
    		System.out.println("Problem in database Connection ??");
    	}
    }
}
