<%-- 
    Document   : consulterFonction
    Created on : 2 avr. 2024, 20:42:21
    Author     : alexi
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.Pompier"%>
<%@page import="model.Fonction"%>
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
            Fonction nom = (Fonction)request.getAttribute("FonctionNom");
        %>
        <h1>Voici les pompiers de cette fonction <%  out.println(nom.getLibelle());%> </h1>

            <%
                ArrayList<Pompier> lesPompiers = (ArrayList)request.getAttribute("pFonctionPompier");
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
    </body>
    </body>
</html>