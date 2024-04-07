<%-- 
    Document   : consulterTypeVehicule
    Created on : 7 avr. 2024, 19:29:05
    Author     : alexi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Vehicule"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SDIS WEB</title>
    </head>
    <body>
         <%
            ArrayList<Vehicule> lesVehicules = (ArrayList)request.getAttribute("vLesVehicules");
        %>
       
        <h1>Voici les véhicules de ce type </h1>
            <table>  
            <thead>
                <tr>             
                    <th>Id</th>
                    <th>Immatriculation</th>
                    <th>Date d'origne</th>
                    <th>Date révision</th>
                    <th>Caserne</th>
                </tr>
            </thead>
            <tbody>
                <% if (lesVehicules != null && !lesVehicules.isEmpty()) { %>
                    <% for (Vehicule v : lesVehicules) { %>
                        <tr>
                            <td><%= v.getId() %></td>
                            <td><%= v.getImmatriculation() %></td>     
                            <td><%= v.getDateOrigine() %></td>                 
                            <td><%= v.getDateRevision() %></td>                 
                            <td><%= v.getUneCaserne().getNom() %></td>                 
                        </tr>
                    <% } %>
                <% } else { %>
                    <tr>
                        <td colspan="2">Aucun véhicules trouvés</td>
                    </tr>
                <% } %>
        </tbody>    
        </table>
    </body>
</html>