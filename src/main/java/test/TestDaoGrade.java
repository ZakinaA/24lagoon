/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package test;

import database.ConnexionBdd;
import database.DaoGrade;
import java.sql.Connection;
import java.util.ArrayList;
import model.Grade;
import model.Pompier;

/**
 *
 * @author ts1sio
 */
public class TestDaoGrade {
      public static void main (String args[]){
            
            Connection cnx = ConnexionBdd.ouvrirConnexion();

            
            ArrayList<Grade> lesGrades = DaoGrade.getLesGrades(cnx);
            System.out.println ("nombre de grades : " + DaoGrade.getLesGrades(cnx).size());
            for (Grade g : lesGrades){
            System.out.println(" . "+ g.getId() + " " + g.getLibelle() + " " + g.getUnSurgrade().getLibelle());
            }
            
            ArrayList<Pompier> pompiers = DaoGrade.getLesPompiersGradeById(cnx, 2);
            System.out.println ("Les pompiers du grade de l'id 1 sont :");
            for (Pompier pompier : pompiers) {
                System.out.println("ID: " + pompier.getId() + ", Nom: " + pompier.getNom() + ", Prénom: " + pompier.getPrenom());
            }
    }
}
