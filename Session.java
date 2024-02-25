//trying to implement something like a $_SESSION in php
public class Session {
    private static boolean isLoggedIn = false;
    private static String username = null;
    private static int selectedMovieId = -1;

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

    public static void clearSession() {
        isLoggedIn = false;
        username = null;
        selectedMovieId = -1;
    }
}
