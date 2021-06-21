<%-- 
    Document   : Apply
    Created on : Apr 19, 2020, 2:17:08 AM
    Author     : User
--%>

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
        <title>Sign Up</title>

        <link href="Signing.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //for Http version 1.1
            response.setHeader("Pragma", "no-cache");//for Http version 1.0
            response.setHeader("Expires", "0");//for proxies

            if (session.getAttribute("username") == null || session.getAttribute("password") == null) {
                response.sendRedirect("SignIn.jsp");
            }
        %>
        <div class="container">
            <div class="row">
                <div class="col-md-5 mx-auto">
                    <div id="second">
                        <div class="myform form ">
                            <div class="logo mb-3">
                                <div class="col-md-12 text-center">
                                    <h1 class="text-dark">Sign Up</h1>
                                </div>
                            </div>
                            <form method="post" action="SignUp">
                                <div class="form-group">
                                    <label class="lead" for="fName">First Name</label>
                                    <input tabindex="1" type="text"  name="fname" class="form-control" id="fName" placeholder="Enter Firstname" required autofocus>
                                </div>
                                <div class="form-group">
                                    <label class="lead" for="lName">Last Name</label>
                                    <input tabindex="2" type="text"  name="lname" class="form-control" id="lName" placeholder="Enter Lastname" required>
                                </div>
                                <div class="form-group">
                                    <label class="lead" for="Position">Position</label>
                                    <input tabindex="3" type="text" name="position"  class="form-control" id="Position" placeholder="Enter Username" required> 
                                </div>
                                <div class="form-group">
                                    <label class="lead" for="uName">Username</label>
                                    <input tabindex="4" type="text" name="uname"  class="form-control" id="uName" placeholder="Enter Username" required>
                                </div>
                                <div class="form-group">
                                    <label class="lead" for="password">Password</label>
                                    <input tabindex="5" type="password" name="psswrd" id="password"  class="form-control" placeholder="Enter Password" required>
                                </div>
                                <div class="blank-space">
                                    <div class="form-text text-muted small text-center">
                                        <%
                                            String login_msg = (String) request.getAttribute("errorMessage");
                                            if (login_msg != null) {
                                                out.print(login_msg);
                                            }
                                        %>
                                    </div>
                                </div>
                                <div class="blank-space"></div>
                                <div class="blank-space"></div>
                                <div class="blank-space"></div>
                                <div class="col-md-12 text-center mb-3">
                                    <button tabindex="6" type="submit" class=" btn btn-block mybtn btn-dark " name="signup">Sign Up</button>
                                </div>
                            </form>
                            <div class="col-md-12 text-center ">
                                <a class="lead"  href="CheckCV.jsp"> <strong style="text-decoration: underline;" >Back</strong> </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>