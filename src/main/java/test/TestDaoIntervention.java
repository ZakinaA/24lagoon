/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package test;

import database.ConnexionBdd;
import database.DaoIntervention;
import java.sql.Connection;

/**
 *
 * @author ts1sio
 */
public class TestDaoIntervention {
       public static void main (String args[]){
        
        Connection cnx = ConnexionBdd.ouvrirConnexion();
        System.out.println ("nombre d'intervention=" + DaoIntervention.getInterventionCaserneById(cnx,1).size());
        
        System.out.println ("nombre d'intervention du pompier 1 =" + DaoIntervention.getInterventionPompierById(cnx,2).size());
        
        System.out.println ("nombre d'intervention du véhicule 3 =" + DaoIntervention.getInterventionVehiculeById(cnx,3).size());
        
        System.out.println ("nombre d'intervention avec la situation 3 =" + DaoIntervention.getInterventionSituationById(cnx,3).size());
        
        System.out.println ("nombre d'interventions=" + DaoIntervention.getLesInterventions(cnx).size());
        
        
        System.out.println ("L'invervention 1 : " + DaoIntervention.getInterventionById(cnx,1).getLieu() 
                + " " + DaoIntervention.getInterventionById(cnx,1).getDate() 
                + " " + DaoIntervention.getInterventionById(cnx,1).getHeureAppel()
                + " " + DaoIntervention.getInterventionById(cnx,1).getHeureArrivee()
                + " " + DaoIntervention.getInterventionById(cnx,1).getHeureArrivee()
                + " " + DaoIntervention.getInterventionById(cnx,1).getDuree()
                + " " + DaoIntervention.getInterventionById(cnx,1).getCaserne().getNom());
    }
}
