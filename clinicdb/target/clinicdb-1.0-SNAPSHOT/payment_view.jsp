<!DOCTYPE html>
<html>
    <head>
        <title>View Appointment</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <h2>Search for an Appointment</h2>
        <form action="appointment_view.jsp" method="post">
            
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
            
        <h2>Payment Details</h2>
            <table border="1">
                <tr>
                    <th>Appointment ID</th>
                    <th>Patient Name</th>
                    <th>Start Date and Time</th>
                    <th>End Date and Time</th>
                    <th>Appointment Fees</th>
                    <th>Lab Fees</th>
                    <th>Total Fees</th>
                    <th>Payment Status</th>
                    </tr>
                    <tr>
                        <td><%= A.npi %></td>
                        <td><%= A.last_name %></td>
                    </tr>
            /table>
    </body>
</html>
