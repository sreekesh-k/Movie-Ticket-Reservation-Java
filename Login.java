
/*This is The Class that allows Login for users*/
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Scanner;
/*IMPORT STATEMTS */

public class Login {
    private Scanner scanner;
    // scanner declared as a private datamember so that it can be used by all
    // methods

    public Login() {
        this.scanner = new Scanner(System.in);// creates a scanner object when object of this login class is created
    }

    // returns true or false
    public boolean authenticate() {
        // menu
        System.out.println("\tLOGIN");
        System.out.println("__________________________");
        System.out.print("Username:");
        String username = scanner.nextLine();

        System.out.print("Password:");
        String password = scanner.nextLine();

        boolean isAuthenticated = authenticateUser(username, password);// calls the isAuthenticated function that
                                                                       // returns true or false

        if (isAuthenticated) {
            System.out.println("Login successful!");
        } else {
            System.out.println("Invalid username or password. Please try again.");
        }
        System.out.println("Press Enter to continue...");
        scanner.nextLine();

        return isAuthenticated;// return true or false
    }

    // check if user is registered if yes? true : false
    private boolean authenticateUser(String username, String password) {
        try {
            DbConnection dbConnection = new DbConnection("movies_db");// movies_db
            String sql = "SELECT * FROM users WHERE username = ? AND password = ?";
            PreparedStatement preparedStatement = dbConnection.prepareStatement(sql);// prepared statement
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);
            ResultSet result = preparedStatement.executeQuery();

            boolean userExists = result.next();// if 0 rows? false : true
            result.close();
            preparedStatement.close();
            dbConnection.close();// close the db connection
            return userExists;

        } catch (Exception e) {
            System.out.println("Error " + e);
            return false;
        }
    }

    // close the scanner
    public void closeScanner() {
        scanner.close();
    }
}
