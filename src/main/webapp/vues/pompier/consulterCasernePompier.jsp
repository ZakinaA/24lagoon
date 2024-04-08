<%-- 
    Document   : consulterCasernePompier
    Created on : 1 avr. 2024, 12:48:38
    Author     : alexi
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Pompier"%>
<%@page import="model.Caserne"%>
<%@page import="model.Intervention"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SDIS WEB</title>
    </head>
    <body>
        <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>APPLICATION DE GESTION SDIS CALVADOS</title>
    </head>

    <body>
         <%
            Caserne nom = (Caserne)request.getAttribute("CaserneNom");
         %>
        <h1>Voici les pompiers de la caserne  <%  out.println(nom.getNom()); %></h1>

            <%
                ArrayList<Pompier> lesPompiers = (ArrayList)request.getAttribute("pCasernePompier");
            %>
            
            <%
                ArrayList<Intervention> lesInterventions = (ArrayList)request.getAttribute("pCaserneIntervention");
            %>
          
            <table>  
            <thead>
                <tr>             
                    <th>Id</th>
                    <th>Nom</th>
                    <th>Prenom</th>              
                </tr>
            </thead>
            <tbody>
                    <% if (lesPompiers != null && !lesPompiers.isEmpty()) { %>
                        <% for (Pompier p : lesPompiers) { %>
                            <tr>
                                <td><%= p.getId() %></td>
                                <td><%= p.getNom() %></td>
                                <td><%= p.getPrenom() %></td>
                                <!-- Ajoutez d'autres colonnes au besoin -->
                            </tr>
                        <% } %>
                    <% } else { %>
                        <tr>
                            <td colspan="3">Aucun pompier trouvé</td>
                        </tr>
                    <% } %>
            </tbody>
        </table>
            <table>
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Lieu</th>
                        <th>Date</th>
                        <th>Heure d'appel</th>
                        <th>Heure d'arrivée</th>
                        <th>Durée</th>
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
                            <td colspan="6">Aucune intervention trouvée</td>
                        </tr>
                    <% } %>
                </tbody>
            </table>

    </body>
    </body>
</html>
