package servlets;

import services.MySQLDb;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "CommentServlet")
public class CommentServlet extends HttpServlet {

    String error = "You need to log in before you comment";
    String redirect;
    String message;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        HttpSession session = request.getSession();
        if(session.getAttribute("user") != null){
            int movieId = Integer.parseInt(request.getParameter("movieId"));
            int userId = Integer.parseInt(request.getParameter("userId"));
            String comment = request.getParameter("comment");
            //System.out.println(movieId + " " + userId + " " + comment);
            //System.out.println("You can process");
            MySQLDb db = MySQLDb.createInstance();
            boolean commentAdded = db.addComment(userId, movieId, comment);

            if(commentAdded){
                message = "Thanks for commenting";
                redirect = "comments.jsp?=movieId" + movieId;
            }
            else{
                message = "Something went wrong!";
                redirect = "comments.jsp?=movieId" + movieId;
            }
            request.setAttribute("message", message);
        }
        else{
            redirect = "login.jsp";
            request.setAttribute("error", error);
        }

        RequestDispatcher requestDispatcher = request.getRequestDispatcher(redirect);
        requestDispatcher.forward(request, response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
