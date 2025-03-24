<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        SELECT AVG(TIMESTAMPDIFF(HOUR, request_date, lab_test_datetime)) AS avg_turnaround_hours
        FROM clinic.lab_requests lr
        JOIN clinic.lab_reports lrp ON lr.lab_request_id = lrp.lab_request_id
        WHERE lrp.report_status = 'completed';

    </body>
</html>
