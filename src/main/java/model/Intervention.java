/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;

/**
 *
 * @author ts1sio
 */
public class Intervention {
    
    private int id;
    private String lieu ;
    private LocalDate date;
    private LocalTime heureAppel;
    private LocalTime heureArrivee;
    private LocalTime duree;
    private Caserne caserne;
    private ArrayList<Pompier> lesPompiers;
    private ArrayList<Vehicule> lesVehicules;
    private ArrayList<Situation> lesSituations;


    
    public Intervention() {
    }

    public Intervention(int id, String lieu, LocalDate date, LocalTime heureAppel, LocalTime heureArrivee, LocalTime duree) {
        this.id = id;
        this.lieu = lieu;
        this.date = date;
        this.heureAppel = heureAppel;
        this.heureArrivee = heureArrivee;
        this.duree = duree;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getLieu() {
        return lieu;
    }

    public void setLieu(String lieu) {
        this.lieu = lieu;
    }

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

    public LocalTime getHeureAppel() {
        return heureAppel;
    }

    public void setHeureAppel(LocalTime heureAppel) {
        this.heureAppel = heureAppel;
    }

    public LocalTime getHeureArrivee() {
        return heureArrivee;
    }

    public void setHeureArrivee(LocalTime heureArrivee) {
        this.heureArrivee = heureArrivee;
    }

    public LocalTime getDuree() {
        return duree;
    }

    public void setDuree(LocalTime duree) {
        this.duree = duree;
    }
    
    public Caserne getCaserne() {
        return caserne;
    }
    
    public void setCaserne(Caserne caserne) {
        this.caserne = caserne;
    }

    public ArrayList<Pompier> getLesPompiers() {
        return lesPompiers;
    }

    public void setLesPompiers(ArrayList<Pompier> lesPompiers) {
        this.lesPompiers = lesPompiers;
    }
    
    public void addUnPompier(Pompier unPompier){
        if (lesPompiers == null){
            lesPompiers = new ArrayList<Pompier>();
        }
        lesPompiers.add(unPompier);
    }

    public ArrayList<Vehicule> getLesVehicules() {
        return lesVehicules;
    }

    public void setLesVehicules(ArrayList<Vehicule> lesVehicules) {
        this.lesVehicules = lesVehicules;
    }
    
     public void addUnVehicule(Vehicule unVehicule){
        if (lesVehicules == null){
            lesVehicules = new ArrayList<Vehicule>();
        }
        lesVehicules.add(unVehicule);
    }
     
     public ArrayList<Situation> getLesSituations() {
        return lesSituations;
    }

    public void setLesSituations(ArrayList<Situation> lesSituations) {
        this.lesSituations = lesSituations;
    }
    
     public void addUneSituation(Situation uneSituation){
        if (lesSituations == null){
            lesSituations = new ArrayList<Situation>();
        }
        lesSituations.add(uneSituation);
    }
}
