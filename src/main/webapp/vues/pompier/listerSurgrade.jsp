<%-- 
    Document   : listerSurgrade
    Created on : 4 avr. 2024, 11:07:25
    Author     : ts1sio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Surgrade"%>
<%@page import="java.util.ArrayList"%>
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
        <h1>Liste des surgrades</h1>
            <%
                ArrayList<Surgrade> lesSurgrades = (ArrayList)request.getAttribute("pLesSurgrades");
            %>
            <table>  
            <thead>
                <tr>             
                    <th>Id</th>
                    <th>Libelle</th>              
                </tr>
            </thead>
            <tbody>
                <tr>
                    <%
                        for (Surgrade s : lesSurgrades)
                        {              
                            out.println("<tr><td>");
                            out.println(s.getId());
                            out.println("</td>");

                            out.println("<td>");
                            out.println(s.getLibelle());
                            out.println("</td>");; 
                        }
                    %>
                </tr>
            </tbody>
        </table>
    </body>
    </body>
</html>

