
/*This is The Class that aloows booking based on the movie id selected */
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Bookings {
    int movieId;

    public Bookings() {
        this.movieId = Session.getSelectedMovieId();
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

}
