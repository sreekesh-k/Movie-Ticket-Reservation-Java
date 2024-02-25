
// BookedTickets.java
/*
 * "SELECT m.title AS movie_title, COUNT(b.seatid) AS num_seats, SUM(s.price) AS
 * total_paid, MIN(b.bookingdate) AS booking_date
 * FROM bookings b
 * JOIN movies m ON b.movieid = m.movieid
 * JOIN seats s ON b.seatid = s.seatid
 * WHERE b.username = (SELECT username FROM users WHERE username = '$username')
 * GROUP BY m.title"
 * displa it
 */
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Scanner;

public class BookedTickets {
    Scanner scanner;

    public BookedTickets() {
        this.scanner = new Scanner(System.in);
    }

    public void displayBookedTickets() {
        if (Session.isLoggedIn()) {
            String username = Session.getUserName();
            DbConnection dbConnection = new DbConnection("movies_db");
            try {
                String sql = "SELECT m.title AS movie_title, COUNT(b.seatid) AS num_seats, SUM(s.price) AS total_paid, MIN(b.bookingdate) AS booking_date "
                        +
                        "FROM bookings b " +
                        "JOIN movies m ON b.movieid = m.movieid " +
                        "JOIN seats s ON b.seatid = s.seatid " +
                        "WHERE b.username = (SELECT username FROM users WHERE username = ?) " +
                        "GROUP BY m.title";
                PreparedStatement preparedStatement = dbConnection.prepareStatement(sql);
                preparedStatement.setString(1, username);
                ResultSet resultSet = preparedStatement.executeQuery();

                while (resultSet.next()) {
                    String movieTitle = resultSet.getString("movie_title");
                    int numSeats = resultSet.getInt("num_seats");
                    double totalPaid = resultSet.getDouble("total_paid");
                    Date bookingDate = resultSet.getDate("booking_date");

                    System.out.println("Movie: " + movieTitle);
                    System.out.println("Number of Seats: " + numSeats);
                    System.out.println("Total Paid: " + totalPaid);
                    System.out.println("Booking Date: " + bookingDate);
                    System.out.println("-------------------------");
                }
                System.out.println("Press Enter to continue...");
                scanner.nextLine();
                resultSet.close();
                preparedStatement.close();
                dbConnection.close();
            } catch (Exception e) {
                System.out.println("Error fetching booked tickets: " + e.getMessage());
            }
        } else {
            System.out.println("You need to be logged in to view booked tickets.");
        }
    }
}
