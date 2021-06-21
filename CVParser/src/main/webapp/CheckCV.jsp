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

        <link href="CustomStyles.css?version=20" rel="stylesheet" type="text/css"/>

        <title>Check CVs</title>
    </head>

    <%
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //for Http version 1.1
        response.setHeader("Pragma", "no-cache");//for Http version 1.0
        response.setHeader("Expires", "0");//for proxies

        if (session.getAttribute("username") == null || session.getAttribute("password") == null) {
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
                <a href="Accounts.jsp" class="nav-item nav-link ">Accounts</a>
            </div>
            <div class="navbar-nav ml-auto">
                <a href="SignUp.jsp" class="nav-item nav-link"> Sign Up</a>
                <form action="Logout" name="myform" id="myform">
                    <a href="index.jsp" class="nav-item nav-link" onclick='document.forms["myform"].submit(); return false;'>Logout</a>
                </form>
            </div>
        </div>
    </nav>

    <h1 class="text-dark">Welcome ${username}</h1>
    <hr/>
    <div class="form-inline" id="myDiv">
        <input class="form-control" name="myInput" id="myInput" type="text" style=" height: 35px; width: 300px; float: left;"  placeholder="Search..">
    </div>

<div class="table-responsive">
    <table class="table" >
        <thead class="thead-dark">
            <tr >
                <th class="align-middle" scope="col">ID</th>
                <th class="align-middle" scope="col">Name</th>
                <th class="align-middle" scope="col">Email</th>
                <th class="align-middle" scope="col">Phone Number</th>
                <th class="align-middle" scope="col">Skills</th>
                <th class="align-middle" scope="col">Programming languages</th>
                <th class="align-middle" scope="col">Speaking Languages</th>
                <th class="align-middle" scope="col" >Date of Appliance</th>
                <th class="align-middle" scope="col" style="width: 5%">is Candidate</th>
                <th class="align-middle" scope="col">PDF</th>
            </tr>
        </thead>
        <tbody id="myTable">


            <%
                Connection con;
                PreparedStatement ps;
                DBHandler handler;
                String q1 = "";
                String isCand = "";
                String message = "";
                handler = new DBHandler();
                try {
                    con = handler.Connect();
                    q1 = "Select * from `cvparser`.`appliers`";
                    ps = con.prepareStatement(q1);

                    ResultSet res = ps.executeQuery();
                    while (res.next()) {


            %>
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModal" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Message</h5>
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
        <tr>
            <th class="align-middle" scoope="row"><%=res.getString("ID")%></th>
            <td class="align-middle" >
                <button title="View Message" class="btn btn-link showdata" id="<%=res.getString("ID")%>" data-toggle="modal" data-target="#myModal" ><%=res.getString("FullName")%></button>
            </td>
            <td class="align-middle" ><%=res.getString("EmailAddress")%></td>
            <td class="align-middle" ><%=res.getString("PhoneNb")%></td>
            <td class="align-middle" ><%=res.getString("Skills")%></td>
            <td class="align-middle" ><%=res.getString("PrLang")%></td>
            <td class="align-middle" ><%=res.getString("SpLang")%></td>
            <td class="align-middle" ><%=res.getDate("DateOfAppliance")%></td>
            <%if (res.getByte("isCandidate") == 0) {
                    isCand = "No";
                } else {
                    isCand = "Yes";
                }%>
            <td class="align-middle" ><%=isCand%></td>
            <%
                String path = res.getString("CV");%>
            <td class="align-middle" >
                <form action="CheckCV" method="get" target="_blank"> 
                    <input type="hidden" name="hInp" id="hInp" value="<%=path%>" />
                    <button class="btn btn-link" type="submit" name="submit" >Preview CV</button>
                </form>
            </td>
        </tr>
        <%
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
        $('.showdata').click(function () {
            var id = $(this).attr("id");
            $.ajax({
                url: "getData.jsp",
                type: "post",
                data: "uid=" + id,
                success: function (data) {
                    $("#show-data").html(data);

                }
            });
        });
    });
</script>



</html>
