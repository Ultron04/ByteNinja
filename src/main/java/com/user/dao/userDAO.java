package com.user.dao;

import java.sql.*;
import java.util.*;

import com.user.model.*;

public class userDAO {

	private String jdbcURL = "jdbc:mysql://localhost:3306/seat_reservation";
	private String jdbcUserName = "root";
	private String jdbcpassword = "Anand@2004#";

	private static final String INSERT_USER_SQL = "INSERT INTO users " + "(S_username,password,name) VALUES "+ "(?,?,?);";
	private static final String DELETE_USER_SQL = "DELETE FROM users where S_username=?;";
	private static final String ADMIN_APPROVE = "SELECT * FROM admin WHERE A_username = ? AND password = ?;";
	private static final String USER_APPROVE = "SELECT * FROM users WHERE S_username = ? AND password = ?;";
	private static final String SELECT_ALL_USER = "SELECT * FROM users;";
	private static final String SELECT_ALL_RESERVATION = "SELECT * FROM reservations;";
	private static final String ALLOT_SEAT = "INSERT INTO reservations "+ "(S_username,seat_number,reservation_date) VALUES " + "(?,?,?);";
	private static final String UPDATE_USER_PASS = "UPDATE users SET password = ? WHERE S_username = ?;";
	private static final String DELETE_RESERVATION = "DELETE FROM reservations Where S_username = ? ;";
	private static final String GET_USER_NAME = "Select name FROM users Where S_username= ? ;";
	private static final String CHECK_USER_SQL = "Select * FROM users where S_username=?;";
	private static final String CHECK_USER_RESERVATION_SQL = "Select * FROM reservations where S_username=?;";
	private static final String SLOT_AVAILABLE = "Select * from reservations where seat_number = ? and reservation_date = ?;";
	private static final String SELECT_USER_RESERVATION = "SELECT * FROM reservations where S_username = ? order by reservation_date;";
	
	public userDAO() {

	}

	public Connection getConnection() {
		Connection connection = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection(jdbcURL, jdbcUserName, jdbcpassword);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return connection;

	}
	
