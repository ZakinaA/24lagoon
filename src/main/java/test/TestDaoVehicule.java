/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package test;

import database.ConnexionBdd;
import database.DaoVehicule;
import java.sql.Connection;
import java.time.LocalDate;
import java.util.ArrayList;
import model.Caserne;
import model.TypeVehicule;
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
          
          Vehicule v = new Vehicule();
          v.setImmatriculation("EJB-8AB");
          
          LocalDate dateOrigine = LocalDate.parse("2014-12-23");
          v.setDateOrigine(dateOrigine);
          
          LocalDate dateRevision = LocalDate.parse("2024-05-12");
          v.setDateRevision(dateRevision);
          
          v.setTypeVehicule(new TypeVehicule(1));
          v.setUneCaserne(new Caserne(2));

          v = DaoVehicule.addVehicule(cnx, v);
          System.out.println("Le nouveau véhicule a reçu l'id = " + v.getId());

     }
}
