<%-- 
    Document   : listerVehicule
    Created on : 31 mars 2024, 17:06:45
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
        <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>APPLICATION DE GESTION SDIS CALVADOS</title>
    </head>
    <body>
        <h1>Liste des véhicules</h1>
         <%
            ArrayList<Vehicule> lesVehicules = (ArrayList)request.getAttribute("vLesVehicules");
         %>
         
          <table>  
            <thead>
                <tr>             
                    <th>Id</th>
                    <th>Immatriculation</th>    
                    <th>Date Origine</th>
                    <th>Date Revision</th>
                    <th>Type</th>
                    <th>Caractéristiques</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <%
                        for (Vehicule v : lesVehicules)
                        {              
                            out.println("<tr><td>");
                            out.println(v.getId());
                            out.println("</a></td>");

                            out.println("<td><a href ='../ServletVehicule/consulter?idVehicule="+ v.getId()+ "'>");
                            out.println(v.getImmatriculation());
                            out.println("</td>");;
                            
                            out.println("<td>");
                            out.println(v.getDateOrigine());
                            out.println("</td>");;
                            
                            out.println("<td>");
                            out.println(v.getDateRevision());
                            out.println("</td>");;
                            
                            out.println("<td>");
                            out.println(v.getTypeVehicule().getNom());
                            out.println("</td>");
                            
                            out.println("<td>");
                            out.println(v.getTypeVehicule().getCaracteristiques());
                            out.println("</td>");
                        }
                    %>
                </tr>
            </tbody>
        </table>
    </body>
</html>