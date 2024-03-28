<%-- 
    Document   : listerGrade
    Created on : 28 mars 2024, 15:04:15
    Author     : ts1sio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Grade"%>
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
        <h1>Liste des grades</h1>
         <%
            ArrayList<Grade> lesGrades = (ArrayList)request.getAttribute("gLesGrades");
         %>
         
          <table>  
            <thead>
                <tr>             
                    <th>id</th>
                    <th>Libelle</th>    
                    <th>Surgrade</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <%
                        for (Grade g : lesGrades)
                        {              
                            out.println("<tr><td>");
                            out.println(g.getId());
                            out.println("</td>");

                            out.println("<td>");
                            out.println(g.getLibelle());
                            out.println("</td>");;
                            
                            out.println("<td>");
                            out.println(g.getUnSurgrade().getLibelle());
                            out.println("</td>");
                        }
                    %>
                </tr>
            </tbody>
        </table>
    </body>
</html>
