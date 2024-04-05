/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.time.LocalDate;
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
    private LocalDate dateNaiss;
    private int indice;
    private Caserne uneCaserne ;
    private Grade unGrade;
    private ArrayList<Fonction> lesFonctions;
    private ArrayList<Intervention> lesInterventions;


    public Pompier() {
    }

    public Pompier(int id, String bip, String nom, String prenom, LocalDate dateNaiss, int indice) {
        this.id = id;
        this.bip = bip;
        this.nom = nom;
        this.prenom = prenom;
        this.dateNaiss = dateNaiss;
        this.indice = indice;
    }

    public int getIndice() {
        return indice;
    }

    public void setIndice(int indice) {
        this.indice = indice;
    }

    public LocalDate getDateNaiss() {
        return dateNaiss;
    }

    public void setDateNaiss(LocalDate dateNaiss) {
        this.dateNaiss = dateNaiss;
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
    
}
