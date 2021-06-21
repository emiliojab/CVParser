/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Accounts;

import DBControl.DBHandler;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author User
 */
public class Delete extends HttpServlet {

    private static Connection con;
    private static PreparedStatement ps;
    private static DBHandler handler;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String id = request.getParameter("hInp");
            
            boolean status = false;
            handler = new DBHandler();
            con = handler.Connect();
            ;
            String query = "DELETE FROM `cvparser`.`users` WHERE `ID` = ?";
            ps = con.prepareStatement(query);
            ps.setString(1, id);
            ps.executeUpdate();
            ps.close();
            con.close();
            response.sendRedirect("Accounts.jsp");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Delete.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Delete.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
