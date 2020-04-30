package models;

public class Movie {

    int id;
    String title;
    double rating;
    String genres;
    String runningTime;
    String directors;
    String writers;
    String cast;
    String plot;
    int grossIncome;

    public Movie(int id, String title, double rating, String genres, String runningTime, String directors, String writers, String cast, String plot, int grossIncome) {
        this.id = id;
        this.title = title;
        this.rating = rating;
        this.genres = genres;
        this.runningTime = runningTime;
        this.directors = directors;
        this.writers = writers;
        this.cast = cast;
        this.plot = plot;
        this.grossIncome = grossIncome;
    }

    public Movie(int id, String title, double rating) {
        this.id = id;
        this.title = title;
        this.rating = rating;
    }

    public int getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }

    public double getRating() {
        return rating;
    }

    public String getGenres() {
        return genres;
    }

    public String getRunningTime() {
        return runningTime;
    }

    public String getDirectors() {
        return directors;
    }

    public String getWriters() {
        return writers;
    }

    public String getCast() {
        return cast;
    }

    public String getPlot() {
        return plot;
    }

    public int getGrossIncome() {
        return grossIncome;
    }
}
