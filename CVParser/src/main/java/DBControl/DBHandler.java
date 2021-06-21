package DBControl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class DBHandler extends Configs {

    public Connection Connect() throws ClassNotFoundException, SQLException {
        Properties prop = new Properties();
        prop.setProperty("user", dbUser);
        prop.setProperty("password", dbPass);
        prop.setProperty("useSSL", "false");
        prop.setProperty("autoReconnect", "true");

        String connectionString = "jdbc:mysql://" + dbHost + ":" + dbPort + "/" + dbName;

        Class.forName("com.mysql.jdbc.Driver");

        Connection con = DriverManager.getConnection(connectionString, prop);

        return con;

    }

}
