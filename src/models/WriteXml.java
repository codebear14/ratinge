package models;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import services.MySQLDb;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import java.io.File;
import java.util.List;
import java.util.ListIterator;

public class WriteXml {

    public void write(String path) {
        DocumentBuilderFactory icFactory = DocumentBuilderFactory.newInstance();
        DocumentBuilder icBuilder;
        try {
            icBuilder = icFactory.newDocumentBuilder();
            Document doc = icBuilder.newDocument();
            Element mainRootElement = doc.createElementNS("https://imdb/rating", "Movies");
            doc.appendChild(mainRootElement);

            MySQLDb db = MySQLDb.createInstance();
            List<Movie> movies = db.getXmlMovieRatings();
            ListIterator<Movie> iterator = movies.listIterator();

            while(iterator.hasNext()){
                Movie mv=iterator.next();
                mainRootElement.appendChild(getMovie(doc,mv));
            }

            // output DOM XML to console
            Transformer transformer = TransformerFactory.newInstance().newTransformer();
            transformer.setOutputProperty(OutputKeys.INDENT, "yes");
            DOMSource source = new DOMSource(doc);
            StreamResult console = new StreamResult(System.out);
            StreamResult file = new StreamResult(new File(path));//
            //transformer.transform(source, console);
            transformer.transform(source, file);

            //System.out.println("\nXML DOM Created Successfully..");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private static Node getMovie(Document doc, Movie mv) {
        Element company = doc.createElement("Movie");
        company.setAttribute("Movieid", Integer.toString(mv.getId()));
        company.appendChild(getMovieElements(doc, company, "MovieName", mv.getTitle()));
        company.appendChild(getMovieElements(doc, company, "MovieRating", Double.toString(mv.getRating())));
        return company;
    }

    // utility method to create text node
    private static Node getMovieElements(Document doc, Element element, String name, String value) {
        Element node = doc.createElement(name);
        node.appendChild(doc.createTextNode(value));
        return node;
    }

}
