<%-- 
    Document   : appointment_view_process
    Created on : Mar 24, 2025, 2:49:39 PM
    Author     : Miel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Appointment Details</title>
    </head>
    <body>
        <h2>Appointment Details</h2>
            <table border="1">
                <tr>
                    <th>Appointment ID</th>
                    <th>Patient Name</th>
                    <th>Sex</th>
                    <th>Birth Date</th>
                    <th>Contact Number</th>
                    <th>Attending Doctor</th>
                    <th>Specialization</th>
                    <th>Purpose</th>
                    <th>Start Date and Time</th>
                    <th>End Date and Time</th>
                    <th>Lab Report Status</th>
                    <th>Appointment Fees</th>
                    <th>Lab Fees</th>
                    <th>Total Fees</th>
                    <th>Payment Status</th>
                    </tr>
                    <jsp:useBean id="A" class="com.mycompany.clinicdb.Appointments" scope="page"/>
                    
                    <%
                        // the father of all spaghetti code
                        if (request.getParameter("category").equals("patient_name")) {
                        A.view_appointment("patient_name", request.getParameter("patient_name")); }
                        
                        else if (request.getParameter("category").equals("contact_no")) {
                        A.view_appointment("contact_no", request.getParameter("contact_no")); }
                        
                        else if (request.getParameter("category").equals("attending_doctor")) {
                        A.view_appointment("attending_doctor", request.getParameter("attending_doctor")); }
                        
                        else if (request.getParameter("category").equals("lab_report_status")) {
                        A.view_appointment("lab_report_status", request.getParameter("lab_report_status")); }
                        
                        else if (request.getParameter("category").equals("payment_status")) {
                        A.view_appointment("payment_status", request.getParameter("payment_status")); }
                    %>
                    
                    <tr>
                        <td><%= A.appointment_id %></td>
                        <td><%= A.patient_name %></td>
                        <td><%= A.sex %></td>
                        <td><%= A.birth_date %></td>
                        <td><%= A.contact_no %></td>
                        <td><%= A.attending_doctor %></td>
                        <td><%= A.specialization %></td>
                        <td><%= A.purpose %></td>
                        <td><%= A.start_datetime %></td>
                        <td><%= A.end_datetime %></td>
                        <td><%= A.lab_report_status %></td>
                        <td><%= A.appointment_fees %></td>
                        <td><%= A.lab_fees %></td>
                        <td><%= A.total_fees %></td>
                        <td><%= A.payment_status %></td>
                    </tr>
            </table>
    </body>
</html>
