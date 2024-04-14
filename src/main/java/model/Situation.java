/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;

/**
 *
 * @author Minh-Tri
 */
public class Situation {
    
    private int id;
    private String libelle ;
    private String description;
    private ArrayList<Intervention> lesInterventions;

    public Situation() {
    }

    public Situation(int id, String libelle, String description) {
        this.id = id;
        this.libelle = libelle;
        this.description = description;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getLibelle() {
        return libelle;
    }

    public void setLibelle(String libelle) {
        this.libelle = libelle;
    }
    
    public ArrayList<Intervention> getLesInterventions() {
        return lesInterventions;
    }

    public void setLesInterventions(ArrayList<Intervention> lesInterventions) {
        this.lesInterventions = lesInterventions;
    }
    
    public void addUneIntervention(Intervention uneIntervention){
        if (lesInterventions == null){
            lesInterventions = new ArrayList<Intervention>();
        }
        lesInterventions.add(uneIntervention);
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
    
    
}
