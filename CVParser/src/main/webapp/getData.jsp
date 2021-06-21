<%-- 
    Document   : CheckCV
    Created on : Apr 24, 2020, 11:02:28 PM
    Author     : User
--%>

<%@page import="CheckCV.CheckCV"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DBControl.DBHandler"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

        <link href="CustomStyles.css?version=20" rel="stylesheet" type="text/css"/>

        <title>Check CVs</title>
    </head>
    <body>
        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //for Http version 1.1
            response.setHeader("Pragma", "no-cache");//for Http version 1.0
            response.setHeader("Expires", "0");//for proxies

            if (session.getAttribute("username") == null || session.getAttribute("password") == null) {
                response.sendRedirect("SignIn.jsp");
            }
        
            if (request.getParameter("uid") != null) {
                int id = Integer.parseInt(request.getParameter("uid"));
                Connection con;
                PreparedStatement ps;
                DBHandler handler;
                String q1 = "";
                handler = new DBHandler();
                try {
                    con = handler.Connect();
                    q1 = "Select * from `cvparser`.`appliers` where `ID`=?";
                    ps = con.prepareStatement(q1);
                    ps.setInt(1, id);
                    ResultSet res = ps.executeQuery();
                    while (res.next()) {

        %>

        <%=res.getString("Message")%>

        <%
                    }
                    ps.clearBatch();
                    ps.close();
                    con.close();
                } catch (ClassNotFoundException ex) {
                    Logger.getLogger(CheckCV.class.getName()).log(Level.SEVERE, null, ex);
                } catch (SQLException ex) {
                    Logger.getLogger(CheckCV.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        %>



    </body>
</html>

