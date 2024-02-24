import java.util.Scanner;

public class Main {
    private static Scanner scanner = new Scanner(System.in);
    private static Login login = new Login();
    private static Signup signup = new Signup();
    private static Movies movies = new Movies();
    private static Bookings bookings = new Bookings();

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
        System.out.println("      PICTURE PERFECT");
        System.out.println("_____________________________");
        System.out.println("index>Home>");
        System.out.println("_____________________________");
        int selectedMovieId = movies.selectMovie();

        return selectedMovieId;
    }

    private static void ticketBooking(int selectedMovieId) {
        clearScreen();
        System.out.println("      PICTURE PERFECT");
        System.out.println("_____________________________");
        String title = bookings.getMovieName(selectedMovieId);
        System.out.println("index>Home>" + title + ">");
        System.out.println("_____________________________");
    }
}
