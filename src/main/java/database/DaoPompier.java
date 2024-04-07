 /*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package database;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import model.Caserne;
import model.Grade;
import model.Pompier;

/**
 *
 * @author zakina
 */
public class DaoPompier {
    
    Connection cnx;
    static PreparedStatement requeteSql = null;
    static ResultSet resultatRequete = null;
    
    public static ArrayList<Pompier> getLesPompiers(Connection cnx){
        
        ArrayList<Pompier> lesPompiers = new ArrayList<Pompier>();
        try{
            requeteSql = cnx.prepareStatement("select pom_id, pom_nom, pom_prenom, cas_id, cas_nom " +
                         " from pompier inner join caserne  " +
                         " on pom_caserne_id = cas_id  ");
            resultatRequete = requeteSql.executeQuery();
            
            while (resultatRequete.next()){
                
                Pompier p = new Pompier();
                    p.setId(resultatRequete.getInt("pom_id"));
                    p.setNom(resultatRequete.getString("pom_nom"));
                    p.setPrenom(resultatRequete.getString("pom_prenom"));
                Caserne c = new Caserne();
                    c.setId(resultatRequete.getInt("cas_id"));
                    c.setNom(resultatRequete.getString("cas_nom"));
                
                p.setUneCaserne(c);
                
                lesPompiers.add(p);
            }
           
        }
        catch (SQLException e){
            e.printStackTrace();
            System.out.println("La requête de getLesPompiers e généré une erreur");
        }
        return lesPompiers;
    }
    
    public static Pompier getPompierById(Connection cnx, int idPompier){
        
        Pompier p = null ;
        try{
            requeteSql = cnx.prepareStatement("select pom_id, pom_nom, pom_prenom, pom_dateNaiss, pom_indice, cas_id, cas_nom, gra_id, gra_libelle " +
                         " from pompier inner join caserne  " +
                         " on pom_caserne_id = cas_id "+
                         " inner join grade "+
                         " on gra_id = pom_grade_id "+
                         " where pom_id= ? ");
            requeteSql.setInt(1, idPompier);
            resultatRequete = requeteSql.executeQuery();
            
            if (resultatRequete.next()){
                
                    p = new Pompier();
                    p.setId(resultatRequete.getInt("pom_id"));
                    p.setNom(resultatRequete.getString("pom_nom"));
                    p.setPrenom(resultatRequete.getString("pom_prenom"));
                    
                    Date dateNaiss = resultatRequete.getDate("pom_dateNaiss");
                    p.setDateNaiss(dateNaiss.toLocalDate());
                    
                    p.setIndice(resultatRequete.getInt("pom_indice"));
                    
                    Caserne c = new Caserne();
                    c.setId(resultatRequete.getInt("cas_id"));
                    c.setNom(resultatRequete.getString("cas_nom"));
                    
                    Grade g = new Grade();
                    g.setId(resultatRequete.getInt("gra_id"));
                    g.setLibelle(resultatRequete.getString("gra_libelle"));
                    
                
                p.setUneCaserne(c);
                p.setUnGrade(g);
                
                
            }
           
        }
        catch (SQLException e){
            e.printStackTrace();
            System.out.println("La requête de getPompierById  a généré une erreur");
        }
        return p ;
    }
    
    
    public static Pompier addPompier(Connection connection, Pompier p){      
        int idGenere = -1;
        try
        {
            
            //preparation de la requete
            // id (clé primaire de la table client) est en auto_increment,donc on ne renseigne pas cette valeur
            // la paramètre RETURN_GENERATED_KEYS est ajouté à la requête afin de pouvoir récupérer l'id généré par la bdd (voir ci-dessous)
            // supprimer ce paramètre en cas de requête sans auto_increment.
            requeteSql=connection.prepareStatement("INSERT INTO pompier ( pom_nom, pom_prenom, pom_dateNaiss, pom_indice, pom_caserne_id, pom_grade_id)\n" +
                    "VALUES (?,?,?,?,?,?)", PreparedStatement.RETURN_GENERATED_KEYS );
            requeteSql.setString(1, p.getNom());
            requeteSql.setString(2, p.getPrenom());
            LocalDate dateNaissance = p.getDateNaiss();
            Date dateNaiss = Date.valueOf(dateNaissance);
            requeteSql.setDate(3,dateNaiss);
            requeteSql.setInt(4, p.getIndice());
            requeteSql.setInt(5, p.getUneCaserne().getId());
            requeteSql.setInt(6, p.getUnGrade().getId());


           /* Exécution de la requête */
            requeteSql.executeUpdate();
            
             // Récupération de id auto-généré par la bdd dans la table client
            resultatRequete = requeteSql.getGeneratedKeys();
            while ( resultatRequete.next() ) {
                idGenere = resultatRequete.getInt( 1 );
                p.setId(idGenere);
                
                p = DaoPompier.getPompierById(connection, p.getId());
            }
            
         
        }   
        catch (SQLException e) 
        {
            e.printStackTrace();
            //out.println("Erreur lors de l’établissement de la connexion");
        }
        return p ;    
    }
    
    public static ArrayList<Pompier> getLesPompiersInterventionById(Connection cnx, int idIntervention){
         ArrayList<Pompier> lesPompiers = new ArrayList<Pompier>();
            try{
                requeteSql = cnx.prepareStatement("select pom_id, pom_bip, pom_nom, pom_prenom, pom_dateNaiss, pom_indice " +
                                                                    "from pompier " +
                                                                    "join pompier_intervention " +
                                                                    "on pom_id = pom_id_pompierintervention " +
                                                                    "join intervention " +
                                                                    "on int_id = intervention_id_pompierintervention " +
                                                                    "where int_id = ?");
                requeteSql.setInt(1, idIntervention);
                resultatRequete = requeteSql.executeQuery();

                while (resultatRequete.next()){
                    Pompier p = new Pompier();
                    p.setId(resultatRequete.getInt("pom_id"));
                    p.setNom(resultatRequete.getString("pom_nom"));
                    p.setBip(resultatRequete.getString("pom_bip"));
                    p.setPrenom(resultatRequete.getString("pom_prenom"));
                    
                    Date dateNaiss = resultatRequete.getDate("pom_dateNaiss");
                    p.setDateNaiss(dateNaiss.toLocalDate());
                    
                    p.setIndice(resultatRequete.getInt("pom_indice"));
 

                    lesPompiers.add(p); 
                }
            }
            catch (SQLException e){
                e.printStackTrace();
                System.out.println("La requête de getLesPompiersInterventionById a généré une erreur");
                }
            return lesPompiers;
            }
    
}
