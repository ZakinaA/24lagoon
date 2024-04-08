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
import model.Caserne;
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
        
        System.out.println ("La caserne 1 s'appelle =" + DaoCaserne.getNomCaserneById(cnx,1).getNom());

        
        Caserne c = new Caserne();
        c.setNom("Vire Pompier");
        c.setRue("14 rue vire");
        c.setCopos(14500);
        c.setVille("Vire");
        
        c = DaoCaserne.addCaserne(cnx, c);
        System.out.println("la nouvelle caserne a reçu l id = " + c.getId());
        
    }
    
}
