package com.mycompany.clinicdb;

import java.sql.*;

public class ViewAppointment {
    public String appointmentId;
    public String patientName;

    // Database credentials
    private static final String URL = "jdbc:mysql://localhost:3306/clinic?allowPublicKeyRetrieval=true&useSSL=false&serverTimezone=UTC";
    private static final String USER = "root";
    private static final String PASSWORD = "Schummi22?";

    public void getAppointmentDetails(String appointmentId) {
        String query = "SELECT appointment_id, patient_name FROM vw_appointmentdetails WHERE appointment_id = ? LIMIT 2";

        try {
            // Ensure MySQL JDBC Driver is loaded (not always required for newer versions, but safe)
            Class.forName("com.mysql.cj.jdbc.Driver");

            try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
                 PreparedStatement stmt = conn.prepareStatement(query)) {

                stmt.setString(1, appointmentId);
                ResultSet rs = stmt.executeQuery();

                if (rs.next()) { // Ensure a result exists before accessing it
                    this.patientName = rs.getString("patient_name");
                } else {
                    this.patientName = "No appointment found";
                }

            }
        } catch (ClassNotFoundException e) {
            System.err.println("MySQL JDBC Driver not found!");
            e.printStackTrace();
            this.patientName = "Error: JDBC Driver not found";
            
        } catch (SQLException e) {
            System.err.println("Database connection error!");
            e.printStackTrace();
            this.patientName = "Error retrieving data";
        }
    }
}
