package com.mycompany.clinicdb;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class Doctor {
    public String npi = null;
    public String last_name = null;
    public String First_name = null;
    public String middle_name = null;
    public String sex = null;
    public String birth_date = null;
    public String medical_certification = null;
    public String years_of_service = null;
    public String specialization = null;
    
    // Returns int
    // -1 : appointment overlaps with another
    // -2 : doctor is already booked at the same time
    // 1 : it worked
    // 0 idk wtf happened
    public static int add_doctor(String last_name, String First_name,
                                      String middle_name,
                                      String sex, String birthday,
                                      String medical_certification, String years_of_service,
                                      String specialization){
        // sql query
        String query = "INSERT INTO doctors (last_name, First_name, "
                + "middle_name, sex, birth_date, medical_certification, "
                + "years_of_service, specialization) "
                + "VALUES (?,?,?,?,?,?,?,?);";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // PLS DONT REMOVE
            try {
                Connection conn = DriverManager.getConnection(DBConnection.URL,
                        DBConnection.USER, DBConnection.PASSWORD);
                
                PreparedStatement ps; // note: rs doesnt exist
                
                //Parse html date and time inputs
                String birth_date = birthday;
                
            
                
                // MAIN INSERT SQL QUERY
                ps = conn.prepareStatement(query);
                ps.setString(1, last_name);
                ps.setString(2, First_name);
                ps.setString(3, middle_name);
                ps.setString(4, sex);
                ps.setString(5, birth_date);
                ps.setString(6, medical_certification);
                ps.setString(7, years_of_service);
                ps.setString(8, specialization); // hardcoded default
                
                ps.executeUpdate();
                return 1;
                
            } catch (Exception e){
                e.printStackTrace();
                return 0;
            }
        } catch (Exception e){
            e.printStackTrace();
        }
        return 0;
    }
    
}
