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
public class Surgrade {
    private int id;
    private String libelle ;
    private ArrayList<Grade> lesGrades;

    public Surgrade() {
    }

    public Surgrade(int id, String libelle) {
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

    public ArrayList<Grade> getLesGrades() {
        return lesGrades;
    }

    public void setLesGrades(ArrayList<Grade> lesGrades) {
        this.lesGrades = lesGrades;
    }
    
    public void addUnGrade(Grade unGrade){
        if (lesGrades == null){
            lesGrades = new ArrayList<Grade>();
        }
        lesGrades.add(unGrade);
    }

}
