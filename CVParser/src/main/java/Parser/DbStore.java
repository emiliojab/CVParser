/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Parser;

import DBControl.DBHandler;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Message;

/**
 *
 * @author User
 */
public class DbStore {

    private static Connection con;
    private static PreparedStatement ps;
    private static DBHandler handler;

    private static void DbConnect() throws ClassNotFoundException, SQLException {
        handler = new DBHandler();
        con = handler.Connect();

    }

    public static int getIdCount() throws ClassNotFoundException, SQLException {
        DbConnect();
        String select = "Select count(*) from `cvparser`.`appliers`;";
        ps = con.prepareStatement(select);
        ResultSet result = ps.executeQuery();
        int id = 0;
        while (result.next()) {
            id = result.getInt(1);
        }
        ps.clearBatch();
        ps.close();
        con.close();

        return id;
    }

    public static void Store(String fname, String phoneNb, String emailAdd, String spLang, String prLang, String skills, String CV, String message) {
        try {
            DbConnect();

            String insert = "INSERT INTO `cvparser`.`appliers`(`FullName`,`PhoneNb`,`EmailAddress`,`SpLang`, `PrLang`, `Skills`, `CV`, `DateOfAppliance`, `isCandidate`, `Message`)"
                    + "VALUES(?,?,?,?,?,?,?,CURRENT_TIMESTAMP,?,?)";

            ps = con.prepareStatement(insert);
            ps.setString(1, fname);
            ps.setString(2, phoneNb);
            ps.setString(3, emailAdd);
            ps.setString(4, spLang);
            ps.setString(5, prLang);
            ps.setString(6, skills);
            ps.setString(7, CV);

            if (!"N/A".equals(skills) && !"N/A".equals(prLang)) {
                if (skills.split(",").length >= 3 && prLang.split(",").length >= 4) {
                    ps.setBoolean(8, true);
                } else {
                    ps.setBoolean(8, false);
                }
            } else {
                ps.setBoolean(8, false);
            }
            ps.setString(9, message);
            ps.executeUpdate();
            ps.clearBatch();
            ps.close();
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(DbStore.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DbStore.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
