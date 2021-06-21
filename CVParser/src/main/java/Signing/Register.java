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
public class Register {

    private static Connection con;
    private static PreparedStatement ps;
    private static DBHandler handler;

    public static boolean validate(String username) throws ClassNotFoundException, SQLException {
        boolean status = false;
        handler = new DBHandler();
        con = handler.Connect();

        String query = "Select * from `cvparser`.`users` where `UserName` =?";
        ps = con.prepareStatement(query);
        ps.setString(1, username);;
        ResultSet result = ps.executeQuery();

        status = result.next();
        ps.close();
        con.close();
        return status;
    }

    public static void reg(String fname, String lname, String pos, String uname, String password) throws ClassNotFoundException, SQLException {
        handler = new DBHandler();
        con = handler.Connect();

        String query = "INSERT INTO `cvparser`.`users`(`FirstName`,`LastName`,`Position`,`UserName`, `Password`)"
                + "VALUES(?,?,?,?,?)";

        ps = con.prepareStatement(query);
        ps.setString(1, fname);
        ps.setString(2, lname);
        ps.setString(3, pos);
        ps.setString(4, uname);
        ps.setString(5, password);
        ps.executeUpdate();
        ps.close();
        con.close();

    }
}
