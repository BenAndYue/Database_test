package nl.hva.ict.models;

import nl.hva.ict.data.Identifable;

import java.io.Serializable;
import java.sql.Date;

public class Reservering implements Identifable, Serializable {

    private int idReservering;
    private Date aankomstDatum;
    private Date vertrekDatum;
    private boolean betaald;
    private String accommodatieCode;
    private String reizerCode;


    public Reservering(int idReservering, Date aankomstDatum, Date vertrekDatum, boolean betaald, String accommodatieCode, String reizerCode) {
        this.idReservering = idReservering;
        this.aankomstDatum = aankomstDatum;
        this.vertrekDatum = vertrekDatum;
        this.betaald = betaald;
        this.accommodatieCode = accommodatieCode;
        this.reizerCode = reizerCode;
    }

    public Reservering() {
    }

    public int getIdReservering() {
        return idReservering;
    }

    public void setIdReservering(int idReservering) {
        this.idReservering = idReservering;
    }

    public Date getAankomstDatum() {
        return aankomstDatum;
    }

    public void setAankomstDatum(Date aankomstDatum) {
        this.aankomstDatum = aankomstDatum;
    }

    public Date getVertrekDatum() {
        return vertrekDatum;
    }

    public void setVertrekDatum(Date vertrekDatum) {
        this.vertrekDatum = vertrekDatum;
    }

    public boolean isBetaald() {
        return betaald;
    }

    public void setBetaald(boolean betaald) {
        this.betaald = betaald;
    }

    public String getAccommodatieCode() {
        return accommodatieCode;
    }

    public void setAccommodatieCode(String accommodatieCode) {
        this.accommodatieCode = accommodatieCode;
    }

    public String getReizerCode() {
        return reizerCode;
    }

    public void setReizerCode(String reizerCode) {
        this.reizerCode = reizerCode;
    }

    @Override
    public String toString() {
        return "Reservering{" +
                "idReservering=" + idReservering +
                ", aankomstDatum=" + aankomstDatum +
                ", vertrekDatum=" + vertrekDatum +
                ", betaald=" + betaald +
                ", accommodatieCode='" + accommodatieCode + '\'' +
                ", reizerCode='" + reizerCode + '\'' +
                '}';
    }
}
