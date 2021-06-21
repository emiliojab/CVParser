<%-- 
    Document   : CVPreview
    Created on : May 26, 2020, 6:19:14 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CV preview</title>
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
        <object data="${pageContext.request.contextPath}" 
                type="application/pdf" width="500" height="300">
            <a href="${pageContext.request.contextPath}">Download file.pdf</a>
        </object>
    </body>
</html>
