<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        SELECT reason, COUNT(*) AS request_count 
        FROM clinic.lab_requests 
        GROUP BY reason 
        ORDER BY request_count DESC 
        LIMIT 5;

    </body>
</html>
