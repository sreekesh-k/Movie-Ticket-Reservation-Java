import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

class DbConnection {
    Connection con;
    Statement st;

    public DbConnection(String dbname) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + dbname + "?characterEncoding=utf8",
                    "root", "");
            st = con.createStatement();
        } catch (Exception e) {
            System.out.println("Error :" + e);
        }
    }

    public void idu(String sql) {
        try {
            st.executeUpdate(sql);
        } catch (Exception e) {
            System.out.println("Error :" + e);
        }
    }

    public ResultSet select(String sql) {
        ResultSet rs = null;
        try {
            rs = st.executeQuery(sql);
        } catch (Exception e) {
            System.out.println("Error :" + e);
        }
        return rs;
    }
}