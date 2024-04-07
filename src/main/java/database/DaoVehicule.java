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
import java.util.ArrayList;
import model.Caserne;
import model.TypeVehicule;
import model.Vehicule;

/**
 *
 * @author alexi
 */
public class DaoVehicule {
    Connection cnx;
    static PreparedStatement requeteSql = null;
    static ResultSet resultatRequete = null;
    
         public static ArrayList<Vehicule> getLesVehicules(Connection cnx){
        
            ArrayList<Vehicule> lesVehicules = new ArrayList<Vehicule>();
            try{
                requeteSql = cnx.prepareStatement("SELECT veh_id, veh_immat, veh_dateOrigine, veh_dateRevision, typ_nom, typ_caracteristiques \n" +
                                                    "FROM vehicule, type_vehicule\n" +
                                                    "WHERE veh_type_id = typ_id;");
                resultatRequete = requeteSql.executeQuery();

                while (resultatRequete.next()){

                    Vehicule v = new Vehicule();
                        v.setId(resultatRequete.getInt("veh_id"));
                        v.setImmatriculation(resultatRequete.getString("veh_immat"));
                        Date dateOrigine = resultatRequete.getDate("veh_dateOrigine");
                        v.setDateOrigine(dateOrigine.toLocalDate());
                        Date dateRevision = resultatRequete.getDate("veh_dateRevision");
                        v.setDateRevision(dateRevision.toLocalDate());
                        TypeVehicule t = new TypeVehicule();
                        t.setNom(resultatRequete.getString("typ_nom"));
                        t.setCaracteristiques(resultatRequete.getString("typ_caracteristiques"));

                    v.setTypeVehicule(t);

                    lesVehicules.add(v);
                }

            }
            catch (SQLException e){
                e.printStackTrace();
                System.out.println("La requête de getLesVehicules a généré une erreur");
            }
            return lesVehicules;
         }
         
    public static ArrayList<Vehicule> getLesVehiculesInterventionById(Connection cnx, int idIntervention){
         ArrayList<Vehicule> lesVehicules = new ArrayList<Vehicule>();
            try{
                requeteSql = cnx.prepareStatement("Select veh_id, veh_immat, veh_dateOrigine, veh_dateRevision " +
                                                    "From vehicule " +
                                                    "join intervention_vehicule " +
                                                    "on veh_id = vehicule_id_interventionvehicule " +
                                                    "join intervention " +
                                                    "on int_id = int_id_interventionvehicule " +
                                                    "where int_id = ?");
                requeteSql.setInt(1, idIntervention);
                resultatRequete = requeteSql.executeQuery();

                while (resultatRequete.next()){
                    Vehicule v = new Vehicule();
                    v.setId(resultatRequete.getInt("veh_id"));
                    v.setImmatriculation(resultatRequete.getString("veh_immat"));
                    
                    Date dateOrigine = resultatRequete.getDate("veh_dateOrigine");
                    v.setDateOrigine(dateOrigine.toLocalDate());
                    
                    Date dateRevision = resultatRequete.getDate("veh_dateRevision");
                    v.setDateRevision(dateRevision.toLocalDate());
                    lesVehicules.add(v); 
                }
            }
            catch (SQLException e){
                e.printStackTrace();
                System.out.println("La requête de getLesVehiculesInterventionById a généré une erreur");
                }
            return lesVehicules;
            }
    
    public static ArrayList<Vehicule> getLesVehiculesTypeVehiculeById(Connection cnx, int idTypeVehicule){
         ArrayList<Vehicule> lesVehicules = new ArrayList<Vehicule>();
            try{
                requeteSql = cnx.prepareStatement("select veh_id, veh_immat, veh_dateOrigine, veh_dateRevision, cas_id, cas_nom \n" +
                                                "from vehicule " +
                                                "join caserne " +
                                                "on cas_id = veh_caserne_id " +
                                                "join type_vehicule " +
                                                "on veh_id = typ_id " +
                                                "where veh_type_id = ?");
                requeteSql.setInt(1, idTypeVehicule);
                resultatRequete = requeteSql.executeQuery();

                while (resultatRequete.next()){
                    Vehicule v = new Vehicule();
                    v.setId(resultatRequete.getInt("veh_id"));
                    v.setImmatriculation(resultatRequete.getString("veh_immat"));
                    
                    Date dateOrigine = resultatRequete.getDate("veh_dateOrigine");
                    v.setDateOrigine(dateOrigine.toLocalDate());
                    
                    Date dateRevision = resultatRequete.getDate("veh_dateRevision");
                    v.setDateRevision(dateRevision.toLocalDate());
                    
                    Caserne c = new Caserne();
                    c.setId(resultatRequete.getInt("cas_id"));
                    c.setNom(resultatRequete.getString("cas_nom"));
                    
                    v.setUneCaserne(c);
                    lesVehicules.add(v); 
                }
            }
            catch (SQLException e){
                e.printStackTrace();
                System.out.println("La requête de getLesVehiculesTypeVehiculeById a généré une erreur");
                }
            return lesVehicules;
            }
    
}
