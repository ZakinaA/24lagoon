/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package test;

import database.ConnexionBdd;
import database.DaoTypeVehicule;
import database.DaoVehicule;
import java.sql.Connection;

/**
 *
 * @author alexi
 */
public class TestDaoTypeVehicule {
         public static void main (String args[]){
             Connection cnx = ConnexionBdd.ouvrirConnexion();
             System.out.println ("nombre de types véhicules : " + DaoTypeVehicule.getLesTypesVehicules(cnx).size());
             System.out.println ("nombre de véhicule du type 1 =" + DaoVehicule.getLesVehiculesTypeVehiculeById(cnx,1).size());

         }
}
