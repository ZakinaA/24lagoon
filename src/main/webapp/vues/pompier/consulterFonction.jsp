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
                <tr>
                    <%
                        for (Pompier p : lesPompiers)
                        {              
                            out.println("<tr><td>");
                            out.println(p.getId());
                            out.println("</td>");

                            out.println("<td>");
                            out.println(p.getNom());
                            out.println("</td>");;

                            out.println("<td>");
                            out.println(p.getPrenom());
                            out.println("</td>");                     
                        }
                    %>
                </tr>
            </tbody>
        </table>
    </body>
    </body>
</html>