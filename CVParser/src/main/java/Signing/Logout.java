/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Signing;

import DBControl.DBHandler;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Logout extends HttpServlet {

    private  Connection con;
    private  PreparedStatement ps;
    private  DBHandler handler;
    private  String q1 = "";
    private  String q2 = "";
    private  int idUser;
    private  int idLog;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        try {
            handler = new DBHandler();
            con = handler.Connect();
            idUser = (int) session.getAttribute("idUser");
            idLog = (int) session.getAttribute("idLog");
            q1 = "update `cvparser`.`log` set `logged_out`=CURRENT_TIMESTAMP where `ID`=? and `user_id`=?;";
            ps = con.prepareStatement(q1);
            ps.setInt(1, idLog);
            ps.setInt(2, idUser);
            ps.executeUpdate();
            ps.clearBatch();
            
            session.removeAttribute("username");
            session.removeAttribute("password");
            session.removeAttribute("idUser");
            session.removeAttribute("idLog");
            session.invalidate();
            response.sendRedirect("index.jsp");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Logout.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Logout.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
