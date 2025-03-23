package com.mycompany.clinicdb;

import java.sql.*;

public class Appointments {
    public String appointment_id = null;
    public String mrn = null;
    public String npi = null;
    public String lab_report_id = null;
    public String purpose = null;
    public String start_datetime = null;
    public String end_datetime = null;
    public double total_fees = 0;
    public String payment_status = null;
    
    // Returns int
    // -1 : appointment overlaps with another
    // -2 : doctor is already booked at the same time
    // 1 : it worked
    // 0 idk wtf happened
    public static int add_appointment(String mrn, String npi,
                                      String lab_report_id,
                                      String purpose, String date,
                                      String start_time, String end_time,
                                      String appointment_fee){
        // sql query
        String query = "INSERT INTO appointments (mrn, npi, "
                + "lab_report_id, purpose, start_datetime, end_datetime, "
                + "total_fees, payment_status) "
                + "VALUES (?,?,?,?,?,?,?,?);";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // PLS DONT REMOVE
            try {
                Connection conn = DriverManager.getConnection(DBConnection.URL,
                        DBConnection.USER, DBConnection.PASSWORD);
                
                // due to a severe lack of refactoring, there is no ps2
                PreparedStatement ps, ps3, ps4;
                ResultSet rs3, rs4; // note: rs and rs2 doesnt exist
               
                //Parse html date and time inputs
                String start_datetime = date+" "+start_time;
                String end_datetime = date+" "+end_time;
                
                // Check if appointment overlaps with another
                ps4 = conn.prepareStatement("SELECT a.appointment_id "
                        + "FROM appointments a "
                        + "WHERE a.start_datetime < ? AND a.end_datetime > ? ");
                ps4.setString(1,start_datetime);
                ps4.setString(2,end_datetime);
                rs4 = ps4.executeQuery();
                
                if (rs4.next()){ return -1; }
                
                // Check if doctor is booked
                ps3 = conn.prepareStatement("SELECT d.npi FROM doctors d "
                        + "JOIN appointments a ON d.npi=a.npi "
                        + "WHERE a.start_datetime < ? AND a.end_datetime > ? ");
                ps3.setString(1,start_datetime);
                ps3.setString(2,end_datetime);
                rs3 = ps3.executeQuery();
                
                if (rs3.next()){ return -2; }
                
                // MAIN INSERT SQL QUERY
                ps = conn.prepareStatement(query);
                ps.setString(1, mrn);
                ps.setString(2, npi);
                ps.setString(3, lab_report_id);
                ps.setString(4, purpose);
                ps.setString(5, start_datetime);
                ps.setString(6, end_datetime);
                ps.setString(7, appointment_fee);
                ps.setString(8, "unpaid"); // hardcoded default
                
                ps.executeUpdate();
                return 1;
                
            } catch (Exception e){
                e.printStackTrace();
            }
        } catch (Exception e){
            e.printStackTrace();
        }
        return 0;
    }
    
    public static boolean 



}
