package servlets;

import models.Movie;
import services.MySQLDb;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "SearchMovieServlet")
public class SearchMovieServlet extends HttpServlet {

    String error;
    String redirect;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String movieTitle = request.getParameter("movieTitle");

        if(!movieTitle.isEmpty()){
            //System.out.println("Searching for " + movieTitle);
            MySQLDb db = MySQLDb.createInstance();
            String qFetchMovies;
            String parameter;

            qFetchMovies = "SELECT * FROM ratinge.movies WHERE movie_title LIKE CONCAT('%',?,'%') AND gross_income > 0";
            parameter = movieTitle;
            List<Movie> movies = db.getMovies(qFetchMovies, parameter);

            for(Movie m : movies){
                System.out.println(m.getId() + " " + m.getTitle());
            }

            redirect = "search.jsp";
            request.setAttribute("listOfMovies", movies);
            request.setAttribute("movieTitle", movieTitle);
        }
        else{
            error = "Please enter a movie title to search for";
            redirect = "index.jsp";
            request.setAttribute("error", error);
        }

        RequestDispatcher requestDispatcher = request.getRequestDispatcher(redirect);
        requestDispatcher.forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
