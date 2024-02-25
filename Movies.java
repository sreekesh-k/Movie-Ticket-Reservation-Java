
/*This is The Class that fetches and displayes movies from the database */
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.InputMismatchException;
import java.util.Scanner;
//IMPORT STATEMENTS

public class Movies {
    private Scanner scanner;
    // scanner declared as a private datamember so that it can be used by all
    // methods

    public Movies() {
        this.scanner = new Scanner(System.in);// creates a scanner object when object of this login class is created
    }

    // method to be called that stores the id of the movie selected in the session
    public void selectMovie() {
        displayMovies();

        int selectedMovieId = -1;

        while (selectedMovieId == -1) {
            System.out.print("\nPlease enter the ID of the movie you want to book: ");
            try {
                selectedMovieId = scanner.nextInt();
                scanner.nextLine();

                if (!isValidMovie(selectedMovieId)) {
                    System.out.println("Invalid movie ID. Please enter a valid ID.");
                    selectedMovieId = -1; // Reset selectedMovieId to prompt user again
                }
            } catch (InputMismatchException e) {
                System.out.println("Invalid input. Please enter a valid ID.");
                scanner.nextLine(); // Consume invalid input
            }
        }

        Session.setSelectedMovieId(selectedMovieId);
    }

    private boolean isValidMovie(int movieId) {
        boolean isValid = false;
        try {
            DbConnection dbConnection = new DbConnection("movies_db");
            String sql = "SELECT * FROM movies WHERE movieid = ? AND r_date > '2019-01-01'";
            PreparedStatement preparedStatement = dbConnection.prepareStatement(sql);
            preparedStatement.setInt(1, movieId);
            ResultSet resultSet = preparedStatement.executeQuery();

            isValid = resultSet.next(); // Check if the ResultSet contains any rows

            resultSet.close();
            preparedStatement.close();
            dbConnection.close();
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
        return isValid;
    }

    private void displayMovies() {
        try {
            DbConnection dbConnection = new DbConnection("movies_db");
            String sql = "SELECT * FROM movies WHERE r_date > '2019-01-01'";// new released movies
            PreparedStatement preparedStatement = dbConnection.prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery();

            System.out.println("\n\tMOVIES\n");
            System.out.println("ID\tTitle\t\t\tGenre\t\t\tRelease Year");
            System.out.println("_____________________________________________________________________________");

            // Iterate over the result set and display each movie
            while (resultSet.next()) {
                int id = resultSet.getInt("movieid");
                String title = resultSet.getString("title");
                String genre = resultSet.getString("genre");
                int releaseYear = resultSet.getInt("r_date");

                System.out.printf("%d\t%-20s\t%-20s\t%d\n", id, title, genre, releaseYear);// decoration and spacing
            }

            resultSet.close();
            preparedStatement.close();
            dbConnection.close();

        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
    }

    public void closeScanner() {
        scanner.close();
    }
}
