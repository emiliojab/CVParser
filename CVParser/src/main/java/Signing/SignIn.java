/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Signing;

import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
/**
 *
 * @author User
 */
public class SignIn extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        Cred cred = new Cred();
        String uname = request.getParameter("uname");
        String psswrd = request.getParameter("psswrd");

        try {
            if (cred.validate(uname, psswrd)) {
                HttpSession session = request.getSession();
                session.setAttribute("username", uname);
                session.setAttribute("password", psswrd);
                session.setAttribute("idUser", cred.getIdUser());
                session.setAttribute("idLog", cred.getIdLog());
                response.sendRedirect("CheckCV.jsp");
            } else {
                request.setAttribute("errorMessage", "Invalid Username or Password");
                RequestDispatcher rd = request.getRequestDispatcher("/SignIn.jsp");
                rd.include(request, response);
            }

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(SignIn.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(SignIn.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
