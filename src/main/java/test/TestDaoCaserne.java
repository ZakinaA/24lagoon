/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package test;

import database.ConnexionBdd;
import database.DaoCaserne;
import database.DaoPompier;
import java.sql.Connection;
import java.util.ArrayList;
import model.Pompier;

/**
 *
 * @author zakina
 */
public class TestDaoCaserne {
    
      public static void main (String args[]){
        
        Connection cnx = ConnexionBdd.ouvrirConnexion();
        System.out.println ("nombre de casernes=" + DaoCaserne.getLesCasernes(cnx).size());
           
        ArrayList<Pompier> pompiers = DaoCaserne.getLesPompiersCaserneById(cnx, 2);
        System.out.println ("Les pompiers de la caserne 1 contiennent :");
        for (Pompier pompier : pompiers) {
            System.out.println("ID: " + pompier.getId() + ", Nom: " + pompier.getNom() + ", Prénom: " + pompier.getPrenom());
        }
    }
    
}
