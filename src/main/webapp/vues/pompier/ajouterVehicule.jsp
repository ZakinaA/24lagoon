<%-- 
    Document   : ajouterVehicule
    Created on : 9 avr. 2024, 16:55:45
    Author     : alexi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Caserne"%>
<%@page import="model.TypeVehicule"%>
<%@page import="form.FormVehicule"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SDIS WEB</title>
    </head>
    <body>
        <h1>NOUVEAU VEHICULE</h1>
        
            <%
                FormVehicule form = (FormVehicule)request.getAttribute("form");
            %>
        
        <form class="form-inline" action="ajouter" method="POST">
              
                <label for="immatriculation">IMMATRICULATION : </label>
                <input id="immatriculation" type="text" name="immatriculation"  size="30" maxlength="30">
                </br>
                
                <label for="dateOrigine">DATE ORIGINE : </label>
                <input id="dateOrigine"  type="date"  name="dateOrigine" size="30" maxlength="30">      
                 </br>
                 
                 <label for="dateRevision">DATE REVISION : </label>
                 <input id="dateRevision" type="date" name="dateRevision">
                 </br>
                 
                <%-- Champ Liste des caserbes --%>
                <label for="typevehicule">TYPE VEHICULE : </label>
                <select name="idTypeVehicule">
                    <%
                        ArrayList<TypeVehicule> lesTypesVehicules = (ArrayList)request.getAttribute("vLesTypesVehicules");
                        for (int i=0; i< lesTypesVehicules.size();i++){
                            TypeVehicule tv = lesTypesVehicules.get(i);
                            out.println("<option value='" + tv.getId()+"'>" + tv.getNom()+"</option>" );
                        }
                    %>
                </select>
                </br>
                
                <label for="caserne">Caserne : </label>
                <select name="idCaserne">
                    <%
                        ArrayList<Caserne> lesCasernes= (ArrayList)request.getAttribute("cLesCasernes");
                        for (int i=0; i< lesCasernes.size();i++){
                            Caserne c = lesCasernes.get(i);
                            out.println("<option value='" + c.getId()+"'>" + c.getNom()+"</option>" );
                        }
                    %>
                </select>
                </br>        
                               
            <input type="submit" name="valider" id="valider" value="Valider"/>
            </form>
        
        
        
        
    </body>
</html>