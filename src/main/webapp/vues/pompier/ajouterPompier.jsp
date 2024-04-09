<%-- 
    Document   : ajouterPompier
    Created on : 18 mars 2024, 13:30:47
    Author     : zakina
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Caserne"%>
<%@page import="model.Grade"%>
<%@page import="form.FormPompier"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SDIS WEB</title>
    </head>
    <body>
        <h1>NOUVEAU POMPIER</h1>
        
            <%
                FormPompier form = (FormPompier)request.getAttribute("form");
            %>
        
        <form class="form-inline" action="ajouter" method="POST">
              
                <label for="nom">NOM : </label>
                <input id="nom" type="text" name="nom"  size="30" maxlength="30">
                </br>
                
                <label for="prenom">PRENOM : </label>
                <input id="prenom"  type="text"  name="prenom" size="30" maxlength="30">      
                 </br>
                 
                 <label for="dateNaiss">DATE NAISSANCE : </label>
                 <input id="dateNaiss" type="date" name="dateNaiss">
                 </br>
                 
                <label for="indice"> INDICE : </label>
                <input id="indice" type="number" name="indice" pattern="[0-9]{1,2,3}">
                 </br>
                
                <%-- Champ Liste des caserbes --%>
                <label for="caserne">Caserne : </label>
                <select name="idCaserne">
                    <%
                        ArrayList<Caserne> lesCasernes= (ArrayList)request.getAttribute("pLesCasernes");
                        for (int i=0; i<lesCasernes.size();i++){
                            Caserne c = lesCasernes.get(i);
                            out.println("<option value='" + c.getId()+"'>" + c.getNom()+"</option>" );
                        }
                    %>
                </select>
                </br>
                
                <label for="grade">Grade : </label>
                <select name="idGrade">
                    <%
                        ArrayList<Grade> lesGrades= (ArrayList)request.getAttribute("pLesGrades");
                        for (int i=0; i<lesGrades.size();i++){
                            Grade g = lesGrades.get(i);
                            out.println("<option value='" + g.getId()+"'>" + g.getLibelle()+"</option>" );
                        }
                    %>
                </select>
                </br>        
                               
            <input type="submit" name="valider" id="valider" value="Valider"/>
            </form>
        
        
        
        
    </body>
</html>
