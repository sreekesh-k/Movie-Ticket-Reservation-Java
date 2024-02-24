import java.util.Scanner;

public class Main {
    private static Scanner scanner = new Scanner(System.in);
    private static Login login = new Login();
    private static Signup signup = new Signup();

    public static void main(String[] args) {
        boolean exit = false;
        while (!exit) {
            clearScreen();
            System.out.println("      PICTURE PERFECT");
            System.out.println("_____________________________");
            System.out.println("index>");
            System.out.println("_____________________________");
            System.out.println("1. Login\t2. Signup");
            System.out.println("3. Exit");
            System.out.print("Enter Your Choice: ");

            int choice = scanner.nextInt();
            scanner.nextLine();

            switch (choice) {
                case 1:
                    clearScreen();
                    if (login.authenticate())
                        exit = true;
                    break;
                case 2:
                    clearScreen();
                    signup.signUp();
                    break;
                case 3:
                    System.out.println("Exiting...");
                    exit = true; // Exit the loop
                    break;
                default:
                    System.out.println("Invalid choice. Please try again.");
            }
            clearScreen();
            System.out.println("      PICTURE PERFECT");
            System.out.println("_____________________________");
            System.out.println("index>homepage>");
            System.out.println("_____________________________");
            
        }
        scanner.close();
    }

    private static void clearScreen() {
        System.out.print("\033[H\033[2J");
        System.out.flush();
    }
}
