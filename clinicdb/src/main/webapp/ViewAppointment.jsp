<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Appointment Details</title>
</head>
<body>
    <jsp:useBean id="A" class="com.mycompany.clinicdb.ViewAppointment" scope="session"/>
    <%
        String appointmentId = request.getParameter("appointmentId"); // Get from URL or form
        A.getAppointmentDetails(appointmentId);
    %>
    <h2>Appointment Details</h2>
    <p><strong>Patient Name:</strong> <%= A.patientName%></p>
</body>
</html>
