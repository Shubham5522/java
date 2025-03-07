<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Employee Details</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container d-flex justify-content-center align-items-center vh-100">
        <div class="card" style="width: 50rem;">
            <div class="card-header text-center"><h4>User Details</h4></div>
            <div class="card-body text-center">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th scope="col">Sr.No.</th>
                            <th scope="col">Name</th>
                            <th scope="col">Email</th>
                            <th scope="col">Mobile No.</th>
                            <th scope="col">Address</th>
                            <th scope="col">Action</th> 
                        </tr>
                    </thead>
                    <tbody>
                        <%
                          
                            String url = "jdbc:mysql://localhost:3306/demodb";
                            String user = "root";  
                            String pass = "@Shubham23";  
                            
                            Connection con = null;
                            PreparedStatement pst = null;
                            ResultSet rs = null;
                            
                            try {
                               
                                Class.forName("com.mysql.cj.jdbc.Driver");
                                con = DriverManager.getConnection(url, user, pass);
                                
                           
                                String query = "SELECT * FROM employee";
                                pst = con.prepareStatement(query);
                                rs = pst.executeQuery();
                                
                                int count = 1;
                                while (rs.next()) {
                        %>
                        <tr>
                            <td><%= count++ %></td>
                            <td><%= rs.getString("name") %></td>
                            <td><%= rs.getString("email") %></td>
                            <td><%= rs.getString("phone") %></td>
                            <td><%= rs.getString("address") %></td>
                            <td><a href="user_update.jsp?id=<%= rs.getInt("id")%>"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16" onclick="return confirm('Are you sure you want to update this user?');">
								  <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
								  <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5z"/>
								</svg></a>
								
								<a href="user_delete.jsp?id=<%= rs.getInt("id")%>"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash3" viewBox="0 0 16 16" onclick="return confirm('Are you sure you want to delete this user?');">
								  <path d="M6.5 1h3a.5.5 0 0 1 .5.5v1H6v-1a.5.5 0 0 1 .5-.5M11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3A1.5 1.5 0 0 0 5 1.5v1H1.5a.5.5 0 0 0 0 1h.538l.853 10.66A2 2 0 0 0 4.885 16h6.23a2 2 0 0 0 1.994-1.84l.853-10.66h.538a.5.5 0 0 0 0-1zm1.958 1-.846 10.58a1 1 0 0 1-.997.92h-6.23a1 1 0 0 1-.997-.92L3.042 3.5zm-7.487 1a.5.5 0 0 1 .528.47l.5 8.5a.5.5 0 0 1-.998.06L5 5.03a.5.5 0 0 1 .47-.53Zm5.058 0a.5.5 0 0 1 .47.53l-.5 8.5a.5.5 0 1 1-.998-.06l.5-8.5a.5.5 0 0 1 .528-.47M8 4.5a.5.5 0 0 1 .5.5v8.5a.5.5 0 0 1-1 0V5a.5.5 0 0 1 .5-.5"/>
								</svg></a>

							</td> 
                        </tr>
                        <%
                                }
                            } catch (Exception e) {
                                out.println("<tr><td colspan='6' class='text-danger'>Error: " + e.getMessage() + "</td></tr>");
                            } finally {
                                if (rs != null) rs.close();
                                if (pst != null) pst.close();
                                if (con != null) con.close();
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>
