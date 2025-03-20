
import java.sql.*;

public class Patient {
    public String MRN;
    public String Last_name;
    public String First_name;
    public String Middle_name;
    public String Sex;
    public String Birthday;
    public int Contact_no;

    public Patient(){
        MRN = "";
        Last_name = "";
        First_name = "";
        Middle_name = "";
        Sex = "";
        Birthday = "";
        Contact_no = 0;
        
    }

    public boolean adddoctor() {
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbathletes?useTimezone=true&serverTimezone=UTC&user=root&password=1123_Jeru");
            PreparedStatement pstmt = conn.prepareStatement("INSERT INTO Patients (MRN, Last_name, First_name, Middle_name, Sex, Birthday, contact_no) VALUES (?, ?, ?, ?, ?, ?, ?, ? ,?)");
            pstmt.setString(1, MRN);
            pstmt.setString(2, Last_name);
            pstmt.setString(3, First_name);
            pstmt.setString(4, Middle_name);
            pstmt.setString(5, Sex);
            pstmt.setString(6, Birthday);
            pstmt.setInt(7, Contact_no);
            pstmt.executeUpdate();
            pstmt.close();
            conn.close();
            return true;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false;
        }
    }

    public boolean updatePatientField(String MRN, String field, String newValue) {
        // Validate input to prevent SQL injection (only allow specific column names)
        if (!isValidField(field)) {
            System.out.println("Invalid field name.");
            return false;
        }

        // Dynamic SQL Query
        String sql = "UPDATE Patients SET " + field + " = ? WHERE MRN = ?";

        try (Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/dbathletes?useTimezone=true&serverTimezone=UTC&user=root&password=1123_Jeru");
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, newValue);  // New value
            pstmt.setString(2, MRN);       // Doctor's ID

            int rowsUpdated = pstmt.executeUpdate();
            return rowsUpdated > 0;

        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
            return false;
        }
    }

    public int delete_patient() {
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbathletes?useTimezone=true&serverTimezone=UTC&user=root&password=1123_Jeru");
            PreparedStatement pstmt = conn.prepareStatement("DELETE FROM Patients WHERE MRN=?");
            pstmt.setString(1, MRN);
            pstmt.executeUpdate();
            System.out.println("Patient record was deleted");
            pstmt.close();
            conn.close();
            return 1;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return 0;
        }
    }

    public int viewPatientRecord() {
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbapp?useSSL=false&serverTimezone=UTC", "root", "sgdsmt21");
            PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM Patients WHERE MRN=?");
            pstmt.setString(1, MRN);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                MRN = rs.getString("NPI");
                Last_name = rs.getString("Last_name");
                First_name = rs.getString("First_name");
                Middle_name = rs.getString("Middle_name");
                Sex = rs.getString("Sex");
                Birthday = rs.getString("Birthday");
                Contact_no = rs.getInt("contact_no");
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
        return field.matches("Last_name|First_name|Middle_name|Sex|Birthday|contact_no");
    }

}
