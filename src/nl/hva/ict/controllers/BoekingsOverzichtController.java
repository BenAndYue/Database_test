package nl.hva.ict.controllers;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import nl.hva.ict.MainApplication;
import nl.hva.ict.models.BoekingsOverzicht;
import nl.hva.ict.views.BoekingsoverzichtView;
import nl.hva.ict.views.View;

public class BoekingsOverzichtController extends Controller {


    private final BoekingsoverzichtView boekingsoverzichtView;


    public BoekingsOverzichtController() {
        boekingsoverzichtView = new BoekingsoverzichtView();
        ObservableList<BoekingsOverzicht> observableBoeking;
        observableBoeking = FXCollections.observableList(MainApplication.getMySQLBoekingsOverzicht().getAll());
        boekingsoverzichtView.getBoekingsOverzichtListView().setItems(observableBoeking);
    }

    @Override
    public View getView() {
        return boekingsoverzichtView;
    }
}
