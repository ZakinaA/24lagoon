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
import model.Grade;
import model.Surgrade;

/**
 *
 * @author ts1sio
 */
public class DaoGrade {
    Connection cnx;
    static PreparedStatement requeteSql = null;
    static ResultSet resultatRequete = null;
    
     public static ArrayList<Grade> getLesGrades(Connection cnx){
        
        ArrayList<Grade> lesGrades = new ArrayList<Grade>();
        try{
            requeteSql = cnx.prepareStatement("SELECT gra_id, gra_libelle, sur_libelle FROM grade, surgrade WHERE gra_surgrade_id = sur_id");
            resultatRequete = requeteSql.executeQuery();
            
            while (resultatRequete.next()){
                
                Grade g = new Grade();
                    g.setId(resultatRequete.getInt("gra_id"));
                    g.setLibelle(resultatRequete.getString("gra_libelle"));
                Surgrade s = new Surgrade();
                    s.setLibelle(resultatRequete.getString("sur_libelle"));
                
                g.setUnSurgrade(s);
                
                lesGrades.add(g);
            }
           
        }
        catch (SQLException e){
            e.printStackTrace();
            System.out.println("La requête de getLesGrades e généré une erreur");
        }
        return lesGrades;
    }
}
