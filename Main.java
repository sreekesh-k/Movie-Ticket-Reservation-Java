
/*Main program */
import java.util.Scanner;

public class Main {
    private static Scanner scanner = new Scanner(System.in);
    private static String logo = "      PICTURE PERFECT";
    private static String page = "index>";
    private static String line = "\n_____________________________";

    public static void main(String[] args) {
        boolean exit = false;
        while (!exit) {
            clearScreen();
            System.out.println(logo + line);
            System.out.println(page + line);
            System.out.println("1. Login\n2. Signup");
            System.out.println("3. Exit");
            System.out.print("Enter Your Choice: ");

            int choice = scanner.nextInt();
            scanner.nextLine();

            switch (choice) {
                case 1:
                    clearScreen();
                    Login login = new Login();
                    login.authenticate();
                    if (Session.isLoggedIn()) {
                        movieSelection();
                        exit = true;
                    }
                    break;
                case 2:
                    clearScreen();
                    Signup signup = new Signup();
                    signup.signUp();
                    break;
                case 3:
                    System.out.println("Exiting...");
                    exit = true; // Exit the loop
                    break;
                default:
                    System.out.println("Invalid choice. Please try again.");
            }
        }
        scanner.close();
    }

    private static void clearScreen() {
        System.out.print("\033[H\033[2J");
        System.out.flush();
    }

    private static void movieSelection() {
        clearScreen();
        Movies movies = new Movies();
        page += "Home>";
        System.out.println(logo + line);
        System.out.println(page + line);
        movies.selectMovie();
        ticketBooking();
    }

    private static void ticketBooking() {
        clearScreen();
        DisplaySeats displaySeats = new DisplaySeats();
        String title = displaySeats.getMovieName();
        page += title;
        System.out.println(logo + line);
        System.out.println(page + line);
        String username = Session.getUserName();
        System.out.println(username + " Please selecte your seats for the movie " + title);
        displaySeats.displayAvailableSeats();
    }
}
