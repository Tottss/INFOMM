import java.sql.*;

public class Doctor{
    public String NPI;
    public String Last_name;
    public String First_name;
    public String Middle_name;
    public String Sex;
    public String Birthday;
    public String Medical_certification;
    public String Year_of_service;
    public String specialization;

    public Doctor(){
        NPI = "";
        Last_name = "";
        First_name = "";
        Middle_name = "";
        Sex = "";
        Birthday = "";
        Medical_certification = "";
        Year_of_service = "";
        specialization = "";
    }
    
    public boolean addteam() {
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbathletes?useTimezone=true&serverTimezone=UTC&user=root&password=1123_Jeru");
            PreparedStatement pstmt = conn.prepareStatement("INSERT INTO Doctor (NPI, Last_name, First_name, Middle_name, Sex, Birthday, Medical_certification, Years_of_service, Specialization) VALUES (?, ?, ?, ?, ?, ?, ?, ? ,?)");
            pstmt.setString(1, NPI);
            pstmt.setString(2, Last_name);
            pstmt.setString(3, First_name);
            pstmt.setString(4, Middle_name);
            pstmt.setString(5, Sex);
            pstmt.setString(6, Birthday);
            pstmt.setString(7, Medical_certification);
            pstmt.setString(8, Year_of_service);
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

            pstmt.setString(1, newValue);  // New value
            pstmt.setString(2, NPI);       // Doctor's ID

            int rowsUpdated = pstmt.executeUpdate();
            return rowsUpdated > 0;

        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
            return false;
        }
    }

    public int delete_doctor() {
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbathletes?useTimezone=true&serverTimezone=UTC&user=root&password=1123_Jeru");
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
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbapp?useSSL=false&serverTimezone=UTC", "root", "sgdsmt21");
            PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM doctor WHERE NPI=?");
            pstmt.setString(1, NPI);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                NPI = rs.getString("NPI");
                Last_name = rs.getString("Last_name");
                First_name = rs.getString("First_name");
                Middle_name = rs.getString("Middle_name");
                Sex = rs.getString("Sex");
                Birthday = rs.getString("Birthday");
                Medical_certification = rs.getString("Medical_certification");
                Year_of_service = rs.getString("Year_of_service");
                specialization = rs.getString("Specialization");

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
        return field.matches("Last_name|First_name|Middle_name|Sex|Birthday|Medical_certification|Years_of_service|Specialization");
    }


}