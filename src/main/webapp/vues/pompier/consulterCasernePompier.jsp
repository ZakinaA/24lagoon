<%-- 
    Document   : consulterCasernePompier
    Created on : 1 avr. 2024, 12:48:38
    Author     : alexi
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Pompier"%>
<%@page import="model.Caserne"%>
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
        <h1>Voici les pompiers de la caserne</h1>

            <%
                ArrayList<Pompier> lesPompiers = (ArrayList)request.getAttribute("pCasernePompier");
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