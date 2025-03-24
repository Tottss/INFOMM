<%@ page import="java.sql.*, com.mycompany.clinicdb.DBConnection" %>
<html>
<head>
    <title>Appointments Handled by Each Doctor</title>
</head>
<body>
    <h2>Number of Appointments Handled by Each Doctor</h2>
    <table border="1">
        <tr>
            <th>Doctor Name</th>
            <th>Total Appointments</th>
        </tr>
        <%
            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;
            
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection(DBConnection.URL, DBConnection.USER, DBConnection.PASSWORD);
                stmt = conn.createStatement();
                
                String query = "SELECT d.last_name, d.First_name, COUNT(a.appointment_id) AS total_appointments " +
                               "FROM doctors d " +
                               "LEFT JOIN appointments a ON d.npi = a.npi " +
                               "GROUP BY d.npi, d.last_name, d.First_name";
                rs = stmt.executeQuery(query);
                
                while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getString("First_name") + " " + rs.getString("last_name") %></td>
            <td><%= rs.getInt("total_appointments") %></td>
        </tr>
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            }
        %>
    </table>
</body>
</html>