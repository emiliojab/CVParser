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
        <title>Apply</title>
        <link href="Apply.css?version=7" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar navbar-dark bg-dark sticky-top">
            <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <div class="navbar-nav">
                    <a href="#" class="nav-item nav-link active">MyCompany</a>
                    <a href="index.jsp" class="nav-item nav-link">Home</a>
                    <a href="Apply.jsp" class="nav-item nav-link active" >Apply</a>
                    <a href="Aboutus.jsp" class="nav-item nav-link">About us</a>
                </div>
                <div class="navbar-nav ml-auto">
                    <a href="SignIn.jsp" class="nav-item nav-link"><span class="glyphicon glyphicon-user"></span> Sign In</a>
                </div>
            </div>
        </nav>
        <h1 class="text-dark">We are hiring! – Software developer</h1>
        <hr/>

        <div class="row">
            <div class="cont">
                <p class="lead">This is an exciting opportunity to join the MyCompany team in a crucial moment for our company. MyCompany is now developing the software infrastructure of our system: a front end customer interface able to collect data from various instruments around the world, a database of all the data collected, software able to discriminate and analyse data using Chemometrics / Machine Learning techniques and finally a system able to display the results of the analysis.</p>

            </div>
        </div>
        <div class="blank-space"></div>
        <div class="blank-space"></div>
        <div class="container " >
            <h1 class="text-dark">Send us your CV</h1>

            <form id="contact" action="upload" method="post" enctype="multipart/form-data">
                <fieldset>
                    <input class="form-control" placeholder="First Name" type="text" tabindex="1"  pattern="[a-zA-Z]+\s*[a-zA-z]*" name="fname" title="No characters and only one internal white space, e.g Mary or Mary Jane" required autofocus>
                </fieldset>
                <fieldset>
                    <input class="form-control" placeholder="Last Name" type="text" name="lname" tabindex="2"  pattern="[a-zA-Z]+\s*[a-zA-z]*" title="No characters and only one internal white space, e.g smith or Smith Jacobs" required>
                </fieldset>
                <fieldset>
                    <div class="custom-file">
                        <input class="custom-file-input" type="file"  id="file" name="file" accept="application/pdf" tabindex="3" title ="Upload only as PDF file" required>
                        <label class="custom-file-label" for="file">Upload CV</label>
                    </div>
                </fieldset>

                <fieldset>
                    <textarea name="message" class="form-control" placeholder="Type your message here.... (Only 250 charachters)" maxlength="250" tabindex="4"></textarea>
                </fieldset>
                <fieldset>
                    <button class="btn btn-dark" name="submit" type="submit" id="contact-submit" tabindex="5" data-submit="...Sending"><a href="Submitted.jsp"></a>Submit</button>
                </fieldset>
            </form>
        </div>
    </body>
</html>