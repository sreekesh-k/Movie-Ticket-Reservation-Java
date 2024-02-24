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

        // Replace this with actual authentication logic
        boolean isAuthenticated = authenticateUser(username, password);

        if (isAuthenticated) {
            System.out.println("Login successful!");
        } else {
            System.out.println("Invalid username or password. Please try again.");
        }

        return isAuthenticated;
    }

    private boolean authenticateUser(String username, String password) {
        // Simulate authentication logic (replace with actual database lookup)
        return username.equals("admin") && password.equals("password");
    }

    public void closeScanner() {
        scanner.close();
    }
}
