
//this is the class which deals with the confirmation of the ticket and inserting it to db
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.Scanner;
import java.sql.Date;

public class Confirmation {
    private Scanner scanner;
    private int movieId;
    private String userName;

    public Confirmation() {
        this.scanner = new Scanner(System.in);
        this.movieId = Session.getSelectedMovieId();
        this.userName = Session.getUserName();
    }

    public void confirmBooking() {
        System.out.print("\033[H\033[2J");
        System.out.flush();
        List<Integer> selectedSeatIds = Session.getSelectedIds();
        double totalPrice = 0.0;

        System.out.println("You have selected the following seats:");
        for (int i = 0; i < selectedSeatIds.size(); i++) {
            int seatId = selectedSeatIds.get(i);
            double seatPrice = getPriceForSeat(seatId);
            totalPrice += seatPrice;
            System.out.println("Seat ID " + (i + 1) + ": " + seatId + ", Price: Rs." + seatPrice);
        }

        System.out.println("Total Price: Rs." + totalPrice);

        System.out.print("Confirm booking And Pay Rs." + totalPrice + " ?(yes/no): ");
        String choice = scanner.nextLine();

        if (choice.equalsIgnoreCase("yes")) {
            for (Integer seatId : selectedSeatIds) {
                insertIntoBookings(seatId);
            }
            System.out.println("Booking confirmed");
            System.out.println("Press Enter to continue...");
            scanner.nextLine();
        } else if (choice.equalsIgnoreCase("no")) {
            // Clear the session and cancel the booking
            Session.clearSession();
            System.out.println("Booking canceled");
            System.out.println("Press Enter to continue...");
            scanner.nextLine();
        } else {
            System.out.println("Invalid choice. Please enter 'yes' or 'no'.");
        }
    }

    private void insertIntoBookings(Integer seatId) {
        DbConnection dbConnection = new DbConnection("movies_db");
        java.util.Date currentDate = new java.util.Date();
        // Convert java.util.Date to java.sql.Date
        Date sqlDate = new Date(currentDate.getTime());
        try {
            String insertSql = "INSERT INTO bookings (movieid, seatid, username, bookingdate) VALUES (?, ?, ?, ?)";
            PreparedStatement insertStatement = dbConnection.prepareStatement(insertSql);
            insertStatement.setInt(1, movieId);
            insertStatement.setInt(2, seatId); // Insert each seatId from the list
            insertStatement.setString(3, userName);
            insertStatement.setDate(4, sqlDate);
            insertStatement.executeUpdate();

            insertStatement.close();

            dbConnection.close();
        } catch (Exception e) {
            System.out.println("Error inserting into bookings: " + e.getMessage());
        }
    }

    private double getPriceForSeat(int seatId) {
        double price = 0.0;
        try {
            DbConnection dbConnection = new DbConnection("movies_db");
            String sql = "SELECT price FROM seats WHERE seatid = ?";
            PreparedStatement preparedStatement = dbConnection.prepareStatement(sql);
            preparedStatement.setInt(1, seatId);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                price = resultSet.getDouble("price");
            }

            resultSet.close();
            preparedStatement.close();
            dbConnection.close();
        } catch (Exception e) {
            System.out.println("Error fetching price for seat: " + e);
        }
        return price;
    }

}
