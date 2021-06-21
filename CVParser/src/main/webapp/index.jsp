<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <title>Welcome</title>

        <link href="CustomStyles.css?version=18" rel="stylesheet" type="text/css"/>
    </head>
    <body>
    <nav class="navbar navbar-expand-lg navbar navbar-dark bg-dark sticky-top">
        <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <div class="navbar-nav">
                <a href="#" class="nav-item nav-link active">MyCompany</a>
                <a href="index.jsp" class="nav-item nav-link active">Home</a>
                <a href="Apply.jsp" class="nav-item nav-link">Apply</a>
                <a href="Aboutus.jsp" class="nav-item nav-link">About us</a>
            </div>
            <div class="navbar-nav ml-auto">
                <a href="SignIn.jsp" class="nav-item nav-link"><span class="glyphicon glyphicon-user"></span> Sign In</a>
            </div>
        </div>
    </nav>
    <h1 class="text-dark">Welcome to MyCompany</h1>
    <hr/>
    <br/><br/>
    <div class="container">
        <div class="row">
            <div class="col border-right">
                <p class="lead">MyCompany is a top web design agency and software development company with a large pool of software developers available for dedicated and fixed time/cost projects. Hire web developers from MyCompany who have proven expertise in trending web technologies like PHP, Laravel, Magento, ReactJS, front-end technologies like AngularJS and back-end technologies like Node.js to develop custom and responsive websites, web apps and eCommerce solutions.
                    Our Android app, iOS app and cross-platform mobile app developers are adroit in the latest mobile technologies and tools like Android Studio, Xcode, Kotlin, Xamarin, PhoneGap, React Native, etc. to build next-gen mobile applications.<p>
                <p class="lead"> We deliver web and mobile app development services to global businesses since 1997, with 100% project delivery success. Hire the best programmers at affordable prices. Our design-focused approach and project execution processes help you to deliver the right solutions. </p>
            </div>
            <div class="col border-left">
                <h3 class="text-dark title">Web Design & Development</h3>
                <p class="lead par" >Step into the world of excellence in designing and developing engaging websites.</p>
                <div class="blank-space"></div>
                <h3 class="text-dark title">Mobile App Development</h3>
                <p class="lead par">From concept to design to development, trust us to create powerful mobile apps.</p>
                <div class="blank-space"></div>
                <h3 class="text-dark title">Custom Software Development</h3>
                <p class="lead par">Developing high impact products that are secure, scalable, meaningful and powerful.</p>
                <div class="blank-space"></div>
                <h3 class="text-dark title">UI/UX Design</h3>
                <p class="lead par">An award-winning design agency designing standout experiences for clients.</p>
            </div>
        </div>
    </div>

    <br/>
    <hr/>

    <div class="container">

        <blockquote class="blockquote blockquote-custom p-5 shadow rounded">
            <i class="fa fa-quote-left text-dark"></i>
            <p class="lead par q">
                We are very happy to work with MyCompany. The collaboration goes far beyond a standard IT service: with MyCompany we have a sparring partner that challenges us in our product decisions and is truly passionate about the results developed. The level of professionalism and dedication is exceptional in this industry and we are eager to strengthen our collaboration in the future.
            </p>
            <h5 class="text-dark res mb-4 ">
                <strong>Steve Vai</strong> - CompanyZ, Co-Founder
            </h5>
        </blockquote>
    </div>

    <footer class="py-4 bg-dark text-white-50">
        <div class="container text-center">
            <small> © Copyright 2020 MyCompany, Lebanon </small>
        </div>
    </footer>

</body>
</html>
