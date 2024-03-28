/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package test;

import database.ConnexionBdd;
import database.DaoFonction;
import java.sql.Connection;
import java.util.ArrayList;
import model.Fonction;

/**
 *
 * @author ts1sio
 */
public class TestDaoFonction {
        public static void main (String args[]){
            
            Connection cnx = ConnexionBdd.ouvrirConnexion();

            
            ArrayList<Fonction> lesFonctions = DaoFonction.getLesFonctions(cnx);
            System.out.println ("nombre de fonction=" + DaoFonction.getLesFonctions(cnx).size());
            for (Fonction f : lesFonctions){
            System.out.println(" . "+ f.getId() + " " + f.getLibelle());
        }
        }
}