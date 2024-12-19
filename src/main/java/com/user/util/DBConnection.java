package com.user.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;
import java.io.FileInputStream;
import java.io.IOException;

public class DBConnection {
    private static Connection connection;

    public static Connection getConnection() {
        if (connection == null) {
            try {
                Properties properties = new Properties();
                FileInputStream fis = new FileInputStream("src/main/resources/config/db_config.properties");
                properties.load(fis);
                
                // Use the correct keys to retrieve properties
                String jdbcURL = properties.getProperty("jdbc.url");
                String jdbcUsername = properties.getProperty("jdbc.username");
                String jdbcPassword = properties.getProperty("jdbc.password");

                connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
            } catch (SQLException | IOException e) {
                e.printStackTrace();
            }
        }
        return connection;
    }
}