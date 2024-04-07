/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package database;

import static database.DaoIntervention.resultatRequete;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Intervention;
import java.sql.Date;
import java.sql.Time;
import java.time.LocalTime;



/**
 *
 * @author ts1sio
 */
public class DaoIntervention {
    
    Connection cnx;
    static PreparedStatement requeteSql = null;
    static ResultSet resultatRequete = null;
    
    public static ArrayList<Intervention> getInterventionCaserneById(Connection cnx, int idCaserne){
        
         ArrayList<Intervention> Intervention = new ArrayList<Intervention>();
            try{
                requeteSql = cnx.prepareStatement("select * " +
                                                                    " from intervention "+
                                                                    "inner join caserne "+
                                                                    " on cas_id = int_caserne_id "+
                                                                    " where cas_id = ?");
                requeteSql.setInt(1, idCaserne);
                resultatRequete = requeteSql.executeQuery();

                while (resultatRequete.next()){
                    Intervention i = new Intervention();
                    i.setId(resultatRequete.getInt("int_id"));
                    i.setLieu(resultatRequete.getString("int_lieu"));
                    
                    Date date = resultatRequete.getDate("int_date");
                    i.setDate(date.toLocalDate());

                    Time heureAppel = resultatRequete.getTime("int_heureAppel");
                    i.setHeureAppel(heureAppel.toLocalTime());
                    
                    Time heureArrivee = resultatRequete.getTime("int_heureArrivee");
                    i.setHeureArrivee(heureArrivee.toLocalTime());
                    
                    Time duree = resultatRequete.getTime("int_duree");
                    i.setDuree(duree.toLocalTime());

                    
                    Intervention.add(i);
                }
            }
            catch (SQLException e){
                e.printStackTrace();
                System.out.println("La requête de getInterventionCaserneById a généré une erreur");
                }
            return Intervention;
            }
    
    public static ArrayList<Intervention> getInterventionPompierById(Connection cnx, int idPompier){
         ArrayList<Intervention> Intervention = new ArrayList<Intervention>();
            try{
                PreparedStatement requeteSql = cnx.prepareStatement("SELECT int_id, int_lieu, int_date, int_heureAppel, int_heureArrivee, int_duree " +
                                                                    "FROM intervention " +
                                                                    "WHERE int_id IN (SELECT intervention_id_pompierintervention FROM pompier_intervention WHERE pom_id_pompierintervention = ?)");
                requeteSql.setInt(1, idPompier);
                ResultSet resultatRequete = requeteSql.executeQuery();

                while (resultatRequete.next()){
                    Intervention i = new Intervention();
                    i.setId(resultatRequete.getInt("int_id"));
                    i.setLieu(resultatRequete.getString("int_lieu"));
                    
                    Date date = resultatRequete.getDate("int_date");
                    i.setDate(date.toLocalDate());

                    Time heureAppel = resultatRequete.getTime("int_heureAppel");
                    i.setHeureAppel(heureAppel.toLocalTime());
                    
                    Time heureArrivee = resultatRequete.getTime("int_heureArrivee");
                    i.setHeureArrivee(heureArrivee.toLocalTime());
                    
                    Time duree = resultatRequete.getTime("int_duree");
                    i.setDuree(duree.toLocalTime());

                    
                    Intervention.add(i);
                }
            }
            catch (SQLException e){
                e.printStackTrace();
                System.out.println("La requête de getInterventionPompierById a généré une erreur");
                }
            return Intervention;
            }
    
