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
        <title>Sign In</title>

        <link href="Signing.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>

        <div class="container">
            <div class="row">
                <div class="col-md-5 mx-auto">
                    <div id="first">
                        <div class="myform form ">
                            <div class="logo mb-3">
                                <div class="col-md-12 text-center">
                                    <h1 class="text-dark">Login</h1>
                                </div>
                            </div>
                            <form action="SignIn" method="post">
                                <div class="form-group">
                                    <label class="lead" for="uName">Username</label>
                                    <input type="text" name="uname"  class="form-control" id="uName" tabindex="1" placeholder="Enter Username" required>
                                </div>
                                <div class="form-group">
                                    <label class="lead" for="password">Password</label>
                                    <input type="password" name="psswrd" id="password"  class="form-control" tabindex="2" placeholder="Enter Password" required>
                                </div>
                                <div class="blank-space">
                                    <div class="form-text text-muted small text-center">
                                        <%
                                            String signup_msg = (String) request.getAttribute("errorMessage");
                                            if (signup_msg != null) {
                                                out.print(signup_msg);
                                            }
                                        %>
                                    </div>
                                </div>
                                <div class="blank-space"></div>
                                <div class="col-md-12 text-center ">
                                    <button type="submit" tabindex="3" class=" btn btn-block mybtn btn-dark tx-tfm"><a href="CheckCV.jsp"></a>Login</button>

                                </div>
                                <br/>


                            </form>
                            <div class="col-md-12 text-center ">
                                <a class="lead"  href="index.jsp"> <strong style="text-decoration: underline;" >Back</strong> </a>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>