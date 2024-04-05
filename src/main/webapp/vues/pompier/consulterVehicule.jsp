<%-- 
    Document   : consulterVehicule
    Created on : 5 avr. 2024, 22:42:47
    Author     : alexi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Intervention"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SDIS WEB</title>
    </head>
    <body>
         <%
            ArrayList<Intervention> lesInterventions = (ArrayList)request.getAttribute("vLesVehicules");
        %>
       
        <h1>Voici les interventions du véhicule</h1>
            <table>  
            <thead>
                <tr>             
                    <th>Id</th>
                    <th>Lieu</th>
                    <th>Date</th>
                    <th>Heure d'appel</th>
                    <th>Heure d'arriver</th>
                    <th>Duree</th>
                </tr>
            </thead>
            <tbody>
                <% if (lesInterventions != null && !lesInterventions.isEmpty()) { %>
                    <% for (Intervention i : lesInterventions) { %>
                        <tr>
                            <td><%= i.getId() %></td>
                            <td><%= i.getLieu() %></td>     
                            <td><%= i.getDate() %></td>                 
                            <td><%= i.getHeureAppel() %></td>                 
                            <td><%= i.getHeureArrivee() %></td>                 
                            <td><%= i.getDuree() %></td>                 

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
