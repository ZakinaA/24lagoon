/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package database;

import static database.DaoCaserne.requeteSql;
import static database.DaoCaserne.resultatRequete;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Caserne;
import model.Pompier;

/**
 *
 * @author zakina
 */
public class DaoCaserne {
    
    Connection cnx;
    static PreparedStatement requeteSql = null;
    static ResultSet resultatRequete = null;
    
    public static ArrayList<Caserne> getLesCasernes(Connection cnx){
        
        ArrayList<Caserne> lesCasernes= new ArrayList<Caserne>();
        try{
            requeteSql = cnx.prepareStatement("select * from caserne");
            resultatRequete = requeteSql.executeQuery();
            
            while (resultatRequete.next()){
                
                Caserne c = new Caserne();
                    c.setId(resultatRequete.getInt("cas_id"));
                    c.setNom(resultatRequete.getString("cas_nom"));
                    c.setRue(resultatRequete.getString("cas_rue"));
                    c.setCopos(resultatRequete.getInt("cas_copos"));
                    c.setVille(resultatRequete.getString("cas_ville"));
                    

                lesCasernes.add(c);
            }
           
        }
        catch (SQLException e){
            e.printStackTrace();
            System.out.println("La requête de getLesCasernes c généré une erreur");
        }
        return lesCasernes;
    }
    
    public static ArrayList<Pompier> getLesPompiersCaserneById(Connection cnx, int idCaserne){
    ArrayList<Pompier> lesPompiers = new ArrayList<Pompier>();
    try{
        PreparedStatement requeteSql = cnx.prepareStatement("SELECT pom_id, pom_nom, pom_prenom " +
                     "FROM pompier " +
                     "WHERE pom_caserne_id = ?");
        requeteSql.setInt(1, idCaserne);
        ResultSet resultatRequete = requeteSql.executeQuery();
        
        while (resultatRequete.next()){
            Pompier p = new Pompier();
            p.setId(resultatRequete.getInt("pom_id"));
            p.setNom(resultatRequete.getString("pom_nom"));
            p.setPrenom(resultatRequete.getString("pom_prenom"));
            lesPompiers.add(p); // Ajout du pompier à la liste
        }
    }
    catch (SQLException e){
        e.printStackTrace();
        System.out.println("La requête de getLesPompiersCaserneById a généré une erreur");
        }
    return lesPompiers;
    }
}
