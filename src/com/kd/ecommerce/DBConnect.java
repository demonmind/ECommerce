package com.kd.ecommerce;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnect {

    private static Connection conn = null;

    private DBConnect() {

    }

    public static Connection getInstance() {
        if (conn == null) {
            try {
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:8889/ecommerce","username", "1db23");

            } catch (SQLException sqlex) {
                sqlex.printStackTrace();
            } catch(ClassNotFoundException cnfex) {
                cnfex.printStackTrace();
            }
            return conn;
        }
        else {
            return conn;
        }
    }

}
