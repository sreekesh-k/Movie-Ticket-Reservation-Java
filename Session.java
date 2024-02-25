
//trying to implement somthing like a $_SESSION[] in php so that i dont have to keep returning the values from each function or class
import java.util.List;

public class Session {
    private static boolean isLoggedIn = false;// login or not
    private static String username = null;// store username
    private static int selectedMovieId = -1;// store the movie id while user is booking
    private static List<Integer> selectedSeatIds = null;// seats selected by the user

    public static boolean isLoggedIn() {
        return isLoggedIn;
    }

    public static void setLoggedIn(boolean loggedIn) {
        isLoggedIn = loggedIn;
    }

    public static String getUserName() {
        return username;
    }

    public static void setUserName(String username) {
        Session.username = username;
    }

    public static int getSelectedMovieId() {
        return selectedMovieId;
    }

    public static void setSelectedMovieId(int selectedMovieId) {
        Session.selectedMovieId = selectedMovieId;
    }

    public static void setSelectedIds(List<Integer> selectedSeatIds) {
        Session.selectedSeatIds = selectedSeatIds;
    }

    public static List<Integer> getSelectedIds() {
        return selectedSeatIds;
    }

    public static void clearSession() {
        isLoggedIn = false;
        username = null;
        selectedMovieId = -1;
    }
}
