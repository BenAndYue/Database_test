package nl.hva.ict.data.MySQL;

import nl.hva.ict.models.Reservering;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MySQLReservering extends MySQL<Reservering> {

    private final List<Reservering> reserveringen;

    public MySQLReservering() {
        reserveringen = new ArrayList<>();
        load();
    }

    private void load() {

        String sql = "";

        try {
            PreparedStatement ps = getStatement(sql);
            ResultSet rs = executeSelectPreparedStatement(ps);

            while (rs.next()) {

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    @Override
    public List<Reservering> getAll() {
        return null;
    }

    @Override
    public Reservering get(String id) {
        return null;
    }

    @Override
    public void add(Reservering object) {

    }

    @Override
    public void update(Reservering object) {

    }

    @Override
    public void remove(Reservering object) {

    }
}
