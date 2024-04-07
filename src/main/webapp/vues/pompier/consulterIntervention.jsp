<%-- 
    Document   : consulterIntervention
    Created on : 7 avr. 2024, 02:47:28
    Author     : alexi
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Intervention"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SDIS WEB</title>
    </head>
    <body>
        <%
            Intervention i = (Intervention)request.getAttribute("iIntervention");
        %>
        <h1>Information sur l'invertention <%  out.println(i.getId());%></h1>
        <table>
            <tr>
                <td>Lieu : </td><td><%  out.println(i.getLieu());%></td>
            </tr>
            <tr>
                <td>Date : </td><td><%  out.println(i.getDate());%></td>
            </tr>
             <tr>
                <td>Heure d'appel : </td><td><%  out.println(i.getHeureAppel());%></td>
            </tr>
            <tr>
                <td>Heure d'arrivée : </td><td><%  out.println(i.getHeureArrivee());%></td>
            </tr>
            <tr>
                <td>Durée : </td><td><%  out.println(i.getDuree());%></td>
            </tr>
            <tr>
                <td>Caserne : </td><td><%  out.println(i.getCaserne().getNom());%></td>
            </tr>
        </table>      
    </body>
</html>

