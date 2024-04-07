/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Situation;

/**
 *
 * @author Minh-Tri
 */
public class DaoSituation {
    Connection cnx;
    static PreparedStatement requeteSql = null;
    static ResultSet resultatRequete = null;
    
         public static ArrayList<Situation> getLesSituations(Connection cnx){

        ArrayList<Situation> lesSituations = new ArrayList<Situation>();
        try{
            requeteSql = cnx.prepareStatement("select sit_id, sit_libelle " +
                         " from situation ");
            resultatRequete = requeteSql.executeQuery();

            while (resultatRequete.next()){

                Situation s = new Situation();
                    s.setId(resultatRequete.getInt("sit_id"));
                    s.setLibelle(resultatRequete.getString("sit_libelle"));


                lesSituations.add(s);
            }

        }
        catch (SQLException e){
            e.printStackTrace();
            System.out.println("La requête de getLesSituations e généré une erreur");
        }
        return lesSituations;
    }
    
}
