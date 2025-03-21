package java.clinicdb;

import java.sql.*;

public class Doctor {
    public String npi;
    public String last_name;
    public String first_name;
    public String middle_name;
    public String sex;
    public String birthdate;
    public String medical_certification;
    public String year_of_service;
    public String specialization;

    public Doctor() {
        npi = "";
        last_name = "";
        first_name = "";
        middle_name = "";
        sex = "";
        birthdate = "";
        medical_certification = "";
        year_of_service = "";
        specialization = "";
    }

    // Getters and Setters
    public String getNPI() {
        return npi;
    }

    public void setNPI(String npi) {
        this.npi = npi;
    }

    public String getLastName() {
        return last_name;
    }

    public void setLastName(String last_name) {
        this.last_name = last_name;
    }

    public String getFirstName() {
        return first_name;
    }

    public void setFirstName(String first_name) {
        this.first_name = first_name;
    }

    public String getMiddleName() {
        return middle_name;
    }

    public void setMiddleName(String middle_name) {
        this.middle_name = middle_name;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getBirthdate() {
        return birthdate;
    }

    public void setBirthdate(String birthdate) {
        this.birthdate = birthdate;
    }

    public String getMedicalCertification() {
        return medical_certification;
    }

    public void setMedicalCertification(String medical_certification) {
        this.medical_certification = medical_certification;
    }

    public String getYearsOfService() {
        return year_of_service;
    }

    public void setYearsOfService(String year_of_service) {
        this.year_of_service = year_of_service;
    }

    public String getSpecialization() {
        return specialization;
    }

    public void setSpecialization(String specialization) {
        this.specialization = specialization;
    }

    public boolean adddoctor() {
        try {
            // Debug: Print connection attempt
            System.out.println("Attempting to connect to the database...");

            Connection conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/clinic?useTimezone=true&serverTimezone=UTC&user=root&password=password");

            // Debug: Print success message if connected
            System.out.println("Connected to the database successfully!");

            PreparedStatement pstmt = conn.prepareStatement(
                    "INSERT INTO doctor (npi, last_name, first_name, middle_name, sex, birth_date, medical_certification, years_of_service, specialization) VALUES (?, ?, ?, ?, ?, ?, ?, ? ,?)");
            pstmt.setString(1, npi);
            pstmt.setString(2, last_name);
            pstmt.setString(3, first_name);
            pstmt.setString(4, middle_name);
            pstmt.setString(5, sex);
            pstmt.setString(6, birthdate);
            pstmt.setString(7, medical_certification);
            pstmt.setString(8, year_of_service);
            pstmt.setString(9, specialization);
            pstmt.executeUpdate();
            pstmt.close();
            conn.close();
            return true;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false;
        }
    }

    public boolean updateDoctorField(String npi, String field, String newValue) {
        // Validate input to prevent SQL injection (only allow specific column names)
        if (!isValidField(field)) {
            System.out.println("Invalid field name.");
            return false;
        }

        // Dynamic SQL Query
        String sql = "UPDATE Doctor SET " + field + " = ? WHERE npi = ?";

        try (Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/clinic?useTimezone=true&serverTimezone=UTC&user=root&password=password");
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, newValue); // New value
            pstmt.setString(2, npi); // Doctor's ID

            int rowsUpdated = pstmt.executeUpdate();
            return rowsUpdated > 0;

        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
            return false;
        }
    }

    public int delete_doctor() {
        try {
            Connection conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/dbathletes?useTimezone=true&serverTimezone=UTC&user=root&password=1123_Jeru");
            PreparedStatement pstmt = conn.prepareStatement("DELETE FROM Doctor WHERE npi=?");
            pstmt.setString(1, npi);
            pstmt.executeUpdate();
            System.out.println("Doctor record was deleted");
            pstmt.close();
            conn.close();
            return 1;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return 0;
        }
    }

    public int view_doctor() {
        try {
            Connection conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/dbapp?useSSL=false&serverTimezone=UTC", "root", "sgdsmt21");
            PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM doctor WHERE npi=?");
            pstmt.setString(1, npi);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                npi = rs.getString("npi");
                last_name = rs.getString("last_name");
                first_name = rs.getString("first_name");
                middle_name = rs.getString("middle_name");
                sex = rs.getString("sex");
                birthdate = rs.getString("birthdate");
                medical_certification = rs.getString("medical_certification");
                year_of_service = rs.getString("year_of_service");
                specialization = rs.getString("specialization");

                // front end code nalang kulang
                rs.close();
            }

            pstmt.close();
            conn.close();
            return 1;

        } catch (Exception e) {
            System.out.println(e.getMessage());
            return 0;
        }

    }

    // Helper method to validate allowed column names (prevents SQL injection)
    private boolean isValidField(String field) {
        return field.matches(
                "last_name|first_name|middle_name|sex|birthdate|medical_certification|Years_of_service|specialization");
    }

}