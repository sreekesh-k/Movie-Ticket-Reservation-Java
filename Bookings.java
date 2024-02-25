
/*This is The Class that aloows booking based on the movie id selected */
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class Bookings {
    int movieId;
    Scanner scanner;

    public Bookings() {
        this.movieId = Session.getSelectedMovieId();// movie id from the sessiom(which movie is the user going to book)
        this.scanner = new Scanner(System.in);
    }

    public void bookSeats() {
        int totalSeats = 0;
        int availableSeats = 0;
        DbConnection dbConnection = new DbConnection("movies_db");
        try {

            String sql = "SELECT COUNT(*) AS total FROM seats";
            PreparedStatement preparedStatement = dbConnection.prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery();
            // total seats
            if (resultSet.next()) {
                totalSeats = resultSet.getInt("total");
            }

            sql = "SELECT seatid FROM seats WHERE seatid NOT IN (SELECT seatid FROM bookings WHERE movieid = ?)";
            preparedStatement = dbConnection.prepareStatement(sql);
            preparedStatement.setInt(1, movieId);
            resultSet = preparedStatement.executeQuery();
            // available seats
            List<Integer> availableSeatIds = new ArrayList<>();
            while (resultSet.next()) {
                availableSeatIds.add(resultSet.getInt("seatid"));
            }

            resultSet.close();
            preparedStatement.close();
            dbConnection.close();

            availableSeats = availableSeatIds.size();

            System.out.println("Total Available Seats: " + availableSeats + " out of " + totalSeats);
            System.out.print("Enter the number of seats you want to book: ");
            int numSeatsToBook = scanner.nextInt();

            if (numSeatsToBook <= 0 || numSeatsToBook > availableSeats) {
                System.out.println("Invalid number of seats. Please try again.");
                return;
            }

            // Select numSeatsToBook seats from availableSeatIds list
            List<Integer> selectedSeatIds = new ArrayList<>();
            System.out.println("Please select " + numSeatsToBook + " seats:");
            for (int i = 0; i < numSeatsToBook; i++) {
                System.out.print("Enter seat ID " + (i + 1) + ": ");
                int selectedSeatId = scanner.nextInt();
                if (availableSeatIds.contains(selectedSeatId)) {
                    selectedSeatIds.add(selectedSeatId);
                    availableSeatIds.remove(Integer.valueOf(selectedSeatId));
                    // remove the selected seat from available seats
                } else {
                    System.out.println("Invalid seat ID. Please select an available seat.");
                    i--; // decremen i to show the same seat
                }
            }
            Session.setSelectedIds(selectedSeatIds);
            Confirmation confirmation = new Confirmation();
            confirmation.confirmBooking();
        } catch (Exception e) {
            System.out.println("Error fetching seat information: " + e);
        }

    }
}
