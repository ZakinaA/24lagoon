<%-- 
    Document   : listerTypeVehicule
    Created on : 7 avr. 2024, 16:52:28
    Author     : alexi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.TypeVehicule"%>
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
            ArrayList<TypeVehicule> lesTypesVehicules = (ArrayList)request.getAttribute("vLesTypesVehicules");
         %>
         
          <table>  
            <thead>
                <tr>             
                    <th>Id</th>
                    <th>Nom</th>    
                    <th>Caractéristiques</th>
            </thead>
            <tbody>
                <tr>
                    <%
                        for (TypeVehicule tv : lesTypesVehicules)
                        {              
                            out.println("<tr><td>");
                            out.println(tv.getId());
                            out.println("</a></td>");

                            out.println("<td><a href ='../ServletTypeVehicule/consulter?idTypeVehicule="+ tv.getId()+ "'>");
                            out.println(tv.getNom());
                            out.println("</td>");;
                            
                            out.println("<td>");
                            out.println(tv.getCaracteristiques());
                            out.println("</td>");;
                        }
                    %>
                </tr>
            </tbody>
        </table>
    </body>
</html>