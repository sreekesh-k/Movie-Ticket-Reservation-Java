
/*This is The Class that allows signup for users*/
/*same as login */
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Scanner;
/*IMPORT STATEMTS */

public class Signup {
    private Scanner scanner;// scanner declared as a private datamember so that it can be used by all
    // methods

    public Signup() {
        this.scanner = new Scanner(System.in);// creates a scanner object when object of this login class is created
    }

    public void signUp() {
        // menu
        System.out.println("\tSIGN UP");
        System.out.println("__________________________");
        System.out.print("Username:");
        String username = scanner.nextLine();

        System.out.print("Password:");
        String password = scanner.nextLine();

        System.out.print("email ID:");
        String email = scanner.nextLine();

        boolean isRegistered = registerUser(username, password, email);// call the isRegistered method that return true
                                                                       // or false

        if (isRegistered) {
            System.out.println("Registration successful!");
        } else {
            System.out.println("Error registering user. Please try again.");
        }
        System.out.println("Press Enter to continue...");
        scanner.nextLine();
    }

    private boolean registerUser(String username, String password, String email) {
        try {
            DbConnection dbConnection = new DbConnection("movies_db");// movies_db

            // Check if username already exists
            String checkUsernameSql = "SELECT * FROM users WHERE username = ?";
            PreparedStatement checkUsernameStatement = dbConnection.prepareStatement(checkUsernameSql);// preparedstatement
            checkUsernameStatement.setString(1, username);
            ResultSet usernameResultSet = checkUsernameStatement.executeQuery();
            boolean userExists = usernameResultSet.next();// if 0 rows? false : true
            usernameResultSet.close();
            checkUsernameStatement.close();

            if (userExists) {
                System.out.println("Username/email already registered. Please choose a different username.");
                dbConnection.close();// close the db connection
                return false;
            }

            // Register the user
            String insertUserSql = "INSERT INTO users (username, password, emailid) VALUES (?, ?, ?)";
            PreparedStatement insertUserStatement = dbConnection.prepareStatement(insertUserSql);
            insertUserStatement.setString(1, username);
            insertUserStatement.setString(2, password);
            insertUserStatement.setString(3, email);
            int rowsAffected = insertUserStatement.executeUpdate();

            insertUserStatement.close();
            dbConnection.close();

            return rowsAffected > 0; // Returns true if at least one row is affected (user is registered)
        } catch (Exception e) {
            System.out.println("Error " + e);
            return false;
        }
    }

    public void closeScanner() {
        scanner.close();
    }
}
