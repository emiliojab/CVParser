/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Signing;

import DBControl.DBHandler;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author User
 */
public class Cred {

    private static Connection con;
    private static PreparedStatement ps;
    private static DBHandler handler;
    private static String q1 = "";
    private static String q2 = "";
    private static String q = "";
    private int idUser;
    private int idLog;

    public boolean validate(String username, String pass) throws ClassNotFoundException, SQLException {
        boolean status = false;
        handler = new DBHandler();
        con = handler.Connect();

        q1 = "Select * from `cvparser`.`users` where `UserName` =? and `Password` =?";
        ps = con.prepareStatement(q1);
        ps.setString(1, username);
        ps.setString(2, pass);
        ResultSet result = ps.executeQuery();

        status = result.next();
        if (status) {
            this.idUser = result.getInt("ID");

            System.out.println("sdasdsadsa" + this.idUser);
            ps.clearBatch();

            q = "insert into `cvparser`.`log`(`user_id`, `logged_in`) values(?,CURRENT_TIMESTAMP);";
            ps = con.prepareStatement(q);
            ps.setInt(1, this.idUser);
            ps.executeUpdate();
            ps.clearBatch();

            q2 = "Select `ID` from `cvparser`.`log` where `ID`=(select MAX(`ID`) from `cvparser`.`log`);";
            ps = con.prepareStatement(q2);
            ResultSet res2 = ps.executeQuery();
            while (res2.next()) {
                this.idLog = res2.getInt(1);
            }
            System.out.println("sdasdsadsa" + this.idLog);
            ps.close();
            con.close();
        }
        return status;

    }

    public int getIdUser() {
        return this.idUser;
    }

    public int getIdLog() {
        return this.idLog;
    }

}
