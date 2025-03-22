<!DOCTYPE html>
<html>
    <head>
        <title>Add Appointment</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <h1>Add Appointment</h1>
        <form action="appointment_process.jsp" method="post">
            <label for="mrn" >Select the Patient</label>
            <select name="mrn" id="mrn">
                <jsp:include page="helper_select_patient.jsp"></jsp:include>
            </select><br>
            
            <label for="npi">Select the Attending Doctor</label>
            <select name="npi" id="npi">
                <jsp:include page="helper_select_doctor.jsp"></jsp:include>
            </select><br>
            
            <label for="lab_report_id">Select the Lab Report</label>
            <select name="lab_report_id" id="lab_report_id">
                <jsp:include page="helper_select_report.jsp"></jsp:include>
            </select><br>
            
            <label for="purpose">Purpose:</label>
            <input type="text" id="purpose" name="purpose" required><br>
            
            <label for="date">Enter Appointment Date</label>
            <input type="date" required><br>
            
            <label for="start_time">Enter Start Time</label>
            <input type="time" required><br>
            
            <label for="end_time">Enter End Time</label>
            <input type="time" required><br>
            
            <label for="appointment_fee">Enter Fee</label>
            <input type="number" required><br>
            
            <button type="submit">Submit Appointment</button>
        </form>
    </body
</html>
