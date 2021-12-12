package nl.hva.ict.controllers;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import nl.hva.ict.MainApplication;
import nl.hva.ict.models.Hotel;
import nl.hva.ict.views.HotelView;
import nl.hva.ict.views.View;

public class HotelController extends Controller {

    private final HotelView hotelView;
    private ObservableList<Hotel> hotels;

    public HotelController() {
        hotelView = new HotelView();
        hotelView.getHotelsViewListView().getSelectionModel().selectedItemProperty()
                .addListener(e -> getItemsInFields());
        hotelView.getBtSave().setOnAction(e -> save());
        hotelView.getBtUpdateData().setOnAction(e -> refreshData());
        hotelView.getBtNew().setOnAction(e -> insert());
        hotelView.getBtDelete().setOnAction(e -> delete());
        loadData();
    }

    private void loadData() {
        //haal de waardes op uit de database
        hotels = FXCollections.observableArrayList(MainApplication.getMySQLHotel().getAll());
        hotelView.getHotelsViewListView().setItems(hotels);
    }

    private void refreshData() {
        MainApplication.getMySQLHotel().reload();
    }

    private void save() {
        // bewaar (update) record
    }

    private void delete() {
        Hotel currentHotel = hotelView.getHotelsViewListView().getSelectionModel().getSelectedItem();
        MainApplication.getMySQLHotel().remove(currentHotel);
    }

    private void insert() {
        //Voeg toe
    }

    private void getItemsInFields() {

        Hotel currentHotel = hotelView.getHotelsViewListView().getSelectionModel().getSelectedItem();
        hotelView.getTxtAccommodatieCode().setText((currentHotel.getAccommodatieCode()));
        hotelView.getTxtNaam().setText(currentHotel.getNaam());
        hotelView.getTxtStad().setText(currentHotel.getStad());
        hotelView.getTxtLand().setText(currentHotel.getLand());
        hotelView.getTxtKamertype().setText(currentHotel.getKamer());
        hotelView.getTxtAantalPersonen().setText((String.valueOf(currentHotel.getPersonen())));
        hotelView.getTxtPrijsPerNacht().setText(String.valueOf(currentHotel.getPrijsPerNacht()));
        hotelView.getCheckOntbijt().setSelected(currentHotel.isOntbijt());
    }

    @Override
    public View getView() {
        return hotelView;
    }
}
