package DBAPPG10;

import java.sql.*;

public class Doctor {
    public String NPI;
    public String Last_name;
    public String First_name;
    public String Middle_name;
    public String Sex;
    public String Birthdate;
    public String Medical_certification;
    public String Year_of_service;
    public String Specialization;

    public Doctor() {
        NPI = "";
        Last_name = "";
        First_name = "";
        Middle_name = "";
        Sex = "";
        Birthdate = "";
        Medical_certification = "";
        Year_of_service = "";
        Specialization = "";
    }

    // Getters and Setters
    public String getNPI() {
        return NPI;
    }

    public void setNPI(String NPI) {
        this.NPI = NPI;
    }

    public String getLastName() {
        return Last_name;
    }

    public void setLastName(String Last_name) {
        this.Last_name = Last_name;
    }

    public String getFirstName() {
        return First_name;
    }

    public void setFirstName(String First_name) {
        this.First_name = First_name;
    }

    public String getMiddleName() {
        return Middle_name;
    }

    public void setMiddleName(String Middle_name) {
        this.Middle_name = Middle_name;
    }

    public String getSex() {
        return Sex;
    }

    public void setSex(String Sex) {
        this.Sex = Sex;
    }

    public String getBirthdate() {
        return Birthdate;
    }

    public void setBirthdate(String Birthdate) {
        this.Birthdate = Birthdate;
    }

    public String getMedicalCertification() {
        return Medical_certification;
    }

    public void setMedicalCertification(String Medical_certification) {
        this.Medical_certification = Medical_certification;
    }

    public String getYearsOfService() {
        return Year_of_service;
    }

    public void setYearsOfService(String Year_of_service) {
        this.Year_of_service = Year_of_service;
    }

    public String getSpecialization() {
        return Specialization;
    }

    public void setSpecialization(String Specialization) {
        this.Specialization = Specialization;
    }

    public boolean adddoctor() {
        try {
            Connection conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/dbathletes?useTimezone=true&serverTimezone=UTC&user=root&password=1123_Jeru");
            PreparedStatement pstmt = conn.prepareStatement(
                    "INSERT INTO Doctor (NPI, Last_name, First_name, Middle_name, Sex, Birthdate, Medical_certification, Years_of_service, Specialization) VALUES (?, ?, ?, ?, ?, ?, ?, ? ,?)");
            pstmt.setString(1, NPI);
            pstmt.setString(2, Last_name);
            pstmt.setString(3, First_name);
            pstmt.setString(4, Middle_name);
            pstmt.setString(5, Sex);
            pstmt.setString(6, Birthdate);
            pstmt.setString(7, Medical_certification);
            pstmt.setString(8, Year_of_service);
            pstmt.setString(9, Specialization);
            pstmt.executeUpdate();
            pstmt.close();
            conn.close();
            return true;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false;
        }
    }

    public boolean updateDoctorField(String NPI, String field, String newValue) {
        // Validate input to prevent SQL injection (only allow specific column names)
        if (!isValidField(field)) {
            System.out.println("Invalid field name.");
            return false;
        }

        // Dynamic SQL Query
        String sql = "UPDATE Doctor SET " + field + " = ? WHERE NPI = ?";

        try (Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/dbathletes?useTimezone=true&serverTimezone=UTC&user=root&password=1123_Jeru");
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, newValue); // New value
            pstmt.setString(2, NPI); // Doctor's ID

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
            PreparedStatement pstmt = conn.prepareStatement("DELETE FROM Doctor WHERE NPI=?");
            pstmt.setString(1, NPI);
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
            PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM doctor WHERE NPI=?");
            pstmt.setString(1, NPI);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                NPI = rs.getString("NPI");
                Last_name = rs.getString("Last_name");
                First_name = rs.getString("First_name");
                Middle_name = rs.getString("Middle_name");
                Sex = rs.getString("Sex");
                Birthdate = rs.getString("Birthdate");
                Medical_certification = rs.getString("Medical_certification");
                Year_of_service = rs.getString("Year_of_service");
                Specialization = rs.getString("Specialization");

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
                "Last_name|First_name|Middle_name|Sex|Birthdate|Medical_certification|Years_of_service|Specialization");
    }

}