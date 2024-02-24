import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

public class Login {
    private Scanner scanner;

    public Login() {
        this.scanner = new Scanner(System.in);
    }

    public boolean authenticate() {
        System.out.println("Please enter your username:");
        String username = scanner.nextLine();

        System.out.println("Please enter your password:");
        String password = scanner.nextLine();

        boolean isAuthenticated = authenticateUser(username, password);

        if (isAuthenticated) {
            System.out.println("Login successful!");
        } else {
            System.out.println("Invalid username or password. Please try again.");
        }

        return isAuthenticated;
    }

    private boolean authenticateUser(String username, String password) {
        try {
            DbConnection dbConnection = new DbConnection("users");
            String sql = "SELECT * FROM users WHERE username = ? AND password = ?";
            PreparedStatement preparedStatement = dbConnection.prepareStatement(sql);
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);
            ResultSet resultSet = preparedStatement.executeQuery();

            boolean userExists = resultSet.next(); 
            resultSet.close();
            preparedStatement.close();
            dbConnection.close();
            return userExists;

        } catch (Exception e) {
            System.out.println("Error " + e);
            return false; 
        }
    }

    public void closeScanner() {
        scanner.close();
    }
}
