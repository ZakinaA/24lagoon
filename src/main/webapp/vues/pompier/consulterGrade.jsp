<%-- 
    Document   : consulterGrade
    Created on : 2 avr. 2024, 16:28:26
    Author     : alexi
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.Pompier"%>
<%@page import="model.Grade"%>
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
            Grade nom = (Grade)request.getAttribute("GradeNom");
         %>
        <h1>Voici les pompiers ayant ce grade <%  out.println(nom.getLibelle());%> </h1>

            <%
                ArrayList<Pompier> lesPompiers = (ArrayList)request.getAttribute("pGradePompier");
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
                            <td><%= p.getBip() %></td>    
                            <td><%= p.getNom() %></td>                 
                            <td><%= p.getPrenom() %></td>                 
                            <td><%= p.getDateNaiss() %></td>                 
                            <td><%= p.getIndice() %></td>                 
                        </tr>
                    <% } %>
                <% } else { %>
                    <tr>
                        <td colspan="6">Aucun pompier trouvé</td>
                    </tr>
                <% } %>
            </tbody>
        </table>
    </body>
    </body>
</html>
