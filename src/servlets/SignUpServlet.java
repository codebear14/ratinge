package servlets;

import models.EncryptPassword;
import models.UserModel;
import services.MySQLDb;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "SignUpServlet")
public class SignUpServlet extends HttpServlet {

    String error = "User registration failed";
    String redirect;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");

        EncryptPassword ePassword = new EncryptPassword();
        String encrypted = ePassword.encryptUserPassword(password);

        //System.out.println(name + " : " + email + " : " + userName + " : " + password + " : " + encrypted);

        UserModel user = new UserModel(name, email, userName, encrypted);

        MySQLDb db = MySQLDb.createInstance();
        boolean doneRegUser = db.registerUser(user);

        if(doneRegUser){
            //System.out.println("Done");
            redirect = "login.jsp";
        }
        else{
            //System.out.println("Error");
            request.setAttribute("error", error);
            redirect = "signup.jsp";
        }

        RequestDispatcher requestDispatcher = request.getRequestDispatcher(redirect);
        requestDispatcher.forward(request, response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
