package servlets;

import services.MySQLDb;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ChangeRatingServlet")
public class ChangeRatingServlet extends HttpServlet {

    String error = "Please enter a valid rating";
    String redirect;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        double newRating = Double.parseDouble(request.getParameter("newRating"));
        if(newRating >= 0 && newRating <= 10){
            MySQLDb db = MySQLDb.createInstance();
            //boolean ratingUpdated = db.updateRaing();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
