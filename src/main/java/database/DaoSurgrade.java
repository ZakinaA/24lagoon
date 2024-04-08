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

     public static Surgrade addSurgrade(Connection connection, Surgrade s){      
        int idGenere = -1;
        try
        {
            
            //preparation de la requete
            // id (clé primaire de la table client) est en auto_increment,donc on ne renseigne pas cette valeur
            // la paramètre RETURN_GENERATED_KEYS est ajouté à la requête afin de pouvoir récupérer l'id généré par la bdd (voir ci-dessous)
            // supprimer ce paramètre en cas de requête sans auto_increment.
            requeteSql=connection.prepareStatement("INSERT INTO surgrade (sur_libelle)\n" +
                    "VALUES (?)", PreparedStatement.RETURN_GENERATED_KEYS );
            requeteSql.setString(1, s.getLibelle());
     



           /* Exécution de la requête */
            requeteSql.executeUpdate();
            
             // Récupération de id auto-généré par la bdd dans la table client
            resultatRequete = requeteSql.getGeneratedKeys();
            while ( resultatRequete.next() ) {
                idGenere = resultatRequete.getInt( 1 );
                s.setId(idGenere);
                
            }
            
         
        }   
        catch (SQLException e) 
        {
            e.printStackTrace();
            //out.println("Erreur lors de l’établissement de la connexion");
        }
        return s ;    
    }
}
