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
    
}
