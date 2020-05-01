package services;

import models.Movie;
import models.UserModel;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MySQLDb {

    private Connection connection = null;
    private static MySQLDb instance = null;
    String url = "jdbc:mysql://localhost:3306/ratinge";
    String username = "root";
    String password = "123456";

    public MySQLDb() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(url,username,password);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static synchronized MySQLDb createInstance(){
        if (instance == null){
            instance = new MySQLDb();
        }

        return instance;
    }


    public boolean registerUser(UserModel user) {

        String qRegisterUser = "INSERT INTO user VALUES (default, ?,?,?,?)";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(qRegisterUser);
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getUserName());
            preparedStatement.setString(4, user.getPassword());
            preparedStatement.executeUpdate();
            preparedStatement.close();

            return true;

        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return false;
        }
    }

    public UserModel loginUser(String userName, String ePassword) {

        UserModel userModel = null;
        try {
            String qLoginUser = "SELECT * from user WHERE user_name = ? AND password = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(qLoginUser);
            preparedStatement.setString(1, userName);
            preparedStatement.setString(2, ePassword);
            ResultSet resultSet = preparedStatement.executeQuery();
            if(resultSet.next()){
                int dUserId = resultSet.getInt("user_id");
                String dName = resultSet.getString("name");
                String dEmail = resultSet.getString("email");
                String dUserName = resultSet.getString("user_name");
                userModel = new UserModel(dUserId, dName, dEmail, dUserName);
            }
            preparedStatement.close();
            resultSet.close();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return userModel;

    }

    public List<Movie> getMovies(String qFetchMovies, String parameter) {

        List<Movie> movies = new ArrayList<>();

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(qFetchMovies);
            preparedStatement.setString(1, parameter);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int d_id = resultSet.getInt("movie_id");
                String d_title = resultSet.getString("movie_title");
                double d_rating  = resultSet.getFloat("movie_rating");
                String d_genres  = resultSet.getString("genres");
                String d_runningTime = resultSet.getString("running_time");
                String d_directors  = resultSet.getString("directors");
                String d_writers  = resultSet.getString("writers");
                String d_cast  = resultSet.getString("cast");
                String d_plot  = resultSet.getString("plot");
                int d_grossIncome  = resultSet.getInt("gross_income");

                Movie movie = new Movie(d_id,d_title,d_rating,d_genres,d_runningTime,d_directors,d_writers,d_cast,d_plot,d_grossIncome);
                movies.add(movie);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return movies;
    }

    public List<Movie> getMovies(String qStatement) {
        List<Movie> movies = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(qStatement);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int d_id = resultSet.getInt("movie_id");
                String d_title = resultSet.getString("movie_title");
                double d_rating  = resultSet.getFloat("movie_rating");
                String d_genres  = resultSet.getString("genres");
                String d_runningTime = resultSet.getString("running_time");
                String d_directors  = resultSet.getString("directors");
                String d_writers  = resultSet.getString("writers");
                String d_cast  = resultSet.getString("cast");
                String d_plot  = resultSet.getString("plot");
                int d_grossIncome  = resultSet.getInt("gross_income");

                Movie movie = new Movie(d_id,d_title,d_rating,d_genres,d_runningTime,d_directors,d_writers,d_cast,d_plot,d_grossIncome);
                movies.add(movie);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return movies;
    }

    public int wishlistMovie(int userId, int movieId) {
        try {

            String qWishlistMoviePresent = "SELECT * FROM ratinge.wishlist WHERE user_id = ? AND movie_id = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(qWishlistMoviePresent);
            preparedStatement.setInt(1, userId);
            preparedStatement.setInt(2, movieId);
            ResultSet resultSet = preparedStatement.executeQuery();
            if(resultSet.next()){
                return 2;
            }
            else{
                String qAddWishlistMovie = "INSERT INTO wishlist VALUES (?,?)";
                preparedStatement = connection.prepareStatement(qAddWishlistMovie);
                preparedStatement.setInt(1, userId);
                preparedStatement.setInt(2, movieId);
                preparedStatement.executeUpdate();
            }

            return 1;

        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return 0;
        }
    }

    public List<Movie> getWishListedMovies(int userId) {

        List<Movie> movies = new ArrayList<>();
        try {
            String qFetchWishlistedMovies = "SELECT * FROM ratinge.movies m, ratinge.wishlist w WHERE user_id=? AND m.movie_id = w.movie_id";
            PreparedStatement preparedStatement = connection.prepareStatement(qFetchWishlistedMovies);
            preparedStatement.setInt(1, userId);

            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int d_id = resultSet.getInt("movie_id");
                String d_title = resultSet.getString("movie_title");
                double d_rating  = resultSet.getFloat("movie_rating");
                String d_genres  = resultSet.getString("genres");
                String d_runningTime = resultSet.getString("running_time");
                String d_directors  = resultSet.getString("directors");
                String d_writers  = resultSet.getString("writers");
                String d_cast  = resultSet.getString("cast");
                String d_plot  = resultSet.getString("plot");
                int d_grossIncome  = resultSet.getInt("gross_income");

                Movie movie = new Movie(d_id,d_title,d_rating,d_genres,d_runningTime,d_directors,d_writers,d_cast,d_plot,d_grossIncome);
                movies.add(movie);
            }
            preparedStatement.close();
            resultSet.close();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return movies;

    }

    public List<Movie> getXmlMovieRatings() {
        List<Movie> movieRatingList = new ArrayList<>();
        try {
            String qFetchXmlRatings = "SELECT * FROM ratinge.movies ORDER BY movie_rating DESC";
            PreparedStatement preparedStatement = connection.prepareStatement(qFetchXmlRatings);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int d_id = resultSet.getInt("movie_id");
                String d_title = resultSet.getString("movie_title");
                double d_rating  = resultSet.getFloat("movie_rating");
                Movie movie = new Movie(d_id,d_title,d_rating);
                movieRatingList.add(movie);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return movieRatingList;
    }

    public Movie getMovie(int movieId) {
        Movie movie = null;
        try {
            String qFetchMovieDetails = "SELECT * FROM ratinge.movies Where movie_id=?";
            PreparedStatement preparedStatement = connection.prepareStatement(qFetchMovieDetails);
            preparedStatement.setInt(1, movieId);
            ResultSet resultSet = preparedStatement.executeQuery();
            if(resultSet.next()){
                int d_id = resultSet.getInt("movie_id");
                String d_title = resultSet.getString("movie_title");
                double d_rating  = resultSet.getFloat("movie_rating");
                String d_genres  = resultSet.getString("genres");
                String d_runningTime = resultSet.getString("running_time");
                String d_directors  = resultSet.getString("directors");
                String d_writers  = resultSet.getString("writers");
                String d_cast  = resultSet.getString("cast");
                String d_plot  = resultSet.getString("plot");
                int d_grossIncome  = resultSet.getInt("gross_income");

                movie = new Movie(d_id,d_title,d_rating,d_genres,d_runningTime,d_directors,d_writers,d_cast,d_plot,d_grossIncome);
            }
            preparedStatement.close();
            resultSet.close();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return movie;
    }

    public boolean updateRaing(double movieRating,int movieId) {

        try {
            String qUpdateMovieRating = "UPDATE movies SET movie_rating = ? WHERE movie_id = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(qUpdateMovieRating);
            preparedStatement.setDouble(1, movieRating);
            preparedStatement.setDouble(2, movieId);

            preparedStatement.executeUpdate();
            preparedStatement.close();

            return true;

        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return false;
        }
    }
}
