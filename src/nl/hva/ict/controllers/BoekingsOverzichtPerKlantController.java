package nl.hva.ict.controllers;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import nl.hva.ict.MainApplication;
import nl.hva.ict.models.BoekingsOverzicht;
import nl.hva.ict.models.Reiziger;
import nl.hva.ict.views.BoekingsoverzichtPerKlantView;
import nl.hva.ict.views.View;

public class BoekingsOverzichtPerKlantController extends Controller {

    private final BoekingsoverzichtPerKlantView boekingsoverzichtPerKlantView;
    private ObservableList<Reiziger> reizigers;

    public BoekingsOverzichtPerKlantController() {
        boekingsoverzichtPerKlantView = new BoekingsoverzichtPerKlantView();
        boekingsoverzichtPerKlantView.getComboBox().getSelectionModel().selectedItemProperty().addListener(event -> ListViewPerKlant());
        load();
    }

    private void load() {
        reizigers = FXCollections.observableArrayList(MainApplication.getMySQLReizigers().getAll());
        boekingsoverzichtPerKlantView.getComboBox().setItems(reizigers);


    }

    private void ListViewPerKlant() {

        // Wat is geselecteerd?
        Reiziger selectedReiziger = (Reiziger) boekingsoverzichtPerKlantView.getComboBox().getSelectionModel().getSelectedItem();

        // Haal data op van deze reiziger
        ObservableList<BoekingsOverzicht> BoekingsOverzichtList = FXCollections.observableArrayList(MainApplication.getMySQLBoekingsOverzicht().getBoekingVoor(selectedReiziger.getReizigersCode()));

        // Zet in listview
        boekingsoverzichtPerKlantView.getBoekingsOverzichtListView().setItems(BoekingsOverzichtList);


    }

    @Override
    public View getView() {
        return boekingsoverzichtPerKlantView;
    }
}
