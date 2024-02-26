
/*Main program */
import java.util.Scanner;

public class Main {
    private static Scanner scanner = new Scanner(System.in);
    private static String logo = "      PICTURE PERFECT";// logo or brand name
    private static String page = "index>";// this is like something that shows which page or which part you ar on
    private static String line = "\n_____________________________";// decoration

    public static void main(String[] args) {
        boolean exit = false;
        while (!exit) {
            clearScreen();
            System.out.println(logo + line);
            System.out.println(page + line);
            String opt;
            if (Session.isLoggedIn()) {
                opt = "1. logout\n2. View Tickets\n3. Book Tickets\n4. Exit";// if logged in then menu will show logout
            } else {
                opt = "1. Login\n2. Signup\n4. Exit";
            }
            System.out.println(opt);
            System.out.print("Enter Your Choice: ");

            int choice = scanner.nextInt();
            scanner.nextLine();

            switch (choice) {
                case 1:
                    clearScreen();
                    if (Session.isLoggedIn()) {// if logged in then menu will show logout
                        Session.clearSession();
                        System.out.println("Logged out successfully.");
                        System.out.println("Press Enter to continue...");
                        scanner.nextLine();
                    } else {
                        Login login = new Login();
                        login.authenticate();

                    }
                    break;
                case 2:
                    clearScreen();
                    if (Session.isLoggedIn()) {// if logged in then menu will show view ticket
                        viewTicket();
                    } else {
                        Signup signup = new Signup();
                        signup.signUp();
                    }
                    break;
                case 3:
                    if (Session.isLoggedIn()) {
                        movieSelection();
                    } else {
                        System.out.println("Invalid choice. Please try again.");
                        scanner.nextLine();
                    }
                    break;
                case 4:
                    System.out.println("Exiting...");
                    exit = true; // Exit the loop
                    break;
                default:
                    System.out.println("Invalid choice. Please try again.");
                    scanner.nextLine();
                    break;
            }
        }
        scanner.close();
    }

    private static void clearScreen() {
        System.out.print("\033[H\033[2J");
        System.out.flush();
    }

    // displays the movies and askes user to enter the movie id to book
    private static void movieSelection() {
        clearScreen();
        Movies movies = new Movies();
        page += "Home>";// index>home>
        System.out.println(logo + line);
        System.out.println(page + line);
        movies.selectMovie();
        ticketBooking();
        page = "index>";
    }

    // displays the seats avaliable for the movie and lets user choose the seats and
    // confirm the booking and end the process
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
        Bookings bookings = new Bookings();
        bookings.bookSeats();
        page = "index>Home>";
    }

    private static void viewTicket() {
        System.out.println("Hello " + Session.getUserName() + " Your bookings:");
        BookedTickets bookedTickets = new BookedTickets();
        bookedTickets.displayBookedTickets();
    }
}
