/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;

/**
 *
 * @author zakina
 */
public class Caserne {
    
    private int id;
    private String nom ;
    private String rue ;
    private int copos;
    private String ville ;
    private ArrayList<Pompier> lesPompiers ;
    private ArrayList<Intervention> lesInterventions ;
    private ArrayList<Vehicule> lesVehicules ;

    public Caserne() {
    }

    public Caserne(int id) {
        this.id = id;
    }

    public Caserne(String nom, String rue, int copos, String ville) {
        this.nom = nom;
        this.rue = rue;
        this.copos = copos;
        this.ville = ville;
    }

    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getRue() {
        return rue;
    }

    public void setRue(String rue) {
        this.rue = rue;
    }

    public int getCopos() {
        return copos;
    }

    public void setCopos(int copos) {
        this.copos = copos;
    }

    public String getVille() {
        return ville;
    }

    public void setVille(String ville) {
        this.ville = ville;
    }
    

    public ArrayList<Pompier> getLesPompiers() {
        return lesPompiers;
    }

    public void setLesPompiers(ArrayList<Pompier> lesPompiers) {
        this.lesPompiers = lesPompiers;
    }
    
    public void addPompier(Pompier p){
        if (lesPompiers == null){
            lesPompiers = new ArrayList<Pompier>();
        }
        lesPompiers.add(p);
    }
    
    public ArrayList<Intervention> getLesInterventions() {
        return lesInterventions;
    }

    public void setLesInterventions(ArrayList<Intervention> lesInterventions) {
        this.lesInterventions = lesInterventions;
    }
    
    public void addIntervention(Intervention i){
        if (lesInterventions == null){
            lesInterventions = new ArrayList<Intervention>();
        }
        lesInterventions.add(i);
    }

    public ArrayList<Vehicule> getLesVehicules() {
        return lesVehicules;
    }

    public void setLesVehicules(ArrayList<Vehicule> lesVehicules) {
        this.lesVehicules = lesVehicules;
    }
    
     public void addIntervention(Vehicule v){
        if (lesVehicules == null){
            lesVehicules = new ArrayList<Vehicule>();
        }
        lesVehicules.add(v);
    }
}
