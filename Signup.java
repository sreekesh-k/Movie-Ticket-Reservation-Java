import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Scanner;

public class Signup {
    private Scanner scanner;

    public Signup() {
        this.scanner = new Scanner(System.in);
    }

    public void signUp() {
        System.out.println("\tSIGN UP");
        System.out.println("__________________________");
        System.out.print("Please enter your username:");
        String username = scanner.nextLine();

        System.out.print("Please enter your password:");
        String password = scanner.nextLine();

        System.out.print("Please enter your email ID:");
        String email = scanner.nextLine();

        boolean isRegistered = registerUser(username, password, email);

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
            DbConnection dbConnection = new DbConnection("movies_db");

            // Check if username already exists
            String checkUsernameSql = "SELECT COUNT(*) FROM users WHERE username = ?";
            PreparedStatement checkUsernameStatement = dbConnection.prepareStatement(checkUsernameSql);
            checkUsernameStatement.setString(1, username);
            ResultSet usernameResultSet = checkUsernameStatement.executeQuery();
            usernameResultSet.next();
            int existingUserCount = usernameResultSet.getInt(1);
            usernameResultSet.close();
            checkUsernameStatement.close();

            if (existingUserCount > 0) {
                System.out.println("Username already exists. Please choose a different username.");
                dbConnection.close();
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
