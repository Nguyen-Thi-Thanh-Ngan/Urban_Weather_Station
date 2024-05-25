package main.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JDBCUtil {
    public static Connection getConnection(){
        Connection c = null;

        try {
            DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());

            String url = "jdbc:mysql://localhost:3306/example_practice";
            String username = "root";
            String password = "";

            c = DriverManager.getConnection(url, username, password);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return c;
    }

    public static void closeConnection(Connection c){
        try {
            if(c != null){
                c.close();
            }
        }catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
