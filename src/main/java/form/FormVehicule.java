/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package form;

import jakarta.servlet.http.HttpServletRequest;
import java.util.Map;
import java.util.HashMap;
import model.Vehicule;
import java.time.LocalDate;
import model.Caserne;
import model.TypeVehicule;

/**
 *
 * @author alexi
 */
public class FormVehicule {
    
    private String resultat;
    private Map<String, String> erreurs = new HashMap<String, String>();

    public String getResultat() {
        return resultat;
    }

    public void setResultat(String resultat) {
        this.resultat = resultat;
    }

    public Map<String, String> getErreurs() {
        return erreurs;
    }

    public void setErreurs(Map<String, String> erreurs) {
        this.erreurs = erreurs;
    }
    
    //méthode de validation du champ de saisie nom
    private void validationImmatriculation( String immatriculation ) throws Exception {
        if ( immatriculation != null && immatriculation.length() == 7 ) {
        throw new Exception( "L'immatriculation doit contenir 7 caractères." );
        }
    }

    private void setErreur( String champ, String message ) {
    erreurs.put(champ, message );
    }    
    
    private static String getDataForm( HttpServletRequest request, String nomChamp ) {
        String valeur = request.getParameter( nomChamp );
        if ( valeur == null || valeur.trim().length() == 0 ) {
            return null;
        } else {
            return valeur.trim();
        }   
    }
    
    
    public Vehicule ajouterVehicule( HttpServletRequest request ) {
      
        Vehicule v  = new Vehicule();
         
        
        String immatriculation = getDataForm( request, "immatriculation" );
        
        String dateOrigineStr = getDataForm(request, "dateOrigine");
        LocalDate dateOrigine = LocalDate.parse(dateOrigineStr);
        
        String dateRevisionStr = getDataForm(request, "dateRevision");
        LocalDate dateRevision = LocalDate.parse(dateRevisionStr);
        
        int idTypeVehicule = Integer.parseInt((String)getDataForm( request, "idTypeVehicule" ));
        int idCaserne = Integer.parseInt((String)getDataForm( request, "idCaserne" ));

      
        try {
             validationImmatriculation( immatriculation );
        } catch ( Exception e ) {
            setErreur( "nom", e.getMessage() );
        }
        v.setImmatriculation(immatriculation);

        if ( erreurs.isEmpty() ) {
            resultat = "Succès de l'ajout.";
        } else {
            resultat = "Échec de l'ajout.";
        }
         
        v.setDateOrigine(dateOrigine);
        v.setDateRevision(dateRevision);
        v.setTypeVehicule(new TypeVehicule(idTypeVehicule));
        v.setUneCaserne(new Caserne(idCaserne));
        
        return v ;
    }
    
}
