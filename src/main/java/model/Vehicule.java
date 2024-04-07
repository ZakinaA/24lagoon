/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.time.LocalDate;
import java.util.ArrayList;

/**
 *
 * @author ts1sio
 */
public class Vehicule {
    
    private int id;
    private String immatriculation ;
    private LocalDate dateOrigine;
    private LocalDate dateRevision;
    private TypeVehicule typeVehicule;
    private ArrayList<Intervention> lesInterventions;
    private Caserne uneCaserne;

    
    public Vehicule() {
    }

    public Vehicule(int id, String immatriculation, LocalDate dateOrigine, LocalDate dateRevision) {
        this.id = id;
        this.immatriculation = immatriculation;
        this.dateOrigine = dateOrigine;
        this.dateRevision = dateRevision;
    }

    public int getId() {
        return id;
    }

    public String getImmatriculation() {
        return immatriculation;
    }

    public LocalDate getDateOrigine() {
        return dateOrigine;
    }

    public LocalDate getDateRevision() {
        return dateRevision;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setImmatriculation(String immatriculation) {
        this.immatriculation = immatriculation;
    }

    public void setDateOrigine(LocalDate dateOrigine) {
        this.dateOrigine = dateOrigine;
    }

    public void setDateRevision(LocalDate dateRevision) {
        this.dateRevision = dateRevision;
    }

    public TypeVehicule getTypeVehicule() {
        return typeVehicule;
    }

    public void setTypeVehicule(TypeVehicule typeVehicule) {
        this.typeVehicule = typeVehicule;
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

    public Caserne getUneCaserne() {
        return uneCaserne;
    }

    public void setUneCaserne(Caserne uneCaserne) {
        this.uneCaserne = uneCaserne;
    }
    
    
}
