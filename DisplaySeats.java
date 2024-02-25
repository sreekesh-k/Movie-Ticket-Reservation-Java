
/*This is The Class that displays seats based on the movie id selected */
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Scanner;

public class DisplaySeats {
    int movieId;
    Scanner scanner;

    public DisplaySeats() {
        this.movieId = Session.getSelectedMovieId();
        this.scanner = new Scanner(System.in);
    }

    public String getMovieName() {
        String movieName = null;

        try {

            DbConnection dbConnection = new DbConnection("movies_db");
            String sql = "SELECT title FROM movies WHERE movieid = ?";
            PreparedStatement preparedStatement = dbConnection.prepareStatement(sql);
            preparedStatement.setInt(1, movieId);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                movieName = resultSet.getString("title");
            }

            resultSet.close();
            preparedStatement.close();
            dbConnection.close();
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }

        return movieName;
    }

    public void displayAvailableSeats() {
        DbConnection dbConnection = new DbConnection("movies_db");
        try {
            String sql = "SELECT * FROM seats";
            PreparedStatement preparedStatement = dbConnection.prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery();
            System.out.printf("%-10s %s\n", "Seat ID", "Status(Available/Booked)");
            System.out.println("-------------------------------");

            // Display first 120 seats as a 6x20 matrix
            int count = 1;
            while (resultSet.next()) {
                int seatId = resultSet.getInt("seatid");
                String seatNo = resultSet.getString("seatno");
                // Check if the seat is booked
                boolean isBooked = isSeatBooked(seatId);
                String status = isBooked ? "B" : "A";
                System.out.print(seatId + "-" + status);
                count++;
                if (count % 20 == 1) {
                    System.out.println(); // Move to the next line after every 20 seats
                } else {
                    System.out.print("\t"); // Add a tab after each seat
                }
            }
            resultSet.close();
            preparedStatement.close();
            dbConnection.close();
        } catch (Exception e) {
            System.out.println("Error fetching seat information: " + e);
        }
    }

    private boolean isSeatBooked(int seatId) {
        DbConnection dbConnection = new DbConnection("movies_db");
        try {
            String sql = "SELECT COUNT(*) AS count FROM bookings WHERE movieid = ? AND seatid = ?";
            PreparedStatement preparedStatement = dbConnection.prepareStatement(sql);
            preparedStatement.setInt(1, movieId);
            preparedStatement.setInt(2, seatId);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                int count = resultSet.getInt("count");
                return count > 0;
            }

            resultSet.close();
            preparedStatement.close();
            dbConnection.close();
        } catch (Exception e) {
            System.out.println("Error checking seat booking status: " + e);
        }
        return false;
    }

}
