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
    
}
