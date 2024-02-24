import java.util.Scanner;

public class Main {
    private static Scanner scanner = new Scanner(System.in);
    private static Login login = new Login();
    private static Signup signup = new Signup();

    public static void main(String[] args) {
        clearScreen();
        System.out.println("WELCOME TO PICTURE PERFECT");
        System.out.println("__________________________\n");
        System.out.println("1. Login\t2. Signup");
        System.out.println("3. Exit");
        System.out.print("Enter Your Choice: ");

        int choice = scanner.nextInt();
        scanner.nextLine();

        switch (choice) {
            case 1:
                clearScreen();
                login.authenticate();
                break;
            case 2:
                clearScreen();
                signup.signUp();
                break;
            case 3:
                System.out.println("Exiting...");
                break;
            default:
                System.out.println("Invalid choice. Please try again.");
        }
        System.out.println("SUCCESS");
        scanner.close();
    }

    private static void clearScreen() {
        System.out.print("\033[H\033[2J");
        System.out.flush();
    }
}