    public static ArrayList<Intervention> getInterventionVehiculeById(Connection cnx, int idVehicule){
         ArrayList<Intervention> Intervention = new ArrayList<Intervention>();
            try{
                PreparedStatement requeteSql = cnx.prepareStatement("SELECT int_id, int_lieu, int_date, int_heureAppel, int_heureArrivee, int_duree " +
                                                                    "FROM intervention " +
                                                                    "WHERE int_id IN (SELECT int_id_interventionvehicule FROM intervention_vehicule WHERE vehicule_id_interventionvehicule = ?)");
                requeteSql.setInt(1, idVehicule);
                ResultSet resultatRequete = requeteSql.executeQuery();

                while (resultatRequete.next()){
                    Intervention i = new Intervention();
                    i.setId(resultatRequete.getInt("int_id"));
                    i.setLieu(resultatRequete.getString("int_lieu"));
                    
                    Date date = resultatRequete.getDate("int_date");
                    i.setDate(date.toLocalDate());

                    Time heureAppel = resultatRequete.getTime("int_heureAppel");
                    i.setHeureAppel(heureAppel.toLocalTime());
                    
                    Time heureArrivee = resultatRequete.getTime("int_heureArrivee");
                    i.setHeureArrivee(heureArrivee.toLocalTime());
                    
                    Time duree = resultatRequete.getTime("int_duree");
                    i.setDuree(duree.toLocalTime());

                    
                    Intervention.add(i);
                    
                }
            }
            catch (SQLException e){
                e.printStackTrace();
                System.out.println("La requête de getInterventionVehiculeById a généré une erreur");
                }
            return Intervention;
            }
    
    public static ArrayList<Intervention> getInterventionSituationById(Connection cnx, int idSituation){
         ArrayList<Intervention> Intervention = new ArrayList<Intervention>();
            try{
                PreparedStatement requeteSql = cnx.prepareStatement("SELECT int_id, int_lieu, int_date, int_heureAppel, int_heureArrivee, int_duree FROM intervention\n" +
                                                                        "join intervention_situation\n" +
                                                                        "on int_id = int_id_interventionsituation\n" +
                                                                        "join situation \n" +
                                                                        "on sit_id = sit_id_interventionsituation\n" +
                                                                        "where sit_id = ?");
                requeteSql.setInt(1, idSituation);
                ResultSet resultatRequete = requeteSql.executeQuery();

                while (resultatRequete.next()){
                    Intervention i = new Intervention();
                    i.setId(resultatRequete.getInt("int_id"));
                    i.setLieu(resultatRequete.getString("int_lieu"));
                    
                    Date date = resultatRequete.getDate("int_date");
                    i.setDate(date.toLocalDate());

                    Time heureAppel = resultatRequete.getTime("int_heureAppel");
                    i.setHeureAppel(heureAppel.toLocalTime());
                    
                    Time heureArrivee = resultatRequete.getTime("int_heureArrivee");
                    i.setHeureArrivee(heureArrivee.toLocalTime());
                    
                    Time duree = resultatRequete.getTime("int_duree");
                    i.setDuree(duree.toLocalTime());
                    
                    Intervention.add(i);
                    
                }
            }
            catch (SQLException e){
                e.printStackTrace();
                System.out.println("La requête de getInterventionSituationById a généré une erreur");
                }
            return Intervention;
            }
    
    public static ArrayList<Intervention> getLesInterventions(Connection cnx){
        
        ArrayList<Intervention> lesInterventions = new ArrayList<Intervention>();
        try{
            requeteSql = cnx.prepareStatement("select int_id, int_lieu, int_date, int_heureAppel, int_heureArrivee, int_duree from intervention");
            resultatRequete = requeteSql.executeQuery();
            
            while (resultatRequete.next()){
                
                Intervention i = new Intervention();
                    i.setId(resultatRequete.getInt("int_id"));
                    i.setLieu(resultatRequete.getString("int_lieu"));
      
                    Date lieu = resultatRequete.getDate("int_date");
                    i.setDate(lieu.toLocalDate());
                    
                    Time heureAppel = resultatRequete.getTime("int_heureAppel");
                    i.setHeureAppel(heureAppel.toLocalTime());
                            
                    Time heureArrivee = resultatRequete.getTime("int_heureArrivee");
                    i.setHeureArrivee(heureArrivee.toLocalTime());
                    
                    Time duree = resultatRequete.getTime("int_duree");
                    i.setDuree(duree.toLocalTime());
                    

                lesInterventions.add(i);
            }
           
        }
        catch (SQLException e){
            e.printStackTrace();
            System.out.println("La requête de getLesInterventions a généré une erreur");
        }
        return lesInterventions;
    }
}
