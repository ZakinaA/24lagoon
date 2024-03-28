/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;

/**
 *
 * @author ts1sio
 */
public class Grade {
    private int id;
    private String libelle ;
    private ArrayList<Pompier> lesPompiers;
    private Surgrade UnSurgrade;

    public Grade() {
    }

    public Grade(int id, String libelle) {
        this.id = id;
        this.libelle = libelle;
    }

    public int getId() {
        return id;
    }

    public String getLibelle() {
        return libelle;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setLibelle(String libelle) {
        this.libelle = libelle;
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

    public Surgrade getUnSurgrade() {
        return UnSurgrade;
    }

    public void setUnSurgrade(Surgrade UnSurgrade) {
        this.UnSurgrade = UnSurgrade;
    }
}
