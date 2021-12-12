package nl.hva.ict.data.MongoDB;

import com.mongodb.client.MongoCursor;
import com.mongodb.client.model.Filters;
import nl.hva.ict.models.Reiziger;
import org.bson.Document;

import java.util.ArrayList;
import java.util.List;

public class MongoReizigers extends MongoDB {

    private final List<Reiziger> reizigers;

    public MongoReizigers() {
        reizigers = new ArrayList<>();
        load();
    }

    @Override
    public List getAll() {
        return reizigers;
    }

    @Override
    public Object get(String id) {
        return null;
    }

    @Override
    public void add(Object object) {

    }

    @Override
    public void update(Object object) {

    }

    @Override
    public void remove(Object object) {

    }

    public Reiziger getOneReizigers(String reizigersId){
        // warning Java is case sensitive
        this.selectedCollection("reizigers");
        Document myDoc = collection.find(Filters.eq("reizigerscode", reizigersId)).first();
        String reizigerCode = (String)myDoc.get("reizigers code");
        String voornaam = (String)myDoc.get("voornaam");
        String achternaam = (String)myDoc.get("achternaam");
        String adres = (String)myDoc.get("adres");
        String postcode = (String)myDoc.get("postcode");
        String plaats = (String)myDoc.get("plaats");
        String land = (String)myDoc.get("land");
        String hoofdreiziger = (String)myDoc.get("hoofdreiziger");
        return new Reiziger(reizigerCode, voornaam, achternaam, adres, postcode, plaats, land, hoofdreiziger);
    }


    public void load(){
        this.selectedCollection("reizigers");
        MongoCursor<Document> cursor = collection.find().iterator();
        try {
            while (cursor.hasNext()) {
                // warning Java is case sensitive
                Document tempReiziger = cursor.next();
                String reizigerCode = (String)tempReiziger.get("reizigersCode");
                String voornaam = (String)tempReiziger.get("voornaam");
                String achternaam = (String)tempReiziger.get("achternaam");
                String adres = (String)tempReiziger.get("adres");
                String postcode = (String)tempReiziger.get("postcode");
                String plaats = (String)tempReiziger.get("plaats");
                String land = (String)tempReiziger.get("land");
                String hoofdreiziger = (String)tempReiziger.get("hoofdReiziger");
                Reiziger reiziger = new Reiziger(reizigerCode, voornaam, achternaam, adres, postcode, plaats, land, hoofdreiziger);
                reizigers.add(reiziger);
            }
        } finally {
            cursor.close();
        }
    }
}
