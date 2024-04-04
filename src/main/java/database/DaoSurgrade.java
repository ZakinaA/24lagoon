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
import model.Surgrade;

/**
 *
 * @author ts1sio
 */
public class DaoSurgrade {
    Connection cnx;
    static PreparedStatement requeteSql = null;
    static ResultSet resultatRequete = null;
    
     public static ArrayList<Surgrade> getLesSurgrades(Connection cnx){
        
        ArrayList<Surgrade> lesSurgrades = new ArrayList<Surgrade>();
        try{
            requeteSql = cnx.prepareStatement("SELECT sur_id, sur_libelle FROM surgrade ");
            resultatRequete = requeteSql.executeQuery();
            
            while (resultatRequete.next()){
                
                Surgrade s = new Surgrade();
                    s.setId(resultatRequete.getInt("sur_id"));
                    s.setLibelle(resultatRequete.getString("sur_libelle"));

                
                lesSurgrades.add(s);
            }
           
        }
        catch (SQLException e){
            e.printStackTrace();
            System.out.println("La requête de getLesSurgrades e généré une erreur");
        }
        return lesSurgrades;
    }

}
