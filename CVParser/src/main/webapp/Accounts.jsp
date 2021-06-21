<%-- 
    Document   : CheckCV
    Created on : Apr 24, 2020, 11:02:28 PM
    Author     : User
--%>

<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.BufferedOutputStream"%>
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

        <link href="CustomStyles.css?version=14" rel="stylesheet" type="text/css"/>

        <title>Accounts</title>
    </head>
    <body>
        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //for Http version 1.1
            response.setHeader("Pragma", "no-cache");//for Http version 1.0
            response.setHeader("Expires", "0");//for proxies

            if (session.getAttribute("username") == null || session.getAttribute("password") == null || session.getAttribute("idUser") == null || session.getAttribute("idLog") == null) {
                response.sendRedirect("SignIn.jsp");
            }
        %>

        <nav class="navbar navbar-expand-lg navbar navbar-dark bg-dark sticky-top">
            <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <div class="navbar-nav">
                    <a href="#" class="nav-item nav-link active">MyCompany</a>
                    <a href="CheckCV.jsp" class="nav-item nav-link ">CVs</a>
                </div>
                <div class="navbar-nav ml-auto">
                    <a href="SignUp.jsp" class="nav-item nav-link"> Sign Up</a>
                    <form action="Logout" name="myForm" id="myForm">
                        <a href="index.jsp" class="nav-item nav-link" onclick='document.forms["myForm"].submit(); return false;'>Logout</a>
                    </form>
                </div>
            </div>
        </nav>

        <h1 class="text-dark">Welcome ${username}</h1>
        <hr/>
        <div class="form-inline" id="myDiv">
            <input class="form-control" name="myInput" id="myInput" type="text" style=" height: 35px; width: 300px; float: left;"  placeholder="Search..">
        </div>
    </form>

    <div class="table-responsive">
        <table class="table" >
            <thead class="thead-dark">
                <tr >
                    <th class="align-middle" scope="col">First Name</th>
                    <th class="align-middle" scope="col">Last Name</th>
                    <th class="align-middle" scope="col">Position</th>
                    <th class="align-middle" scope="col">Username</th>
                    <th class="align-middle" scope="col">Log</th>
                    <th class="align-middle" scope="col">Delete</th>
                </tr>
            </thead>
            <tbody id="myTable">


                <%
                    Connection con;
                    PreparedStatement ps;
                    PreparedStatement ps1;
                    DBHandler handler;
                    String q1 = "";
                    handler = new DBHandler();
                    try {
                        con = handler.Connect();
                        q1 = "Select * from `cvparser`.`users`";
                        ps1 = con.prepareStatement(q1);

                        ResultSet res = ps1.executeQuery();
                        while (res.next()) {
                %>
                <tr>
                    <td class="align-middle" ><%=res.getString("FirstName")%></td>
                    <td class="align-middle" ><%=res.getString("LastName")%></td>
                    <td class="align-middle" ><%=res.getString("Position")%></td>
                    <td class="align-middle" ><%=res.getString("Username")%></td>
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModal" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Logging</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div id="show-data"></div>
                        </div>

                    </div>
                </div>
            </div>
            <td class="align-middle" >
                <button class="btn btn-link showLog" id="<%=res.getString("ID")%>" data-toggle="modal" data-target="#myModal" >View log</button>
            </td>

            <%
            if (session.getAttribute("username") != null && Integer.parseInt(res.getString("ID")) > 1 && (int) session.getAttribute("idUser") == 1) {%>
            <td class="align-middle" >
                <form action="Delete" method="post" >
                    <input type="hidden" name="hInp" id="hInp" value="<%=res.getString("ID")%>" />
                    <button class="btn btn-link" type="submit" name="submit" >Delete</button>
                </form>
            </td>
            <% } else { %> 
            <td class="align-middle"></td>
            </tr>
            <% }
                    }
                } catch (ClassNotFoundException ex) {
                    Logger.getLogger(CheckCV.class.getName()).log(Level.SEVERE, null, ex);
                } catch (SQLException ex) {
                    Logger.getLogger(CheckCV.class.getName()).log(Level.SEVERE, null, ex);
                }
            %>
            </tbody>
        </table>
    </div>

    <script>
        $(document).ready(function () {
            $("#myInput").on("keyup", function () {
                var value = $(this).val().toLowerCase();
                $("#myTable tr").filter(function () {
                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
                });
            });
        });

        $(document).ready(function () {
            $('.showLog').click(function () {
                var id = $(this).attr("id");
                $.ajax({
                    url: "getLog.jsp",
                    type: "post",
                    data: "uid=" + id,
                    success: function (data) {
                        $("#show-data").html(data);

                    }
                });
            });
        });


    </script>
</body>


</html>