	public boolean checkSlot(int seat ,String date ) {
		boolean status = true;
	    userDAO dao = new userDAO();
	    // Ensure your query matches your table schema

	    try (Connection connection = dao.getConnection();
	         PreparedStatement preparedStatement = connection.prepareStatement(SLOT_AVAILABLE)) {

	        preparedStatement.setInt(1, seat);
	        preparedStatement.setString(2, date);
	        try (ResultSet resultSet = preparedStatement.executeQuery()) {
	            // Check if the result set has at least one row
	            if (resultSet.next()) {
	                status = false;
	            }
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return status;

	}

	// INSERTING USER
	public void insertuser(User user) {
		userDAO dao = new userDAO();

		try (Connection connection = dao.getConnection()) {
			PreparedStatement preparedstatement = connection.prepareStatement(INSERT_USER_SQL);
			preparedstatement.setString(1, user.getUsername());
			preparedstatement.setString(2, user.getPassword());
			preparedstatement.setString(3, user.getName());

			preparedstatement.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// method to selectall USER
	public List<User> selectAllUsers() {
		List<User> users = new ArrayList<User>();
		userDAO dao = new userDAO();
		try (Connection connection = dao.getConnection()) {
			PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USER);
			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				String UserName = resultSet.getString("S_username");
				String paswd = resultSet.getString("password");
				String Name = resultSet.getString("name");
				

				users.add(new User(UserName, paswd, Name));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return users;

	}
	
	public List<Seats> selectUserReservation(String id) {
		List<Seats> seats = new ArrayList<Seats>();
		userDAO dao = new userDAO();
		try (Connection connection = dao.getConnection()) {
			PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_RESERVATION);
			preparedStatement.setString(1, id);
			ResultSet resultSet = preparedStatement.executeQuery();
			
			while (resultSet.next()) {
				String UserName = resultSet.getString("S_username");
				int s_no = resultSet.getInt("seat_number");
				String paswd = resultSet.getString("reservation_date");

				seats.add(new Seats(UserName, s_no, paswd));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return seats;

	}

	// method to delete user.
	public boolean deleteUser(String Id) {
		boolean status = false;
		userDAO dao = new userDAO();
		try (Connection connection = dao.getConnection()) {
			PreparedStatement preparedStatement = connection.prepareStatement(DELETE_USER_SQL);
			preparedStatement.setString(1, Id);

			status = preparedStatement.execute();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return status;

	}

	public boolean checkUser(String Id) {
		boolean status = false;
	    userDAO dao = new userDAO();
	    // Ensure your query matches your table schema

	    try (Connection connection = dao.getConnection();
	         PreparedStatement preparedStatement = connection.prepareStatement(CHECK_USER_SQL)) {

	        preparedStatement.setString(1, Id);
	        try (ResultSet resultSet = preparedStatement.executeQuery()) {
	            // Check if the result set has at least one row
	            if (resultSet.next()) {
	                status = true;
	            }
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return status;

	}
	public boolean checkUserinReservation(String Id) {
		boolean status = false;
	    userDAO dao = new userDAO();
	    // Ensure your query matches your table schema

	    try (Connection connection = dao.getConnection();
	         PreparedStatement preparedStatement = connection.prepareStatement(CHECK_USER_RESERVATION_SQL)) {

	        preparedStatement.setString(1, Id);
	        try (ResultSet resultSet = preparedStatement.executeQuery()) {
	            // Check if the result set has at least one row
	            if (resultSet.next()) {
	                status = true;
	            }
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return status;

	}
	
	// method to validate admin .
	public boolean validateAdmin(String username, String password) {
		boolean status = false;
		userDAO dao = new userDAO();
		try (Connection connection = dao.getConnection()) {
			PreparedStatement preparedStatement = connection.prepareStatement(ADMIN_APPROVE);
			preparedStatement.setString(1, username);
			preparedStatement.setString(2, password);
			ResultSet resultSet = preparedStatement.executeQuery();
			if (resultSet.next()) {
				status = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return status;
	}

	// method to validate user
	public boolean validateUser(String username, String password) {
		boolean status = false;
		userDAO dao = new userDAO();
		try (Connection connection = dao.getConnection()) {
			PreparedStatement preparedStatement = connection.prepareStatement(USER_APPROVE);
			preparedStatement.setString(1, username);
			preparedStatement.setString(2, password);
			ResultSet resultSet = preparedStatement.executeQuery();
			if (resultSet.next()) {
				status = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return status;
	}

	// method to check reservation
	public List<Seats> selectAllReservation() {
		List<Seats> seats = new ArrayList<Seats>();
		userDAO dao = new userDAO();
		try (Connection connection = dao.getConnection()) {
			PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_RESERVATION);
			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				String UserName = resultSet.getString("S_username");
				int s_no = resultSet.getInt("seat_number");
				String paswd = resultSet.getString("reservation_date");

				seats.add(new Seats(UserName, s_no, paswd));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return seats;

	}
	
	public String getUserName(String username) {
        String userName = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(GET_USER_NAME)) {
            preparedStatement.setString(1, username);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                userName = resultSet.getString("name");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userName;
    }

	// method to allot seat
	public void allotseat(Seats seat1) {
		userDAO dao = new userDAO();

		try (Connection connection = dao.getConnection()) {
			PreparedStatement preparedstatement = connection.prepareStatement(ALLOT_SEAT);
			preparedstatement.setString(1, seat1.getS_username());
			preparedstatement.setInt(2, seat1.getSeats());
			preparedstatement.setString(3, seat1.getDate());

			preparedstatement.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// update userpassword
	public boolean updatepassword(String Username , String Password) {
		boolean status = false;
		userDAO dao = new userDAO();
		try (Connection connection = dao.getConnection()) {
			PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_USER_PASS);
			preparedStatement.setString(1, Password);
			preparedStatement.setString(2, Username);

			preparedStatement.executeUpdate();

			status = preparedStatement.executeUpdate() > 0;

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return status;

	}

	public boolean deleteSeats(String Id) {
		boolean status = false;
		userDAO dao = new userDAO();
		try (Connection connection = dao.getConnection()) {
			PreparedStatement preparedStatement = connection.prepareStatement(DELETE_RESERVATION);
			preparedStatement.setString(1, Id);

			status = preparedStatement.execute();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return status;

	}
	public static void main(String[] args) {
         userDAO dao=new userDAO();
		
		if(dao.getConnection()!=null) {
			System.out.println("Successfully connected to the database");
		}else {
			System.out.println("problem in database connection");
		}
	}

}