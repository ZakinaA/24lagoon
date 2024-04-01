<%-- 
    Document   : listerCasernes
    Created on : 28 mars 2024, 15:13:08
    Author     : ts1sio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Caserne"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Listes des casernes</h1>
         <%
            ArrayList<Caserne> lesCasernes = (ArrayList)request.getAttribute("clesCasernes");
         %>
        <table>  
            <thead>
                <tr>             
                    <th>id</th>
                    <th>nom</th>
                    <th>rue</th>
                    <th>copos</th>
                    <th>ville</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <%
                        for (Caserne c : lesCasernes)
                        {              
                            out.println("<tr><td>");
                            out.println(c.getId());
                            out.println("</a></td>");

                            out.println("<td><a href ='../ServletCaserne/consulter?idCaserne="+ c.getId()+ "'>");
                            out.println(c.getNom());
                            out.println("</td>");;

                            out.println("<td>");
                            out.println(c.getRue());
                            out.println("</td>");
                           
                            out.println("<td>");
                            out.println(c.getCopos());
                            out.println("</td>");
                            
                            out.println("<td>");
                            out.println(c.getVille());
                            out.println("</td>");
                        }
                    %>
                </tr>
            </tbody>
        </table>
    </body>
</html>
