<%-- 
    Document   : consulterFonction
    Created on : 2 avr. 2024, 20:42:21
    Author     : alexi
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.Pompier"%>
<%@page import="model.Fonction"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            Fonction nom = (Fonction)request.getAttribute("FonctionNom");
        %>
        
         <%
                ArrayList<Pompier> lesPompiers = (ArrayList)request.getAttribute("pFonctionPompier");
            %>
    <div class="main-content"> 
           <h1 class="titre"> <%  out.println(nom.getLibelle());%></h1>
                    
            <div class="table-responsive">
                <table class="table table-data3">
                    <thead>
                        <tr>
                            <th>Nom</th>
                            <th>Prenom</th> 
                            <th>Date de Naissance</th>
                            <th>Indice</th>
                        </tr>
                    </thead>
                    <tbody>
                          <% if (lesPompiers != null && !lesPompiers.isEmpty()) { %>
                        <% for (Pompier p : lesPompiers) { %>
                            <tr>
                                <td><%= p.getNom() %></td>
                                <td><%= p.getPrenom() %></td> 
                                <td><%= p.getDateNaiss() %></td>            
                                <td><%= p.getIndice() %></td>            
                            </tr>
                        <% } %>
                    <% } else { %>
                        <tr>
                            <td " colspan="4"  style="text-align: center;">Aucun pompier trouvé</td>
                        </tr>
                    <% } %>
                    </tbody>
                </table>
            </div>
        </div>
</html>