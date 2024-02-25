import java.util.List;
import java.util.Scanner;

public class Confirmation {
    private Scanner scanner;
    private int movieId;

    public Confirmation() {
        this.scanner = new Scanner(System.in);
        this.movieId = Session.getSelectedMovieId();
    }

    public void confirmBooking() {
        List<Integer> selectedSeatIds = Session.getSelectedIds();
        System.out.println("You have selected the following seats:");
        for (int i = 0; i < selectedSeatIds.size(); i++) {
            System.out.println("Seat ID " + (i + 1) + ": " + selectedSeatIds.get(i));
        }

        System.out.print("Confirm booking? (yes/no): ");
        String choice = scanner.nextLine();

        if (choice.equalsIgnoreCase("yes")) {
            // Insert selected seats into bookings table
            // You need to implement this part based on your database schema
            // After successful insertion, clear the session
            // Example:
            // insertIntoBookings(selectedSeatIds);
            Session.clearSession();
            System.out.println("Booking confirmed");
        } else if (choice.equalsIgnoreCase("no")) {
            // Clear the session and cancel the booking
            Session.clearSession();
            System.out.println("Booking canceled");
        } else {
            System.out.println("Invalid choice. Please enter 'yes' or 'no'.");
        }
    }

    // You need to implement this method based on your database schema
    // private void insertIntoBookings(List<Integer> selectedSeatIds) {
    // Implement insertion logic here
    // }
}
