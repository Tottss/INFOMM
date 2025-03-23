package com.mycompany.clinicdb;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class Diagnosis {
    public String diagnosis_id = null;
    public String appointment_id = null;
    public String diagnosis = null;
    public String treatment = null;
    
    // Returns int
    // -1 : appointment overlaps with another
    // -2 : doctor is already booked at the same time
    // 1 : it worked
    // 0 idk wtf happened
    public static int add_diagnosis(String appointment_id,
                                      String diagnosis,
                                      String treatment){
        // sql query
        String query = "INSERT INTO diagnosis (appointment_id, "
                + "diagnosis, treatment)"
                + "VALUES (?,?,?);";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // PLS DONT REMOVE
            try {
                Connection conn = DriverManager.getConnection(DBConnection.URL,
                        DBConnection.USER, DBConnection.PASSWORD);
                
                PreparedStatement ps; // note: rs doesnt exist
                
                
            
                
                // MAIN INSERT SQL QUERY
                ps = conn.prepareStatement(query);
                ps.setString(1, appointment_id);
                ps.setString(2, diagnosis);
                ps.setString(3, treatment);
                
                ps.executeUpdate();
                ps.close();
                conn.close();

                return 1;
                
            } catch (Exception e){
                e.printStackTrace();
                System.err.println("SQL Error: " + e.getMessage());
                return -1;
            }
        } catch (Exception e){
            e.printStackTrace();
        }
        return 0;
    }

    
}
