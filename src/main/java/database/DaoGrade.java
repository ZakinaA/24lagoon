/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package database;

import static database.DaoGrade.requeteSql;
import static database.DaoGrade.resultatRequete;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Grade;
import model.Pompier;
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
            requeteSql = cnx.prepareStatement("SELECT gra_id, gra_libelle, gra_description, sur_libelle FROM grade, surgrade WHERE gra_surgrade_id = sur_id");
            resultatRequete = requeteSql.executeQuery();
            
            while (resultatRequete.next()){
                
                Grade g = new Grade();
                    g.setId(resultatRequete.getInt("gra_id"));
                    g.setLibelle(resultatRequete.getString("gra_libelle"));
                    g.setDescription(resultatRequete.getString("gra_description"));

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
     
     public static ArrayList<Pompier> getLesPompiersGradeById(Connection cnx, int idGrade){
         ArrayList<Pompier> lesPompiers = new ArrayList<Pompier>();
            try{
                requeteSql = cnx.prepareStatement("SELECT pom_id, pom_bip, pom_nom, pom_prenom, pom_dateNaiss, pom_indice " +
                                            "FROM pompier " +
                                            "WHERE pom_grade_id = ?");
                requeteSql.setInt(1, idGrade);
                resultatRequete = requeteSql.executeQuery();

                while (resultatRequete.next()) {
                    Pompier p = new Pompier();
                    p.setId(resultatRequete.getInt("pom_id"));
                    p.setBip(resultatRequete.getString("pom_bip"));
                    p.setNom(resultatRequete.getString("pom_nom"));
                    p.setPrenom(resultatRequete.getString("pom_prenom"));
                    Date dateNaiss = resultatRequete.getDate("pom_dateNaiss");
                    p.setDateNaiss(dateNaiss.toLocalDate());                    
                    p.setIndice(resultatRequete.getInt("pom_indice"));
                    
                    lesPompiers.add(p); // Ajout du pompier à la liste
                    }
                }
            catch (SQLException e){
                e.printStackTrace();
                System.out.println("La requête de getLesPompiersGradeById a généré une erreur");
                }
            return lesPompiers;
            }
     
     public static Grade getNomGradeById(Connection cnx, int idGrade){
         
        Grade nom = null;
        
        try{
            requeteSql = cnx.prepareStatement("select gra_id, gra_libelle " +
                         " from grade "+
                         " where gra_id= ? ");
            requeteSql.setInt(1, idGrade);
            resultatRequete = requeteSql.executeQuery();
            
            if (resultatRequete.next()){
  
                    nom = new Grade();
                    nom.setId(resultatRequete.getInt("gra_id"));
                    nom.setLibelle(resultatRequete.getString("gra_libelle"));
            }
           
        }
        catch (SQLException e){
            e.printStackTrace();
            System.out.println("La requête de getNomGradeById  a généré une erreur");
        }
        
        return nom;
    }
     
     public static Grade addGrade(Connection connection, Grade g){      
        int idGenere = -1;
        try
        {
            
            //preparation de la requete
            // id (clé primaire de la table client) est en auto_increment,donc on ne renseigne pas cette valeur
            // la paramètre RETURN_GENERATED_KEYS est ajouté à la requête afin de pouvoir récupérer l'id généré par la bdd (voir ci-dessous)
            // supprimer ce paramètre en cas de requête sans auto_increment.
            requeteSql=connection.prepareStatement("INSERT INTO grade ( gra_libelle, gra_description, gra_surgrade_id)\n" +
                    "VALUES (?,?,?)", PreparedStatement.RETURN_GENERATED_KEYS );
            requeteSql.setString(1, g.getLibelle());
            requeteSql.setString(2, g.getDescription());
            requeteSql.setInt(3, g.getUnSurgrade().getId());


           /* Exécution de la requête */
            requeteSql.executeUpdate();
            
             // Récupération de id auto-généré par la bdd dans la table client
            resultatRequete = requeteSql.getGeneratedKeys();
            while ( resultatRequete.next() ) {
                idGenere = resultatRequete.getInt( 1 );
                g.setId(idGenere);
            }
            
         
        }   
        catch (SQLException e) 
        {
            e.printStackTrace();
            //out.println("Erreur lors de l’établissement de la connexion");
        }
        return g ;    
    }
}
