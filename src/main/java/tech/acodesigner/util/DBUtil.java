package tech.acodesigner.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Created by 77239 on 2017/2/5/0005.
 */
public class DBUtil {
    public static Connection getCon() throws ClassNotFoundException, SQLException {
        Class.forName(PropertiesUtil.getValue("jdbcName"));
        Connection conn = DriverManager.getConnection(
                PropertiesUtil.getValue("dbUrl"),
                PropertiesUtil.getValue("dbUserName"),
                PropertiesUtil.getValue("dbPassword")
        );
        return conn;
    }

    public static void closeCon(Connection con) throws SQLException {
        if (con != null) {
            con.close();
            con = null;
        }
    }

    public static void main(String[] args) throws SQLException, ClassNotFoundException {
        Connection conn = DBUtil.getCon();
        if (conn != null) {
            System.out.println("success");
        }
    }
}
