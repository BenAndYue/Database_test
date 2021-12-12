package nl.hva.ict;

import javafx.application.Application;
import javafx.geometry.Rectangle2D;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Screen;
import javafx.stage.Stage;
import nl.hva.ict.controllers.MainController;
import nl.hva.ict.data.MongoDB.MongoReizigers;
import nl.hva.ict.data.MySQL.*;

public class MainApplication extends Application {

    private static final String TITLE = "Practicumopdracht DB2 - Java uitwerking ";

    //MySQL
    private static final String MYSQL_HOST = "jdbc:mysql://localhost:3306/big_five_safari?serverTimezone=UTC";
    private static final String MYSQL_USERNAME = "root";
    private static final String MYSQL_PASSWORD = "admin";

    //Mongo NoSQL
    private static final String NOSQL_HOST = "mongodb+srv://Benn:admin@cluster0-lwtpn.azure.mongodb.net/big_five_safari?retryWrites=true&w=majority";
    private static final String NOSQL_DATABASE = "big_five_safari";

    //JavaFX
    private static Stage stage;
    private static MainController mainController;

    //Data models
    private static final MySQLReizigers mySQLReizigers = new MySQLReizigers();
    private static final MySQLLodge mySQLLodge = new MySQLLodge();



    private static final MySQLHotel mySQLHotel = new MySQLHotel();
    private static final MySQLAccommodatie mySQLAccommodatie = new MySQLAccommodatie();
    private static final MySQLBoekingsOverzicht mySQLBoekingsOverzicht = new MySQLBoekingsOverzicht();

    // voor NOSQL
    private static final MongoReizigers mongoDBReizigers = new MongoReizigers();


    private final int WIDTH = 800;
    private final int HEIGHT = 800;

    @Override
    public void start(Stage stage) {
        MainApplication.stage = stage;
        MainApplication.stage.setTitle(TITLE);
        MainApplication.stage.setWidth(WIDTH);
        MainApplication.stage.setHeight(HEIGHT);
        mainController = new MainController();

        Rectangle2D primaryScreenBounds = Screen.getPrimary().getVisualBounds();
        MainApplication.stage.setX((primaryScreenBounds.getWidth() - WIDTH) / 2f);
        MainApplication.stage.setY((primaryScreenBounds.getHeight() - HEIGHT) / 2f);

        stage.setScene(new Scene(mainController.getView().getRoot()));
        stage.show();
    }

    public static void switchController(Parent pane) { mainController.getBorderPane().setCenter(pane); }

    public static String getMysqlHost() { return MYSQL_HOST; }

    public static String getMysqlUsername() { return MYSQL_USERNAME; }

    public static String getMysqlPassword() { return MYSQL_PASSWORD; }

    public static String getNosqlHost() { return NOSQL_HOST; }

    public static String getNosqlDatabase() { return NOSQL_DATABASE; }

    public static String getTITLE() { return TITLE; }

    public static MySQLReizigers getMySQLReizigers() { return mySQLReizigers; }

    public static MySQLLodge getMySQLLodge() { return mySQLLodge; }

    public static MySQLHotel getMySQLHotel() { return mySQLHotel; }

    public static MySQLBoekingsOverzicht getMySQLBoekingsOverzicht() { return mySQLBoekingsOverzicht; }

    public static MySQLAccommodatie getMySQLAccommodatie() { return mySQLAccommodatie; }

    public static MongoReizigers getMongoDBReizigers() {  return mongoDBReizigers; }


}
