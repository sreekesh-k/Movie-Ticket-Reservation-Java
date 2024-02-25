//trying to implement something like a $_SESSION in php
//status: not yet used in the program
public class Session {
    private static boolean isLoggedIn = false;
    private static int userId = -1;
    private static int selectedMovieId = -1;

    public static boolean isLoggedIn() {
        return isLoggedIn;
    }

    public static void setLoggedIn(boolean loggedIn) {
        isLoggedIn = loggedIn;
    }

    public static int getUserId() {
        return userId;
    }

    public static void setUserId(int userId) {
        Session.userId = userId;
    }

    public static int getSelectedMovieId() {
        return selectedMovieId;
    }

    public static void setSelectedMovieId(int selectedMovieId) {
        Session.selectedMovieId = selectedMovieId;
    }

    public static void clearSession() {
        isLoggedIn = false;
        userId = -1;
        selectedMovieId = -1;
    }
}
