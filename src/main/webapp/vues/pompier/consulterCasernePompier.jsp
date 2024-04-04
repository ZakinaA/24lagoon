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
        <h1>Voici les pompiers de la caserne  <%  out.println(nom.getNom());%></h1>

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
                <tbody
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
