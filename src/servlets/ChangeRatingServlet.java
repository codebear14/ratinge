package servlets;

import services.MySQLDb;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ChangeRatingServlet")
public class ChangeRatingServlet extends HttpServlet {

    String error = "Please enter a valid rating between 0-10";
    String message;
    String redirect;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        double newRating = Double.parseDouble(request.getParameter("newRating"));
        int movieId = Integer.parseInt(request.getParameter("movieId"));
        String movieTitle = request.getParameter("movieTitle");

        if(newRating >= 0 && newRating <= 10){
            MySQLDb db = MySQLDb.createInstance();
            boolean ratingUpdated = db.updateRaing(newRating, movieId);

            if(ratingUpdated){
                redirect = "admin.jsp";
                message = "<span style=\"color: #4c59af\">" + movieTitle + "</span> rating changed to " + newRating;
                request.setAttribute("message", message);
            }
            else{
                redirect = "editRating.jsp?movieId=" + movieId;
                error = "Something went wrong. Please try again!";
                request.setAttribute("error", error);
            }
        }
        else{
            redirect = "editRating.jsp?movieId=" + movieId;
            request.setAttribute("error", error);
        }

        RequestDispatcher requestDispatcher = request.getRequestDispatcher(redirect);
        requestDispatcher.forward(request, response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
