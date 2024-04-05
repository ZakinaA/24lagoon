<%-- 
    Document   : consulterPompier
    Created on : 18 mars 2024, 12:03:07
    Author     : zakina
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Pompier"%>
<%@page import="model.Fonction"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SDIS WEB</title>
    </head>
    <body>
        <%
            ArrayList<Fonction> lesFonctions = (ArrayList)request.getAttribute("pLesFonctions");
        %>
        <%
            Pompier p = (Pompier)request.getAttribute("pPompier");
        %>
        <h1>Bienvenue <%  out.println(p.getPrenom());%>  <%  out.println(p.getNom());%></h1>
        <table>
            <tr>
                <td>Numero Bip : </td><td>bip bip</td>
            </tr>
            <tr>
                <td>Caserne : </td><td><%  out.println(p.getUneCaserne().getNom());%></td>
            </tr>
             <tr>
                <td>Grade : </td><td><%  out.println(p.getUnGrade().getLibelle());%></td>
            </tr>
            <tr>
                <td>Date Naissance : </td><td><%  out.println(p.getDateNaiss());%></td>
            </tr>
            <tr>
                <td>Indice : </td><td><%  out.println(p.getIndice());%></td>
            </tr>
        </table>
            <table>  
            <thead>
                <tr>             
                    <th>Id</th>
                    <th>Libelle</th>
                </tr>
            </thead>
            <tbody>
                <% if (lesFonctions != null && !lesFonctions.isEmpty()) { %>
                    <% for (Fonction f : lesFonctions) { %>
                        <tr>
                            <td><%= f.getId() %></td>
                            <td><%= f.getLibelle() %></td>                 
                        </tr>
                    <% } %>
                <% } else { %>
                    <tr>
                        <td colspan="2">Aucune fonction trouvée</td>
                    </tr>
                <% } %>
        </tbody>    
        </table>
    </body>
</html>
