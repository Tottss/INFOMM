<%-- 
    Document   : adddoctor.jsp
    Created on : 20 Mar 2025, 8:49:24 pm
    Author     : Akaraan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, clinicdb.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Doctor Processing</title>
    </head>
    <body>
        <jsp:useBean id="A" class="clinicdb.Doctor" scope="session" />  

        <% 
            // Receive the values from adddoctor.html
            String v_surname = request.getParameter("last_name");
            String v_firstname = request.getParameter("first_name");
            String v_middlename = request.getParameter("middle_name");
            String v_sex = request.getParameter("sex");
            String v_birthdate = request.getParameter("birthdate");
            String v_medcert = request.getParameter("medical_certification"); // Corrected parameter name
            String v_yearsofservice = request.getParameter("year_of_service");
            String v_specialization = request.getParameter("specialization");

            // Set the properties of the Doctor bean
            A.setLastName(v_surname);
            A.setFirstName(v_firstname);
            A.setMiddleName(v_middlename);
            A.setSex(v_sex);
            A.setBirthdate(v_birthdate);
            A.setMedicalCertification(v_medcert);
            A.setYearsOfService(v_yearsofservice);
            A.setSpecialization(v_specialization);

            // Call the adddoctor method
            boolean status = A.adddoctor();

            // Check the status and display the result
            if (status) {
        %>
        <h1>Adding Doctor Successful</h1>
        <% 
            } else { 
        %>
        <h1>Adding Doctor Failed</h1>
        <% 
            } 
        %>
    </body>
</html>