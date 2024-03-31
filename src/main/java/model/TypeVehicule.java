/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author alexi
 */
public class TypeVehicule {
    private int id;
    private String nom;
    private String  caracteristiques;

    public TypeVehicule() {
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
    
    
}
