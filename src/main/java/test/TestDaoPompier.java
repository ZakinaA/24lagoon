/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package test;

import database.ConnexionBdd;
import database.DaoPompier;
import java.sql.Connection;
import java.time.LocalDate;
import model.Caserne;
import model.Grade;
import model.Pompier;

/**
 *
 * @author zakina
 */
public class TestDaoPompier {
    
    public static void main (String args[]){
        
        Connection cnx = ConnexionBdd.ouvrirConnexion();
        System.out.println ("nombre de pomipiers=" + DaoPompier.getLesPompiers(cnx).size());
        
       
            System.out.println ("Le pompier 1 s'appelle : " + DaoPompier.getPompierById(cnx,1).getNom() 
                + " " + DaoPompier.getPompierById(cnx,1).getPrenom() 
                + " " + DaoPompier.getPompierById(cnx,1).getUnGrade().getLibelle() 
                + " " + DaoPompier.getPompierById(cnx,1).getUneCaserne().getNom());
                  
        Pompier p = new Pompier();
        p.setNom("ROBIN");
        p.setPrenom("Alexis");
        LocalDate dateNaissance = LocalDate.parse("2024-02-22");
        p.setDateNaiss(dateNaissance);
        p.setIndice(159);
        p.setUneCaserne(new Caserne(1));
        p.setUnGrade(new Grade(1));
        
        p = DaoPompier.addPompier(cnx, p);
        System.out.println("le nouveau pompier a reçu l id = " + p.getId());
        
        
    }
    
}
