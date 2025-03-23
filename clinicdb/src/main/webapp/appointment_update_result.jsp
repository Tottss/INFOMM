<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Appointment Process</title>
    </head>
    <body>
        <jsp:useBean id="A" class="com.mycompany.clinicdb.Appointments" scope="session"/>
        <%
        String appointmentId = request.getParameter("appointment_id");
        String purpose = request.getParameter("purpose");
        String date = request.getParameter("date");
        String startTime = request.getParameter("start_time");
        String endTime = request.getParameter("end_time");
        String appointmentFee = request.getParameter("appointment_fees");
        String paymentStatus = request.getParameter("payment_status");

        // Debugging output
        out.println("Received Parameters: <br>");
        out.println("Appointment ID: " + appointmentId + "<br>");
        out.println("Purpose: " + purpose + "<br>");
        out.println("Date: " + date + "<br>");
        out.println("Start Time: " + startTime + "<br>");
        out.println("End Time: " + endTime + "<br>");
        out.println("Appointment Fees: " + appointmentFee + "<br>");
        out.println("Payment Status: " + paymentStatus + "<br>");

        int appointment = A.update_appointment(appointmentId, purpose, date, startTime, endTime, appointmentFee, paymentStatus);

        out.println("Update Result: " + appointment);
        %>

    </body>
</html>
