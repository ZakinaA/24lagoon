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
public class Pompier {
    
    private int id;
    private String bip ;
    private String nom;
    private String prenom ;
    private Caserne uneCaserne ;
    private Grade unGrade;
    private ArrayList<Fonction> lesFonctions;

    public Pompier() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getBip() {
        return bip;
    }

    public void setBip(String bip) {
        this.bip = bip;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public Caserne getUneCaserne() {
        return uneCaserne;
    }

    public void setUneCaserne(Caserne uneCaserne) {
        this.uneCaserne = uneCaserne;
    }

    public Grade getUnGrade() {
        return unGrade;
    }

    public void setUnGrade(Grade unGrade) {
        this.unGrade = unGrade;
    }

    public ArrayList<Fonction> getLesFonctions() {
        return lesFonctions;
    }

    public void setLesFonctions(ArrayList<Fonction> lesFonctions) {
        this.lesFonctions = lesFonctions;
    }
    
    
    
    public void addUneFonction(Fonction uneFonction){
        if (lesFonctions == null){
            lesFonctions = new ArrayList<Fonction>();
        }
        lesFonctions.add(uneFonction);
    }
    
}
