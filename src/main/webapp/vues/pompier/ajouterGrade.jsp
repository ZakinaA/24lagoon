<%-- 
    Document   : ajouterGrade
    Created on : 9 avr. 2024, 13:03:47
    Author     : alexi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Surgrade"%>
<%@page import="form.FormGrade"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SDIS WEB</title>
    </head>
    <body>
        <h1>NOUVEAU GRADE</h1>
        
            <%
                FormGrade form = (FormGrade)request.getAttribute("form");
            %>
        
        <form class="form-inline" action="ajouter" method="POST">
              
                <label for="libelle">LIBELLE : </label>
                <input id="libelle" type="text" name="libelle"  size="30" maxlength="30">
                </br>
  
                <%-- Champ Liste des caserbes --%>
                <label for="surgrade">SURGRADE : </label>
                <select name="idSurgrade">
                    <%
                        ArrayList<Surgrade> lesSurgrades = (ArrayList)request.getAttribute("pLesSurgrades");
                        for (int i=0; i<lesSurgrades.size();i++){
                            Surgrade s = lesSurgrades.get(i);
                            out.println("<option value='" + s.getId()+"'>" + s.getLibelle()+"</option>" );
                        }
                    %>
                </select>
                </br>             
            <input type="submit" name="valider" id="valider" value="Valider"/>
            </form>
        
        
        
        
    </body>
</html>