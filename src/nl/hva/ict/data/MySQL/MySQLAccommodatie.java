package nl.hva.ict.data.MySQL;

import nl.hva.ict.models.Accommodatie;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MySQLAccommodatie extends MySQL<Accommodatie> {

    private final List<Accommodatie> accommodaties;

    public MySQLAccommodatie() {
        accommodaties = new ArrayList<>();
        load();
    }

    private void load() {

        String sql = "SELECT * FROM Accomodatie";

        try {
            PreparedStatement ps = getStatement(sql);
            ResultSet rs = executeSelectPreparedStatement(ps);

            while (rs.next()) {
                String accommodatieCode = rs.getString("accomodatieCode");
                String naam = rs.getString("naam");
                String stad = rs.getString("stad");
                String land = rs.getString("land");
                String kamer = rs.getString("kamer");
                int personen = rs.getInt("personen");
                String soort = rs.getString("soort");
                accommodaties.add(new Accommodatie(accommodatieCode, naam, stad, land, kamer, personen, soort));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    public void reload() {
        accommodaties.clear();
        load();
    }

    @Override
    public List<Accommodatie> getAll() {
        return accommodaties;
    }

    @Override
    public Accommodatie get(String id) {
        return null;
    }

    @Override
    public void add(Accommodatie object) {

    }

    @Override
    public void update(Accommodatie object) {

    }

    @Override
    public void remove(Accommodatie object) {

    }
}
