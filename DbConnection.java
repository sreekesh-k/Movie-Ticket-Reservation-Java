
/*This is The Class that allows connection to database */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
/*IMPORT STATEMTS */

public class DbConnection {
    private Connection con;// connection object
    private Statement st;// statement obj

    public DbConnection(String dbname) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + dbname + "?characterEncoding=utf8",
                    "root", "");// connect to db
            st = con.createStatement();// allow statements into the db
        } catch (Exception e) {
            System.out.println("Error :" + e);
        }
    }

    public void idu(String sql) {
        try {
            st.executeUpdate(sql);// insert,delete,update query (doesnt return any values)
        } catch (Exception e) {
            System.out.println("Error :" + e);
        }
    }

    public ResultSet select(String sql) {
        ResultSet rs = null;// to store the result from the select query
        try {
            rs = st.executeQuery(sql);// select query (returns any rows)
        } catch (Exception e) {
            System.out.println("Error :" + e);
        }
        return rs;
    }

    // function to work with prepared statement
    public PreparedStatement prepareStatement(String sql) throws Exception {
        return con.prepareStatement(sql);// returns a prepared statement with respect to the connection
    }

    // function to close the connection established to db
    public void close() {
        try {
            if (st != null) {
                st.close();
            }
            if (con != null) {
                con.close();
            }
        } catch (SQLException e) {
            System.out.println("Error closing database connection: " + e);
        }
    }
}
