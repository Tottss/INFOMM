<!DOCTYPE html>
<html>
    <head>
        <title>Update Appointment</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <h1>Update Appointment</h1>
        <form action="appointment_update_result.jsp" method="post">
            <label for="appointment_id" >Select Appointment</label>
            <select name="appointment_id" id="appointment_id" required>
                <jsp:include page="helper_select_appointment.jsp"></jsp:include>
            </select><br>
            
            <label for="purpose">Update Purpose</label>
            <input type="text" id="purpose" name="purpose"><br>
            
            <label for="date">Update Appointment Date</label>
            <input type="date" name="date" id="date"><br>
            
            <label for="start_time">Update Start Time</label>
            <input type="time" name="start_time" id="start_time"><br>
            
            <label for="end_time">Update End Time</label>
            <input type="time" name="end_time" id="end_time"><br>

            <label for="appointment_fees">Update Appointment Fee</label>
            <input type="text" name="appointment_fees" id="appointment_fees"><br>
            
            <label for="payment_status" >Update Payment Status</label>
            <select name="payment_status" id="payment_status" required>
                <option value="unpaid">Unpaid</option>
                <option value="paid">Paid</option>
                <option value="refunded">Refunded</option>
            </select><br>
            
            <button type="submit">Update Appointment</button>
        </form>
    </body>
</html>
