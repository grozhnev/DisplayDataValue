package main.java;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

@WebServlet("/searchForType")
public class ProcessInputServlet extends HttpServlet {

    public static String TYPE_VALUE;
    public static String DESCRIPTION;
    public static String TYPE_ATTRIBUTE;
    public static String ALT_VALUE_1;
    public static String ALT_VALUE_2;
    public static String ALT_VALUE_3;

    private String host = "";
    private String port = "";
    private String username = "";
    private String password = "";


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        getProperties();
        getDataFromDatabase(req);

        req.setAttribute("input", req.getParameter("type_input"));
        req.getRequestDispatcher("/result.jsp").forward(req, resp);

    }

    public void getProperties(){

        try (InputStream propertiesFile = ProcessInputServlet.class.getClassLoader().getResourceAsStream("main/resources/connection.properties")) {

            Properties properties = new Properties();

            if (propertiesFile == null) {
                System.err.println("*.properties file NOT FOUND");
                return;
            }

            properties.load(propertiesFile);

            host = properties.getProperty("host");
            port = properties.getProperty("port");
            username = properties.getProperty("username");
            password = properties.getProperty("password");


        } catch (IOException e) {
            System.err.println("Problem with getting properties");
            e.printStackTrace();
        }

    }

    public void getDataFromDatabase(HttpServletRequest req) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection(host + ":" + port + "/", username, password);

            Statement statement = connection.createStatement();
            ResultSet resultSet =
                    statement.executeQuery("SELECT * FROM type_value WHERE TYPE = " + req.getParameter("type_input") );

            while (resultSet.next()) {
                TYPE_VALUE = resultSet.getString("TYPE_VALUE");
                DESCRIPTION = resultSet.getString("DESCRIPTION");
                TYPE_ATTRIBUTE = resultSet.getString("TYPE_ATTRIBUTE");
                ALT_VALUE_1 = resultSet.getString("ALT_VALUE_1");
                ALT_VALUE_2 = resultSet.getString("ALT_VALUE_2");
                ALT_VALUE_3 = resultSet.getString("ALT_VALUE_3");
            }

        } catch (ClassNotFoundException e){
            System.err.println("No Jdbc driver!");
            e.printStackTrace();
        } catch (SQLException e) {
            System.err.println("Connection failed!");
            e.printStackTrace();
        }
    }


}
