<%-- 
    Document   : consulterSituation
    Created on : 6 avr. 2024, 20:04:03
    Author     : Minh-Tri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Intervention"%>
<%@page import="java.util.ArrayList"%>
<%@ include file="PompierPage.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SDIS WEB</title>
    </head>
    
        <style>
        
        .table {
            box-shadow: 0px 10px 20px 0px rgba(0, 0, 0, 0.103);
            width: 100%;
            max-width: 100%;
            margin-bottom: 1rem;
            background-color: transparent;
        }

        .table-responsive {
            margin-left: 35px;
            margin-top: 30px;
            margin-right: 40px; 
        }

        table {
            margin-top: 30px;
            border-collapse: collapse;
        }

        .table-data3 thead {
            background: #6d6d6d;
        }

        .table-data3 tbody tr td:last-child {
            padding-right: 50px;
            
        }

        .table-data3 thead tr th {
            font-size: 16px;
            color: #fff;
            font-weight: 400;
            text-transform: capitalize;
            padding: 18px 40px;
            padding-right: 10px;
        }

        .table-data3 tbody td {
            text-align:center;
            border-bottom: 1px solid #f5f5f5;
            background: #fff;
            font-size: 14px;
            color: #808080;
            padding: 12px 40px;
            padding-right: 10px;
        }
        
        .titre {
            font-weight: 100;
            margin-left: 35px;
        }
     
    </style>
    <body>
         <%
            ArrayList<Intervention> lesInterventions = (ArrayList)request.getAttribute("sLesSituations");
        %>
       
        <div class="main-content"> 
           <h1 class="titre">Voici les interventions de la situation</h1>
                    
            <div class="table-responsive">
                <table class="table table-data3">
                    <thead>
                        <tr>
                            <th>Lieu</th>
                            <th>Date</th>
                            <th>Heure d'appel</th>
                            <th>Heure d'arriver</th>
                            <th>Duree</th>
                        </tr>
                    </thead>
                    <tbody>
                         <% if (lesInterventions != null && !lesInterventions.isEmpty()) { %>
                        <% for (Intervention i : lesInterventions) { %>
                            <tr>
                                <td><%= i.getLieu() %></td>     
                                <td><%= i.getDate() %></td>                 
                                <td><%= i.getHeureAppel() %></td>                 
                                <td><%= i.getHeureArrivee() %></td>                 
                                <td><%= i.getDuree() %></td>                 
                            </tr>
                        <% } %>
                    <% } else { %>
                        <tr>
                            <td " colspan="5"  style="text-align: center;">Aucune intervention trouvée</td>
                        </tr>
                    <% } %>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>