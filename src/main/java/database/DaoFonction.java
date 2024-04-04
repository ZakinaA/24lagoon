/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package database;

import static database.DaoFonction.requeteSql;
import static database.DaoFonction.resultatRequete;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Fonction;
import model.Grade;
import model.Pompier;

/**
 *
 * @author ts1sio
 */
public class DaoFonction {
    
    Connection cnx;
    static PreparedStatement requeteSql = null;
    static ResultSet resultatRequete = null;
    
    public static ArrayList<Fonction> getLesFonctions(Connection cnx){
        
        ArrayList<Fonction> lesFonctions = new ArrayList<Fonction>();
        try{
            requeteSql = cnx.prepareStatement("select * from fonction");
            resultatRequete = requeteSql.executeQuery();
            
            while (resultatRequete.next()){
                
                Fonction f = new Fonction();
                    f.setId(resultatRequete.getInt("fon_id"));
                    f.setLibelle(resultatRequete.getString("fon_libelle"));

                lesFonctions.add(f);
            }
           
        }
        catch (SQLException e){
            e.printStackTrace();
            System.out.println("La requête de getLesFonctions a généré une erreur");
        }
        return lesFonctions;
    }
    
    public static ArrayList<Pompier> getLesPompiersFonctionById(Connection cnx, int idFonction){
         ArrayList<Pompier> lesPompiers = new ArrayList<Pompier>();
            try{
                PreparedStatement requeteSql = cnx.prepareStatement("SELECT pom_id, pom_nom, pom_prenom from pompier\n" +
                                                                    "JOIN pompier_fonction \n" +
                                                                    "ON pom_id = pom_id_pompierfonction\n" +
                                                                    "JOIN fonction\n" +
                                                                    "ON fon_id = fonction_id_pompierfonction\n" +
                                                                    "WHERE fon_id = ?");
                requeteSql.setInt(1, idFonction);
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
                System.out.println("La requête de getLesPompiersFonctionById a généré une erreur");
                }
            return lesPompiers;
            }
    
     public static Fonction getNomFonctionById(Connection cnx, int idFonction){
         
        Fonction nom = null;
        
        try{
            requeteSql = cnx.prepareStatement("select fon_id, fon_libelle " +
                         " from fonction "+
                         " where fon_id= ? ");
            requeteSql.setInt(1, idFonction);
            resultatRequete = requeteSql.executeQuery();
            
            if (resultatRequete.next()){
  
                    nom = new Fonction();
                    nom.setId(resultatRequete.getInt("fon_id"));
                    nom.setLibelle(resultatRequete.getString("fon_libelle"));
            }
           
        }
        catch (SQLException e){
            e.printStackTrace();
            System.out.println("La requête de getNomFonctionById  a généré une erreur");
        }
        
        return nom;
    }
}
