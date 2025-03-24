<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        SELECT lab_report_id, mrn, npi, findings
    FROM clinic.lab_reports
    WHERE report_status = 'pending';

    </body>
</html>
