/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package test;

import database.ConnexionBdd;
import database.DaoVehicule;
import java.sql.Connection;
import java.util.ArrayList;
import model.Vehicule;

/**
 *
 * @author alexi
 */
public class TestDaoVehicule {
     public static void main (String args[]){
         Connection cnx = ConnexionBdd.ouvrirConnexion();
         
          ArrayList<Vehicule> lesVehicules = DaoVehicule.getLesVehicules(cnx);
          System.out.println ("nombre de véhicules : " + DaoVehicule.getLesVehicules(cnx).size());
          for (Vehicule v : lesVehicules){
          System.out.println(" . "+ v.getId() + " " + v.getImmatriculation() + " " + v.getDateOrigine() + " " + v.getDateRevision() + " "+ v.getTypeVehicule().getNom() + " " + v.getTypeVehicule().getCaracteristiques());
        }
     }
}
