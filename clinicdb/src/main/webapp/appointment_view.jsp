<!DOCTYPE html>
<html>
    <head>
        <title>View Appointment</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <h2>Search for an Appointment</h2>
        <form action="appointment_view_process.jsp" method="post">
            
            <label for="category">Search By:</label>
            <select id="category" name="category">
                <option value="patient_name">Patient Name</option>
                <option value="contact_no">Contact Number</option>
                <option value="attending_doctor">Attending Doctor</option>
                <option value="lab_report_status">Lab Report Status</option>
                <option value="payment_status">Payment Status</option>
            </select>

            <input type="text" id="search_value" name="search_value" required>
            <button type="submit">Search</button>
        </form>        
    </body>
</html>
