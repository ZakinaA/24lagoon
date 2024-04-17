<%-- 
    Document   : consulterIntervention
    Created on : 7 avr. 2024, 02:47:28
    Author     : alexi
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Intervention"%>
<%@page import="model.Pompier"%>
<%@page import="model.Vehicule"%>
<%@page import="java.util.ArrayList"%>
<%@ include file="PompierPage.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SDIS WEB</title>
    </head>
    
    <style>
        
    .main-content {
         margin-left: 80px;   
    }
        
    .table {
        box-shadow: 0px 10px 20px 0px rgba(0, 0, 0, 0.103);
        width: 550px;
        margin-bottom: 1rem;
        background-color: transparent;
    }

    .table-responsive {
        margin-left: 25px;
        margin-top: 30px;
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
    
    
    a {
        font-weight: 250;


    }
    
    .gauche {
        margin-left: 15px;
    }
    
    .card {
        margin-top: 60px;
        color: #4c4c4c;
        font-family: "Poppinss", sans-serif;
        font-family: "Poppins", sans-serif;
        box-shadow:0px 10px 20px 0px rgba(0, 0, 0, 0.103);
        height: 270px;
        width: 290px;
        background-color: white;
        padding: 10px;
        display: flex;
    }


    .para {
        width: 310px;
        font-size: 18px;
        font-weight: 300;
    }


    .border {
        padding-top:2px;
        padding-bottom: 2px;
        border: 1px solid black;
        padding-left: 4px;
        padding-right: 4px;
    }

    .details {
        font-size: 25px;
    }

    .main-content {
        display: flex;
        align-items: flex-start;
    }
 
</style>
    <body>
        <%
            Intervention i = (Intervention)request.getAttribute("iIntervention");
        %>
        
        <%
            ArrayList<Pompier> lesPompiers = (ArrayList)request.getAttribute("pLesPompiers");
        %>
        
        <%
            ArrayList<Vehicule> lesVehicules = (ArrayList)request.getAttribute("iLesVehicules");
        %>
    <div class="main-content">
            
                 
        <div class="card">
            <div class="gauche">
                <h1 class="details">Details</h1>
                <p class="para">Lieu : &nbsp;<span class="border" style="font-size: 16px;"><%  out.println(i.getLieu());%></span></p>
                <p class="para">Date : &nbsp;<span class="border" style="font-size: 16px;"><%  out.println(i.getDate());%></span></p>
                <p class="para">Heure d'appel : &nbsp;<span class="border" style="font-size: 16px;"><%  out.println(i.getHeureAppel());%></span></p>
                <p class="para">Heure d'arrivée : &nbsp;<span class="border" style="font-size: 16px;"><%  out.println(i.getHeureArrivee());%></span></p>
                <p class="para">Durée : &nbsp;<span class="border" style="font-size: 16px;"><%  out.println(i.getDuree());%></span></p>
            </div>
        </div>

         <div class="table-responsive">
             <table class="table table-data3">
                 <thead>
                     <tr>
                         <th>Nom</th>
                         <th>Prénom</th>
                         <th>Date de naissance</th>
                     </tr>
                 </thead>
                 <tbody>
                     <% if (lesPompiers != null && !lesPompiers.isEmpty()) { %>
                        <% for (Pompier p : lesPompiers) { %>
                         <tr>
                             <td><%= p.getNom() %></td>     
                             <td><%= p.getPrenom() %></td>                 
                             <td><%= p.getDateNaiss() %></td>                               
                         </tr>
                         <% } %>
                <% } else { %>
                    <tr>
                        <td colspan="3" style="text-align: center;">Aucun pompiers trouvés</td>
                    </tr>
                <% } %>
                 </tbody>
             </table>
         </div>

         <div class="table-responsive">
            <table class="table table-data3">
                <thead>
                    <tr>
                        <th>Immatriculation</th>
                        <th>Date Origine</th>
                        <th>Date Révision</th>
                    </tr>
                </thead>
                <tbody>
                    <% if (lesVehicules != null && !lesVehicules.isEmpty()) { %>
                        <% for (Vehicule v : lesVehicules) { %>
                        <tr>
                            <td><%= v.getImmatriculation() %></td>     
                            <td><%= v.getDateOrigine() %></td>                 
                            <td><%= v.getDateRevision() %></td>                               
                        </tr>
                        <% } %>
                <% } else { %>
                    <tr>
                        <td colspan="3" style="text-align: center;">Aucun véhicules trouvés</td>
                    </tr>
                <% } %>
                </tbody>
            </table>
        </div>
     </div>
</body>
</html>

