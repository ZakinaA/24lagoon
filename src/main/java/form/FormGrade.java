/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package form;

import jakarta.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;
import model.Grade;
import model.Surgrade;

/**
 *
 * @author alexi
 */
public class FormGrade {
    
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
    private void validationLibelle( String libelle ) throws Exception {
        if ( libelle != null && libelle.length() < 3 ) {
        throw new Exception( "Le nom d'utilisateur doit contenir au moins 3 caractères." );
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
    
    
    public Grade ajouterGrade( HttpServletRequest request ) {
      
        Grade g  = new Grade();
         
        
        String libelle = getDataForm( request, "libelle" );
      
        int idSurgrade = Integer.parseInt((String)getDataForm( request, "idSurgrade" ));


      
        try {
             validationLibelle( libelle );
        } catch ( Exception e ) {
            setErreur( "nom", e.getMessage() );
        }
        g.setLibelle(libelle);

        if ( erreurs.isEmpty() ) {
            resultat = "Succès de l'ajout.";
        } else {
            resultat = "Échec de l'ajout.";
        }
       
        g.setUnSurgrade(new Surgrade(idSurgrade));
        
        return g ;
    }
}
