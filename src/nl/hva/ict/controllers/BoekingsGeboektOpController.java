package nl.hva.ict.controllers;

import nl.hva.ict.views.GeboektOpView;
import nl.hva.ict.views.View;

public class BoekingsGeboektOpController extends Controller {

    private GeboektOpView geboektOpView;

    public BoekingsGeboektOpController() {
        geboektOpView = new GeboektOpView();
    }

    @Override
    public View getView() {
        return geboektOpView;
    }
}
