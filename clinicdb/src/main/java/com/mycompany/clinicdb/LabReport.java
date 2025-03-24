package com.mycompany.clinicdb;

import java.sql.*;

public class LabReport {
    public String lab_report_id = null;
    public String lab_request_id = null;
    public String mrn = null;
    public String npi = null;
    public String payment_id = null;
    public String findings = null;
    public String lab_test_datetime = null;
    public double lab_fees = 0;
    public String report_status = null;
    public String payment_status = null;
    
    // Returns int
    // -1 : appointment overlaps with another
    // -2 : doctor is already booked at the same time
    // 1 : it worked
    // 0 idk wtf happened
    public static int add_labreport(String lab_request_id, String mrn, String npi,
                                      String payment_id, String findings, String date, String time,
                                      String lab_fees, String lab_results, 
                                      String report_status, String payment_status){
        // sql query
        String query = "INSERT INTO appointments (lab_report_id, lab_request_id, mrn, npi, "
                + "payment_id, purpose, lab_test_datetime, "
                + "lab_fees, lab_results, report_status, payment_status) "
                + "VALUES (?,?,?,?,?,?,?,?,?,?);";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // PLS DONT REMOVE
            try {
                Connection conn = DriverManager.getConnection(DBConnection.URL,
                        DBConnection.USER, DBConnection.PASSWORD);
                
                PreparedStatement ps, ps2, ps3, ps4;
                ResultSet rs2, rs3, rs4; // note: rs doesnt exist
                
                //Parse html date and time inputs
                String datetime = date+" "+time;
                
                // Check if appointment overlaps with another
                ps4 = conn.prepareStatement("SELECT lrp.lab_report_id "
                        + "FROM lab_reports lrp "
                        + "WHERE lrp.lab_test_datetime = ? ");
                ps4.setString(1,lab_test_datetime); 
                rs4 = ps4.executeQuery();
                
                if (rs4.next()){ return -1; }
                
                // Check if doctor is booked
                ps3 = conn.prepareStatement("SELECT d.npi FROM doctors d "
                        + "JOIN lab_reports lrp ON d.npi=lrp.npi ");
                rs3 = ps3.executeQuery();
                
                if (rs3.next()){ return -2; }
                
                // MAIN INSERT SQL QUERY
                ps = conn.prepareStatement(query);
                ps.setString(1, "APPT004"   ); // HARDCODE PLS FIX
                ps.setString(2, mrn);
                ps.setString(3, npi);
                ps.setString(4, lab_report_id);
                ps.setString(5, purpose);
                ps.setString(6, start_datetime);
                ps.setString(7, end_datetime);
                ps.setString(8, total_fees);
                ps.setString(9, "unpaid"); // hardcoded default
                
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
    
}
