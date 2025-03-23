<%@ page import="com.mycompany.clinicdb.Diagnosis" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="jakarta.servlet.*" %>
<%@ page import="jakarta.servlet.http.*" %>

<html>
<head>
    <title>View Diagnosis</title>
</head>
<body>
    <h2>View Diagnosis</h2>
    <form method="POST" action="diagnosis_view.jsp">
        Enter Diagnosis ID: <input type="text" name="diagnosis_id" required>
        <input type="submit" value="Search">
    </form>

    <% 
        String diagnosisID = request.getParameter("diagnosis_id");
        if (diagnosisID != null && !diagnosisID.isEmpty()) {
            Diagnosis diagnosis = new Diagnosis();
            int result = diagnosis.view_diagnosis(diagnosisID);
            
            if (result == 1) { %>
                <h3>Diagnosis Details</h3>
                <p><strong>Diagnosis ID:</strong> <%= diagnosis.diagnosis_id %></p>
                <p><strong>Appointment ID:</strong> <%= diagnosis.appointment_id %></p>
                <p><strong>Diagnosis:</strong> <%= diagnosis.diagnosis %></p>
                <p><strong>Treatment:</strong> <%= diagnosis.treatment %></p>
            <% } else { %>
                <p style="color: red;">No diagnosis found for ID <%= diagnosisID %>.</p>
            <% } 
        } 
    %>
</body>
</html>