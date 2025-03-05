<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registration Form</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<%
    String message = "";
    if (request.getParameter("submit") != null) {
        
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String mobile = request.getParameter("phone");
        String address = request.getParameter("address");
        String password = request.getParameter("password");

     
        String jdbcURL = "jdbc:mysql://localhost:3306/demodb";
        String dbUser = "root";
        String dbPassword = "@Shubham23";

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            
            Class.forName("com.mysql.cj.jdbc.Driver");

          
            conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

           
            String query = "INSERT INTO employee (name, email, phone, address, password) VALUES (?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, name);
            pstmt.setString(2, email);
            pstmt.setString(3, mobile);
            pstmt.setString(4, address);
            pstmt.setString(5, password); 

           
            int rowsInserted = pstmt.executeUpdate();
            if (rowsInserted > 0) {
            	response.sendRedirect("user_view.jsp");
                message = "<div class='alert alert-success'>Registration Successful!</div>";
                return;
            } else {
                message = "<div class='alert alert-danger'>Registration Failed!</div>";
            }
        } catch (Exception e) {
            message = "<div class='alert alert-danger'>Error: " + e.getMessage() + "</div>";
        } finally {
            try { if (pstmt != null) pstmt.close(); } catch (Exception ignored) {}
            try { if (conn != null) conn.close(); } catch (Exception ignored) {}
        }
    }
%>

<div class="container d-flex justify-content-center align-items-center vh-100">
    <div class="card" style="width: 25rem;">
        <div class="card-header text-center"><h4>Registration Form</h4></div>
        <div class="container">
            <%= message %>
            <form action="registration.jsp" method="post">
                <div class="mb-3">
                    <label class="form-label">Name</label>
                    <input type="text" name="name" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Email address</label>
                    <input type="email" name="email" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Mobile No.</label>
                    <input type="text" name="phone" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Address</label>
                    <textarea class="form-control" name="address" required></textarea>
                </div>
                <div class="mb-3">
                    <label class="form-label">Password</label>
                    <input type="password" name="password" class="form-control" required>
                </div>
                <button type="submit" name="submit" class="btn btn-primary mb-3">Submit</button>
            </form>
        </div>
    </div>
</div>

</body>
</html>
