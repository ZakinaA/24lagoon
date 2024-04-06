<%-- 
    Document   : listerSituation
    Created on : 6 avr. 2024, 20:01:08
    Author     : Minh-Tri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Situation"%>
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
        <h1>Liste des situations</h1>
         <%
            ArrayList<Situation> lesSituations = (ArrayList)request.getAttribute("sLesSituations");
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
                        for (Situation s : lesSituations)
                        {              
                            out.println("<tr><td>");
                            out.println(s.getId());
                            out.println("</a></td>");

                            out.println("<td><a href ='../ServletSituation/consulter?idSituation="+ f.getId()+ "'>");
                            out.println(s.getLibelle());
                            out.println("</td>");;
                        }
                    %>
                </tr>
            </tbody>
        </table>
    </body>
</html>
