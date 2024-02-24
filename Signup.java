import java.sql.PreparedStatement;
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
    }

    private boolean registerUser(String username, String password, String email) {
        try {
            DbConnection dbConnection = new DbConnection("movies_db");
            String sql = "INSERT INTO users (username, password, emailid) VALUES (?, ?, ?)";
            PreparedStatement preparedStatement = dbConnection.prepareStatement(sql);
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);
            preparedStatement.setString(3, email);

            int rowsAffected = preparedStatement.executeUpdate();

            preparedStatement.close();
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
