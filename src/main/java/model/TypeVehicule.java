/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;

/**
 *
 * @author alexi
 */
public class TypeVehicule {
    private int id;
    private String nom;
    private String  caracteristiques;
    private ArrayList<Vehicule> lesVehicules;

    public TypeVehicule() {
    }

    public TypeVehicule(int id) {
        this.id = id;
    }

    public TypeVehicule(int id, String nom, String caracteristiques) {
        this.id = id;
        this.nom = nom;
        this.caracteristiques = caracteristiques;
    }

    public int getId() {
        return id;
    }

    public String getNom() {
        return nom;
    }

    public String getCaracteristiques() {
        return caracteristiques;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public void setCaracteristiques(String caracteristiques) {
        this.caracteristiques = caracteristiques;
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
}
