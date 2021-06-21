/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Signing;

import java.io.IOException;
import java.io.PrintWriter;
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
public class SignUp extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");

        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String uname = request.getParameter("uname");
        String psswrd = request.getParameter("psswrd");
        String pos = request.getParameter("position");

        try {
            if (!Register.validate(uname)) {
                Register.reg(fname, lname, pos, uname, psswrd);
                response.sendRedirect("CheckCV.jsp");
            } else {
                request.setAttribute("errorMessage", "Username already exists. Please choose another.");
                RequestDispatcher rd = request.getRequestDispatcher("/SignUp.jsp");
                rd.include(request, response);
            }

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(SignIn.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(SignIn.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
