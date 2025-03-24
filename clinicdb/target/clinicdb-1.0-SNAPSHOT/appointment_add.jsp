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
            
            <!-- html date format: "YYYY-MM-DD"  -->
            <label for="date">Enter Appointment Date</label>
            <input type="date" name="date" id="date" required><br>
            
            <!-- html time format: "HH:MI"  -->
            <!-- sql DATETIME actually has seconds "HH:MI:SS"  -->
            <label for="start_time">Enter Start Time</label>
            <input type="time" name="start_time" id="start_time" required><br>
            
            <label for="end_time">Enter End Time</label>
            <input type="time" name="end_time" id="end_time" required><br>
            
            <!-- dont forget to calculate total fees (appointment fee + lab report fee) -->
            <!-- also html hates decimal types so just parse this string later -->
            <label for="appointment_fee">Enter Appointment Fee</label>
            <input type="text" name="appointment_fee" id="appointment_fee" required><br>
            
            <button type="submit">Submit Appointment</button>
        </form>
    </body
</html>
