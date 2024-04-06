<%-- 
    Document   : consulterSituation
    Created on : 6 avr. 2024, 20:04:03
    Author     : Minh-Tri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Situation"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SDIS WEB</title>
    </head>
    <body>
         <%
            ArrayList<Situation> lesSituations = (ArrayList)request.getAttribute("sLesSituations");
        %>
       
        <h1>Voici les interventions lié à cette situation</h1>
            <table>  
            <thead>
                <tr>             
                    <th>Id</th>
                    <th>Libelle</th>
                </tr>
            </thead>
            <tbody>
                <% if (lesSituations != null && !lesSituations.isEmpty()) { %>
                    <% for (Situations s : lesSituations) { %>
                        <tr>
                            <td><%= i.getId() %></td>
                            <td><%= i.getLibelle() %></td>                    

                        </tr>
                    <% } %>
                <% } else { %>
                    <tr>
                        <td colspan="2">Aucune intervention trouvée</td>
                    </tr>
                <% } %>
        </tbody>    
        </table>
    </body>
</html>
