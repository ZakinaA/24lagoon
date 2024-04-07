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
import model.TypeVehicule;

/**
 *
 * @author alexi
 */
public class DaoTypeVehicule {
    
    Connection cnx;
    static PreparedStatement requeteSql = null;
    static ResultSet resultatRequete = null;
    
    public static ArrayList<TypeVehicule> getLesTypesVehicules(Connection cnx){
        
            ArrayList<TypeVehicule> lesTypesVehicules = new ArrayList<TypeVehicule>();
            try{
                requeteSql = cnx.prepareStatement("select * from type_vehicule ");
                resultatRequete = requeteSql.executeQuery();

                while (resultatRequete.next()){

                        TypeVehicule tv = new TypeVehicule();
                        tv.setId(resultatRequete.getInt("typ_id"));
                        tv.setNom(resultatRequete.getString("typ_nom"));
                        tv.setCaracteristiques(resultatRequete.getString("typ_caracteristiques"));
                        
                    lesTypesVehicules.add(tv);
                }

            }
            catch (SQLException e){
                e.printStackTrace();
                System.out.println("La requête de getLesVehicules a généré une erreur");
            }
            return lesTypesVehicules;
         }
}
