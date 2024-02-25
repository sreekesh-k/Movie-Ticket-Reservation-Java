
/*Main program */
import java.util.Scanner;

public class Main {
    private static Scanner scanner = new Scanner(System.in);
    private static Login login = new Login();
    private static Signup signup = new Signup();
    private static Movies movies = new Movies();
    private static Bookings bookings = new Bookings();
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
                    if (login.authenticate()) {
                        int selectedMovieId = movieSelection();
                        ticketBooking(selectedMovieId);
                        exit = true;
                    }
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
        }
        scanner.close();
    }

    private static void clearScreen() {
        System.out.print("\033[H\033[2J");
        System.out.flush();
    }

    private static int movieSelection() {
        clearScreen();
        page += "Home>";
        System.out.println(logo + line);
        System.out.println(page + line);
        int selectedMovieId = movies.selectMovie();

        return selectedMovieId;
    }

    private static void ticketBooking(int selectedMovieId) {
        clearScreen();
        String title = bookings.getMovieName(selectedMovieId);
        page += title;
        System.out.println(logo + line);
        System.out.println(page + line);
        System.out.println("Select your seats:");
    }
}
