<%-- 
    Document   : listerIntervention
    Created on : 6 avr. 2024, 14:58:37
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
        <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>APPLICATION DE GESTION SDIS CALVADOS</title>
    </head>
    <body>
        <h1>Liste des interventions</h1>
            <%
                ArrayList<Intervention> lesInterventions = (ArrayList)request.getAttribute("iLesInterventions");
            %>
            <table>  
            <thead>
                <tr>             
                    <th>Id</th>
                    <th>Lieu</th>
                    <th>Date</th>
                    <th>Heure d'appel</th>   
                    <th>Heure d'arrivée</th> 
                    <th>Duree</th> 
                </tr>
            </thead>
            <tbody>
                <tr>
                    <%
                        for (Intervention i : lesInterventions)
                        {              
                            out.println("<tr><td>");
                            out.println(i.getId());
                            out.println("</td>");

                            out.println("<td>");
                            out.println(i.getLieu());
                            out.println("</td>");;

                            out.println("<td>");
                            out.println(i.getDate());
                            out.println("</td>");
                           
                            out.println("<td>");
                            out.println(i.getHeureAppel());
                            out.println("</td>");
                            
                            out.println("<td>");
                            out.println(i.getHeureArrivee());
                            out.println("</td>");
                            
                            out.println("<td>");
                            out.println(i.getDuree());
                            out.println("</td>");   
                        }
                    %>
                </tr>
            </tbody>
        </table>
    </body>
    </body>
</html>

