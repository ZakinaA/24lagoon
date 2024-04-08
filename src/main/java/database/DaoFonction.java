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
                requeteSql = cnx.prepareStatement("SELECT pom_id, pom_nom, pom_prenom from pompier\n" +
                                                                    "JOIN pompier_fonction \n" +
                                                                    "ON pom_id = pom_id_pompierfonction\n" +
                                                                    "JOIN fonction\n" +
                                                                    "ON fon_id = fonction_id_pompierfonction\n" +
                                                                    "WHERE fon_id = ?");
                requeteSql.setInt(1, idFonction);
                resultatRequete = requeteSql.executeQuery();

                while (resultatRequete.next()){
                    Pompier p = new Pompier();
                    p.setId(resultatRequete.getInt("pom_id"));
                    p.setNom(resultatRequete.getString("pom_nom"));
                    p.setPrenom(resultatRequete.getString("pom_prenom"));
                    lesPompiers.add(p); 
                }
            }
            catch (SQLException e){
                e.printStackTrace();
                System.out.println("La requête de getLesPompiersFonctionById a généré une erreur");
                }
            return lesPompiers;
            }
    
    public static ArrayList<Fonction> getLesFonctionsPompierById(Connection cnx, int idPompier){
         ArrayList<Fonction> lesFonctions = new ArrayList<Fonction>();
            try{
                requeteSql = cnx.prepareStatement("select fon_id, fon_libelle "
                                                                    + "from fonction "
                                                                    + "join pompier_fonction "
                                                                    + "on fonction_id_pompierfonction = fon_id "
                                                                    + "join pompier "
                                                                    + "on pom_id_pompierfonction = pom_id "
                                                                    + "where pom_id = ?");
                requeteSql.setInt(1, idPompier);
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
                System.out.println("La requête de getLesPompiersFonctionById a généré une erreur");
                }
            return lesFonctions;
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
     
     public static Fonction addFonction(Connection connection, Fonction f){      
        int idGenere = -1;
        try
        {
            
            //preparation de la requete
            // id (clé primaire de la table client) est en auto_increment,donc on ne renseigne pas cette valeur
            // la paramètre RETURN_GENERATED_KEYS est ajouté à la requête afin de pouvoir récupérer l'id généré par la bdd (voir ci-dessous)
            // supprimer ce paramètre en cas de requête sans auto_increment.
            requeteSql=connection.prepareStatement("INSERT INTO fonction (fon_libelle)\n" +
                    "VALUES (?)", PreparedStatement.RETURN_GENERATED_KEYS );
            requeteSql.setString(1, f.getLibelle());
     



           /* Exécution de la requête */
            requeteSql.executeUpdate();
            
             // Récupération de id auto-généré par la bdd dans la table client
            resultatRequete = requeteSql.getGeneratedKeys();
            while ( resultatRequete.next() ) {
                idGenere = resultatRequete.getInt( 1 );
                f.setId(idGenere);
                
            }
            
         
        }   
        catch (SQLException e) 
        {
            e.printStackTrace();
            //out.println("Erreur lors de l’établissement de la connexion");
        }
        return f ;    
    }
}
