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
<%@ include file="PompierPage.jsp"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SDIS WEB</title>
    </head>
<style>

        
    .table {
        box-shadow: 0px 10px 20px 0px rgba(0, 0, 0, 0.103);
        width: 680px;
        margin-bottom: 1rem;
        background-color: transparent;
    }

    .table-responsive {
        margin-left: 25px;
        margin-top: 50px;
    }

    table {
        margin-left: 60px;
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
    

    .main-content {
        display: flex;
        align-items: flex-start;
    }
 
    .titre {
        margin-left: 85px;
        position: absolute;
        font-weight: 400;
    }
</style>
    <body>
         <%
            Caserne nom = (Caserne)request.getAttribute("CaserneNom");
         %>

            <%
                ArrayList<Pompier> lesPompiers = (ArrayList)request.getAttribute("pCasernePompier");
            %>
            
            <%
                ArrayList<Intervention> lesInterventions = (ArrayList)request.getAttribute("pCaserneIntervention");
            %>
         
    
    <div class="main-content">
        <h1 class="titre"><%= nom.getNom() %></h1>
         <div class="table-responsive">
             <table class="table table-data3">
                 <thead>
                     <tr>
                         <th>Nom</th>
                         <th>Prénom</th>
                     </tr>
                 </thead>
                 <tbody>
                     <% if (lesPompiers != null && !lesPompiers.isEmpty()) { %>
                        <% for (Pompier p : lesPompiers) { %>
                         <tr>
                             <td><%= p.getNom() %></td>     
                             <td><%= p.getPrenom() %></td>                 
                         </tr>
                         <% } %>
                <% } else { %>
                    <tr>
                        <td colspan="2" style="text-align: center;">Aucun pompiers trouvés</td>
                    </tr>
                <% } %>
                 </tbody>
             </table>
         </div>
         <div class="table-responsive">
            <table class="table table-data3">
                <thead>
                    <tr>
                        <th>Lieu</th>
                        <th>Date</th>
                    </tr>
                </thead>
                <tbody>
                     <% if (lesInterventions != null && !lesInterventions.isEmpty()) { %>
                        <% for (Intervention i : lesInterventions) { %>
                        <tr>
                             <td><%= i.getLieu() %></td>
                             <td><%= i.getDate() %></td>                           
                        </tr>
                        <% } %>
                <% } else { %>
                    <tr>
                        <td colspan="2" style="text-align: center;">Aucune interventions trouvés</td>
                    </tr>
                <% } %>
                </tbody>
            </table>
        </div>
     </div>
    </body>
    
    
</html>
