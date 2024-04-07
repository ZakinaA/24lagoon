/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package test;

import database.ConnexionBdd;
import database.DaoSituation;
import java.sql.Connection;
import java.util.ArrayList;
import model.Situation;

/**
 *
 * @author Minh-Tri
 */
public class TestDaoSituation {
     public static void main (String args[]){
         Connection cnx = ConnexionBdd.ouvrirConnexion();
         
          System.out.println ("nombre de situation : " + DaoSituation.getLesSituations(cnx).size());
     }
}

