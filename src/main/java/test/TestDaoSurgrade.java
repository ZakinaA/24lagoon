/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package test;

import database.ConnexionBdd;
import database.DaoSurgrade;
import java.sql.Connection;

/**
 *
 * @author ts1sio
 */
public class TestDaoSurgrade {
     public static void main (String args[]){
        
        Connection cnx = ConnexionBdd.ouvrirConnexion();
        System.out.println ("nombre de pomipiers=" + DaoSurgrade.getLesSurgrades(cnx).size());
       

    }
}
