package servlets;

import models.Movie;
import models.WriteXml;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "GetXMLRatingsServlet")
public class GetXMLRatingsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            ServletContext context = request.getServletContext();
            String path = context.getRealPath("/movie_rating.xml");
            //System.out.println(path);
            WriteXml wx = new WriteXml();
            wx.write(path);

            File fXmlFile = new File(path);
            DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
            DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
            Document doc = dBuilder.parse(fXmlFile);

            doc.getDocumentElement().normalize();

//            System.out.println("Root element :" + doc.getDocumentElement().getNodeName());

            NodeList nList = doc.getElementsByTagName("Movie");

//            System.out.println("----------------------------");
            List<Movie> movieRatingList = new ArrayList<>();

            for (int temp = 0; temp < nList.getLength(); temp++) {

                Node nNode = nList.item(temp);

//                System.out.println("\nCurrent Element :" + nNode.getNodeName());

                if (nNode.getNodeType() == Node.ELEMENT_NODE) {

                    Element eElement = (Element) nNode;
                    Movie mv= new Movie(Integer.parseInt(eElement.getAttribute("Movieid")),eElement.getElementsByTagName("MovieName").item(0).getTextContent(), Double.parseDouble(eElement.getElementsByTagName("MovieRating").item(0).getTextContent()));
//                    System.out.println("Movie Id : " + mv.getId());
//                    System.out.println("Movie Title : " + mv.getTitle());
//                    System.out.println("Movie Rating : " + mv.getRating());
                    movieRatingList.add(mv);
                }
            }

            request.setAttribute("listOfMoviesXML", movieRatingList);
            request.getRequestDispatcher("admin.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        }


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
