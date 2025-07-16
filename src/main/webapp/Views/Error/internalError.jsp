<%@ page contentType="text/html;charset=UTF-8" language="java" isErrorPage="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>500 Internal Server Error | Servlet MVC Template</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container">
        <div class="row justify-content-center align-items-center min-vh-100">
            <div class="col-md-6 text-center">
                <div class="mb-4">
                    <i class="bi bi-exclamation-circle display-1 text-danger"></i>
                </div>
                <h1 class="display-4 fw-bold mb-3">500</h1>
                <h2 class="h4 mb-3">Internal Server Error</h2>
                <p class="text-muted mb-4">Something went wrong on our end. Please try again later.</p>
                <a href="<%= request.getContextPath() %>/" class="btn btn-primary">
                    <i class="bi bi-house me-2"></i>Go Home
                </a>
            </div>
        </div>
    </div>
</body>
</html>