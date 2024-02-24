import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Scanner;

public class Movies {
    private Scanner scanner;

    public Movies() {
        this.scanner = new Scanner(System.in);
    }

    public int selectMovie() {
        displayMovies();

        System.out.print("\nPlease enter the ID of the movie you want to Book: ");
        int selectedMovieId = scanner.nextInt();
        scanner.nextLine(); // Consume newline character
        return selectedMovieId;
    }

    private void displayMovies() {
        try {
            DbConnection dbConnection = new DbConnection("movies_db");
            String sql = "SELECT * FROM movies WHERE r_date > '2019-01-01'";
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

                System.out.printf("%d\t%-20s\t%-20s\t%d\n", id, title, genre, releaseYear);
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
